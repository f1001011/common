<?php
declare(strict_types=1);

namespace app\controller\activity;

use app\controller\BaseCon;
use app\model\CommonWithdrawShowcaseModel;
use app\model\CommonWithdrawLikeModel;
use app\model\CommonWithdrawCommentModel;

/**
 * 提现凭证展示控制器
 */
class WithdrawShowcaseCon extends BaseCon
{
    /**
     * 展示列表
     */
    public function GetShowcaseList()
    {
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 10;
        
        $map = ['status' => CommonWithdrawShowcaseModel::STATUS_SHOW];
        
        $list = CommonWithdrawShowcaseModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        if ($list) {
            foreach ($list as &$item) {
                $likeCount = CommonWithdrawLikeModel::where('showcase_id', $item['id'])->count();
                $item['like_count'] = $likeCount;
            }
        }
        
        return Show(SUCCESS, $list);
    }
    
    /**
     * 展示详情
     * 参数: id(必传), plpage(评论分页-当前页), pllimit(评论分页-每页数量)
     * 说明: 如果传入plpage和pllimit，则同时返回评论列表
     */
    public function GetShowcaseDetail()
    {
        $postField = 'id,plpage,pllimit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $id = $post['id'] ?? 0;
        $plpage = $post['plpage'] ?? 0;
        $pllimit = $post['pllimit'] ?? 20;
        
        if (!$id) {
            return Show(ERROR, [], 'id_required');
        }
        
        $detail = CommonWithdrawShowcaseModel::PageDataOne(['id' => $id, 'status' => CommonWithdrawShowcaseModel::STATUS_SHOW]);
        
        if (!$detail) {
            return Show(ERROR, [], 'showcase_not_found');
        }
        
        $likeCount = CommonWithdrawLikeModel::where('showcase_id', $id)->count();
        $detail['like_count'] = $likeCount;
        
        // 如果传入了评论分页参数，则查询评论列表
        if ($plpage > 0) {
            $commentMap = ['showcase_id' => $id];
            $commentList = CommonWithdrawCommentModel::PageList($commentMap, '*', (int)$plpage, (int)$pllimit, 'id desc');
            $detail['comment_list'] = $commentList;
        }
        
        return Show(SUCCESS, $detail);
    }
    
    /**
     * 评论列表
     */
    public function GetCommentList()
    {
        $postField = 'showcase_id,page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        $showcaseId = $post['showcase_id'] ?? 0;
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        
        if (!$showcaseId) {
            return Show(ERROR, [], 'showcase_id_required');
        }
        
        $map = ['showcase_id' => $showcaseId];
        
        $list = CommonWithdrawCommentModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        return Show(SUCCESS, $list);
    }
}
