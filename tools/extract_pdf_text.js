const fs = require("fs");
const zlib = require("zlib");

function readPdfObjects(buffer) {
  const source = buffer.toString("latin1");
  const objectRegex = /(\d+)\s+(\d+)\s+obj\b([\s\S]*?)endobj/g;
  const objects = new Map();
  let match;

  while ((match = objectRegex.exec(source))) {
    const objectId = Number(match[1]);
    const body = match[3];
    const streamMatch = body.match(/([\s\S]*?)stream\r?\n([\s\S]*?)\r?\nendstream/s);

    objects.set(objectId, {
      raw: body,
      dict: streamMatch ? streamMatch[1] : body,
      stream: streamMatch ? Buffer.from(streamMatch[2], "latin1") : null,
    });
  }

  return { source, objects };
}

function maybeInflate(streamBuffer, dictText) {
  if (!streamBuffer) {
    return null;
  }

  const hasFlate = /\/Filter\s*\/FlateDecode\b/.test(dictText);
  if (!hasFlate) {
    return streamBuffer;
  }

  try {
    return zlib.inflateSync(streamBuffer);
  } catch (error) {
    return null;
  }
}

function parseUnicodeHex(hexText) {
  const clean = hexText.replace(/\s+/g, "");
  const bytes = Buffer.from(clean, "hex");

  if (bytes.length === 0) {
    return "";
  }

  if (bytes.length % 2 === 0) {
    try {
      return bytes.toString("utf16be");
    } catch (error) {
    }
  }

  return bytes.toString("latin1");
}

function parseToUnicodeMap(text) {
  const mapping = new Map();
  const lines = text.replace(/\r/g, "").split("\n");
  let index = 0;

  while (index < lines.length) {
    const line = lines[index].trim();

    if (line.endsWith("beginbfchar")) {
      index += 1;
      while (index < lines.length && !lines[index].includes("endbfchar")) {
        const entry = lines[index].trim().match(/^<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>$/);
        if (entry) {
          mapping.set(entry[1].toUpperCase(), parseUnicodeHex(entry[2]));
        }
        index += 1;
      }
    } else if (line.endsWith("beginbfrange")) {
      index += 1;
      while (index < lines.length && !lines[index].includes("endbfrange")) {
        const lineText = lines[index].trim();
        const arrayRange = lineText.match(/^<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*\[(.+)\]$/);
        if (arrayRange) {
          const start = parseInt(arrayRange[1], 16);
          const end = parseInt(arrayRange[2], 16);
          const values = [...arrayRange[3].matchAll(/<([0-9A-Fa-f]+)>/g)].map((item) => item[1]);
          for (let code = start; code <= end && code - start < values.length; code += 1) {
            mapping.set(code.toString(16).toUpperCase().padStart(arrayRange[1].length, "0"), parseUnicodeHex(values[code - start]));
          }
        } else {
          const sequentialRange = lineText.match(/^<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>\s*<([0-9A-Fa-f]+)>$/);
          if (sequentialRange) {
            const start = parseInt(sequentialRange[1], 16);
            const end = parseInt(sequentialRange[2], 16);
            const base = parseInt(sequentialRange[3], 16);
            const fromLength = sequentialRange[1].length;

            for (let code = start; code <= end; code += 1) {
              const mapped = (base + (code - start)).toString(16).toUpperCase().padStart(sequentialRange[3].length, "0");
              mapping.set(code.toString(16).toUpperCase().padStart(fromLength, "0"), parseUnicodeHex(mapped));
            }
          }
        }
        index += 1;
      }
    }

    index += 1;
  }

  return mapping;
}

