1 controller 控制器生成，必须 别名+Con,必须全部继承 BaseCon
        方法定义，必须大写开头，驼峰命令

2 模型生成必须 别名+Model,必须全部继承 BaseModel
        方法定义，必须大写开头，驼峰命令
3 所有 controller中的查询必须使用 模型查询，所有 模型查询涉及到 分页的，必须使用 paginate() 

4 所有模型操作，查询单表数据分页使用 PageList(), 单表数据不分页使用 PageData() ,单表一条数据使用 PageDataOne()

5 如果表中存在状态，或者 type 这种固定的参数的， 必须定义到模型中，比如  const STATUS_OK = 0

6 所有接口返回数据，必须经过 common.php 中的 Show方法

7 多有返回的 msg 都需要定义 到 多语言 lang中 ，所有返回的状态码，都需要定义到 Code.php 中

8 所有的计划任务，需要定义在  command 中

9 路由需要分开，1 不需要token ，2 需要token，分组分开，定义明确

10 所有参数验证需要过 validate 验证器
        验证器使用代码
                $postField = 'phone,pwd,captcha,app_version';
                $post = $this->request->only(explode(',', $postField), 'post', null);
                try {
                validate(\app\validate\LoginValidate::class)
                ->scene('login')
                ->check($post);
                } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                return show(0, [], $e->getError());
                }

11  所有需要分页的参数   都需要前端传 limit 每页显示数量  page 当前页 每页默认数量都是 20条，默认当前页是 1，所有接口都是以用户 的id为 选择条件，所有 表备注字段都不显示，备注是汉语，不能显示出来


上传图片存放位置
 $saveDir = dirname(app()->getRootPath()) . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . 种类 . DIRECTORY_SEPARATOR . date('Ym');
