<?php
declare(strict_types=1);

namespace app\controller\config;

use app\controller\BaseCon;
use app\model\CommonEmailModel;

/**
 * 邮件控制器
 * 负责处理用户邮件(站内信)相关的业务逻辑
 * 提供邮件列表查询、已发送邮件查看等功能
 */
class EmailCon extends BaseCon
{
    /**
     * 邮件列表接口
     * 获取当前用户已接收的邮件列表，按未读状态和ID倒序排列
     * 用于用户查看系统发送的站内邮件通知
     * 
     * @return mixed 返回邮件列表数据，包含邮件标题、内容、发送时间、已读状态等
     */
    public function GetEmailList()
    {
        // 定义需要接收的参数字段：page-当前页码, limit-每页数量
        $postField = 'page,limit';
        $post = $this->request->only(explode(',', $postField), 'post', null);
        
        // 获取分页参数，默认为page=1, limit=20
        $page = $post['page'] ?? 1;
        $limit = $post['limit'] ?? 20;
        // 获取当前登录用户的ID
        $userId = $this->request->UserID;
        
        // 构建查询条件：已发送的邮件 + 当前用户的邮件
        $map = [
            'is_send' => CommonEmailModel::IS_SEND_YES, // 已发送状态
            'user_id' => $userId, // 当前用户ID
        ];
        
        // 调用模型的分页查询方法，按已读状态正序(未读在前)、ID倒序排列
        $list = CommonEmailModel::PageList($map, '*', (int)$page, (int)$limit, 'is_read asc, id desc');
        
        // 返回成功数据
        return Show(SUCCESS, $list);
    }
}