function extractFontMaps(objects) {
  const cmapByObjectId = new Map();
  for (const [objectId, object] of objects.entries()) {
    const data = maybeInflate(object.stream, object.dict);
    const text = data ? data.toString("latin1") : object.raw;
    if (!/begincmap/.test(text)) {
      continue;
    }
    cmapByObjectId.set(objectId, parseToUnicodeMap(text));
  }

  const fontMaps = new Map();
  for (const [objectId, object] of objects.entries()) {
    const toUnicodeMatch = object.dict.match(/\/ToUnicode\s+(\d+)\s+0\s+R/);
    if (!toUnicodeMatch) {
      continue;
    }

    fontMaps.set(objectId, cmapByObjectId.get(Number(toUnicodeMatch[1])) || new Map());
  }

  return fontMaps;
}

function extractPageSequence(objects) {
  const pages = [];
  for (const [objectId, object] of objects.entries()) {
    if (!/\/Type\s*\/Page\b/.test(object.dict)) {
      continue;
    }

    const contents = [...object.dict.matchAll(/\/Contents\s+(\d+)\s+0\s+R/g)].map((item) => Number(item[1]));
    if (contents.length === 0) {
      const arrayMatch = object.dict.match(/\/Contents\s*\[(.*?)\]/s);
      if (arrayMatch) {
        for (const item of arrayMatch[1].matchAll(/(\d+)\s+0\s+R/g)) {
          contents.push(Number(item[1]));
        }
      }
    }

    const fontByAlias = collectFontAliasesForPage(objectId, objects);

    pages.push({ objectId, contents, fontByAlias });
  }

  return pages.sort((left, right) => left.objectId - right.objectId);
}

function collectFontAliasesForPage(pageObjectId, objects) {
  const aliases = new Map();
  const visitedParents = new Set();
  let currentId = pageObjectId;

  while (currentId && !visitedParents.has(currentId) && objects.has(currentId)) {
    visitedParents.add(currentId);
    const currentObject = objects.get(currentId);
    const currentAliases = collectFontAliases(currentObject.dict, objects);
    for (const [alias, objectId] of currentAliases.entries()) {
      if (!aliases.has(alias)) {
        aliases.set(alias, objectId);
      }
    }

    const parentMatch = currentObject.dict.match(/\/Parent\s+(\d+)\s+0\s+R/);
    currentId = parentMatch ? Number(parentMatch[1]) : null;
  }

  return aliases;
}

function collectFontAliases(dictText, objects, visited = new Set()) {
  const aliases = new Map();
  const directFonts = dictText.match(/\/Font\s*<<(.*?)>>/s);

  if (directFonts) {
    for (const fontRef of directFonts[1].matchAll(/\/(F\d+)\s+(\d+)\s+0\s+R/g)) {
      aliases.set(fontRef[1], Number(fontRef[2]));
    }
  }

  const resourceRef = dictText.match(/\/Resources\s+(\d+)\s+0\s+R/);
  if (resourceRef) {
    const resourceId = Number(resourceRef[1]);
    if (!visited.has(resourceId) && objects.has(resourceId)) {
      visited.add(resourceId);
      const nested = collectFontAliases(objects.get(resourceId).dict, objects, visited);
      for (const [alias, objectId] of nested.entries()) {
        aliases.set(alias, objectId);
      }
    }
  }

  return aliases;
}

function decodeHexString(hex, currentMap) {
  const clean = hex.replace(/\s+/g, "").toUpperCase();
  if (!currentMap || currentMap.size === 0) {
    return parseUnicodeHex(clean);
  }

  let cursor = 0;
  let output = "";
  while (cursor < clean.length) {
    const code = clean.slice(cursor, cursor + 4);
    output += currentMap.get(code) || "";
    cursor += 4;
  }
  return output;
}

function decodeLiteralString(text, currentMap) {
  let value = "";
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index];
    if (char === "\\" && index + 1 < text.length) {
      const next = text[index + 1];
      const escapes = {
        n: "\n",
        r: "\r",
        t: "\t",
        b: "\b",
        f: "\f",
        "(": "(",
        ")": ")",
        "\\": "\\",
      };
      if (escapes[next]) {
        value += escapes[next];
        index += 1;
        continue;
      }
    }
    value += char;
  }

  if (!currentMap || currentMap.size === 0) {
    return value;
  }

  let output = "";
  for (const char of value) {
    const key = char.charCodeAt(0).toString(16).toUpperCase().padStart(4, "0");
    output += currentMap.get(key) || char;
  }
  return output;
}

