<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/RSS.php';

// 管理画面トップページ 認証済み
class admin_page_top extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        
        $this->set($v);

        // ダッシュボード用（暫定）
        $member_count = $this->_getMemberCount();
        $member_count_active = $this->_getMemberCountActive();
        $member_rate_active = ($member_count_active / $member_count) * 100;
        $friend_count = $this->_getFriendCount();
        $friend_count_avg = $friend_count / $member_count;
        $this->set('info_member_count', $member_count);
        $this->set('info_member_count_yesterday', $this->_getMemberCountYesterday());
        $this->set('info_commu_count', $this->_getCommuCount());
        $this->set('info_member_rate_active', $member_rate_active);
        $this->set('info_friend_count_avg', $friend_count_avg);
        $this->set('info_diary_count_today', $this->_getDiaryCountToday());
        $this->set('info_diary_count_yesterday', $this->_getDiaryCountYesterday());

        return 'success';
    }

    /**
     * 総メンバー数
     */
    function _getMemberCount()
    {
        $sql = 'SELECT COUNT(*) FROM c_member';
        return db_get_one($sql);
    }
    
    /**
     * 前日登録メンバー数
     */
    function _getMemberCountYesterday()
    {
        $yesterday = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')));
        $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));
        
        $sql = 'SELECT COUNT(*) FROM c_member WHERE r_date >= ? AND r_date < ?';
        $params = array($yesterday, $today);
        return db_get_one($sql, $params);
    }
    
    /**
     * 総コミュニティ数
     */
    function _getCommuCount()
    {
        $sql = 'SELECT COUNT(*) FROM c_commu';
        return db_get_one($sql);
    }
    
    /**
     * アクティブメンバー数
     */
    function _getMemberCountActive()
    {
        $threedaysago = date('Y-m-d H:i:s', strtotime('-3 days'));

        $sql = 'SELECT COUNT(*) FROM c_member WHERE access_date > ?';
        $params = array($threedaysago);
        return db_get_one($sql, $params);
    }
    
    /**
     * 総フレンド数
     */
    function _getFriendCount()
    {
        $sql = 'SELECT COUNT(*) FROM c_friend';
        return db_get_one($sql);
    }
    
    /**
     * 今日の日記件数
     */
    function _getDiaryCountToday()
    {
        $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));
        
        $sql = 'SELECT COUNT(*) FROM c_diary WHERE r_datetime >= ?';
        $params = array($today);
        return db_get_one($sql, $params);
    }
    
    /**
     * 前日の日記件数
     */
    function _getDiaryCountYesterday()
    {
        $yesterday = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')));
        $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));
        
        $sql = 'SELECT COUNT(*) FROM c_diary WHERE r_datetime >= ? AND r_datetime < ?';
        $params = array($yesterday, $today);
        return db_get_one($sql, $params);
    }
}

?>
