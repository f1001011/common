<?php
declare(strict_types=1);

namespace app\controller\payment;

use app\controller\BaseCon;
use app\model\CommonPayCashModel;

/**
 * 提现控制器
 * 负责处理用户提现记录相关的业务逻辑
 * 提供提现记录查询，用于用户查看提现历史和状态
 */
class PayCashCon extends BaseCon
{
    /**
     * 提现记录列表接口
     * 获取当前用户的提现记录列表，按ID倒序排列
     * 用于用户中心展示提现历史记录
     * 
     * @return mixed 返回提现记录列表数据，包含提现金额、手续费、实际到账金额、状态、申请时间等
     */
    public function GetCashList()
    {
        // 定义需要接收的参数字段：page-当前页码, limit-每页数量
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        // 获取分页参数，默认为page=1, limit=20
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        // 获取当前登录用户的ID
        $uId = $this->request->UserID;
        
        // 构建查询条件：当前用户ID
        $map = ['u_id' => $uId];
        
        // 调用模型的分页查询方法，按ID倒序排列
        $list = CommonPayCashModel::PageList($map, '*', (int)$page, (int)$limit, 'id desc');
        
        // 返回成功数据
        return Show(SUCCESS, $list);
    }
}