function cleanText(text) {
  return text
    .replace(/\u200B/g, "")
    .replace(/\u0000/g, "")
    .replace(/[ \t]+/g, " ")
    .replace(/ *\n */g, "\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

function extractPageText(page, objects, fontMaps) {
  const chunks = [];
  let currentFont = null;

  for (const contentId of page.contents) {
    const contentObject = objects.get(contentId);
    if (!contentObject) {
      continue;
    }

    const data = maybeInflate(contentObject.stream, contentObject.dict);
    if (!data) {
      continue;
    }

    const streamText = data.toString("latin1");
    const tokens =
      streamText.match(
        /\/F\d+\s+[\d.]+\s+Tf|-?[\d.]+\s+-?[\d.]+\s+Td|-?[\d.]+\s+-?[\d.]+\s+TD|-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+Tm|<[^>]+>\s*Tj|\[(?:[\s\S]*?)\]\s*TJ|\([^\)]*(?:\\\)[^\)]*)*\)\s*Tj|T\*|ET|BT/g,
      ) || [];

    for (const token of tokens) {
      const fontMatch = token.match(/^\/(F\d+)\s+[\d.]+\s+Tf$/);
      if (fontMatch) {
        const fontObjectId = page.fontByAlias.get(fontMatch[1]);
        currentFont = fontObjectId ? fontMaps.get(fontObjectId) || new Map() : null;
        continue;
      }

      const hexMatch = token.match(/^<([^>]+)>\s*Tj$/);
      if (hexMatch) {
        chunks.push(decodeHexString(hexMatch[1], currentFont));
        continue;
      }

      const literalMatch = token.match(/^\(((?:\\.|[^\\)])*)\)\s*Tj$/);
      if (literalMatch) {
        chunks.push(decodeLiteralString(literalMatch[1], currentFont));
        continue;
      }

      const arrayMatch = token.match(/^\[(.*)\]\s*TJ$/s);
      if (arrayMatch) {
        const inner = arrayMatch[1];
        for (const item of inner.matchAll(/<([^>]+)>|\(((?:\\.|[^\\)])*)\)|(-?\d+(?:\.\d+)?)/g)) {
          if (item[1]) {
            chunks.push(decodeHexString(item[1], currentFont));
          } else if (item[2]) {
            chunks.push(decodeLiteralString(item[2], currentFont));
          } else if (item[3] && Number(item[3]) < -120) {
            chunks.push(" ");
          }
        }
        continue;
      }

      const moveMatch = token.match(/^(-?[\d.]+)\s+(-?[\d.]+)\s+T[dD]$/);
      if (moveMatch) {
        if (Math.abs(Number(moveMatch[2])) >= 8) {
          chunks.push("\n");
        }
        continue;
      }

      if (/^-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+-?[\d.]+\s+Tm$/.test(token)) {
        chunks.push("\n");
        continue;
      }

      if (token === "T*" || token === "ET") {
        chunks.push("\n");
      }
    }
  }

  return cleanText(chunks.join(""));
}

function main() {
  const inputPath = process.argv[2];
  const outputPath = process.argv[3];

  if (!inputPath || !outputPath) {
    console.error("Usage: node tools/extract_pdf_text.js <input.pdf> <output.txt>");
    process.exit(1);
  }

  const buffer = fs.readFileSync(inputPath);
  const { objects } = readPdfObjects(buffer);
  const fontMaps = extractFontMaps(objects);
  const pages = extractPageSequence(objects);
  const output = pages
    .map((page, index) => `--- PAGE ${index + 1} ---\n${extractPageText(page, objects, fontMaps)}`)
    .join("\n\n");

  fs.writeFileSync(outputPath, output, "utf8");
  console.log(`Extracted ${pages.length} pages to ${outputPath}`);
}

main();
