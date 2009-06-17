<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_member = db_member_c_member4c_member_id($u);

        if ($requests['rss']) {
            $c_member['rss'] = $requests['rss'];
        }

        $this->set('password_query_list', p_common_c_password_query4null());
        $this->set('c_member', $c_member);
        $this->set('c_member_id_block', db_member_c_member_id_block4c_member_id($u));
        $this->set('daily_news_day_str', str_replace(',', '・', DAILY_NEWS_DAY));
        if (DAILY_NEWS_DAY) {
            $this->set('daily_news_day_num', count(explode(',', DAILY_NEWS_DAY)));
        } else {
            $this->set('daily_news_day_num', 0);
        }
        $this->set('OPENPNE_URL', OPENPNE_URL);
        $this->set('SNS_NAME', SNS_NAME);
        $this->set('is_shinobiashi', db_member_is_shinobiashi($u));

        $this->set('is_unused_daily_news', util_is_unused_mail('m_pc_daily_news'));
        $this->set('is_unused_ashiato', util_is_unused_mail('m_pc_ashiato'));
        $this->set('is_unused_rank_up', util_is_unused_mail('m_pc_rank_up'));

        return 'success';
    }
}

?>
