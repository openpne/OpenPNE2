<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $c_commu_id = $requests['target_c_commu_id'];

        $c_commu = p_c_home_c_commu4c_commu_id($c_commu_id);
        //繧ｳ繝溘Η繝九ユ繧｣縺ｮ蟄伜惠縺ｮ譛臥┌
        if (!$c_commu) {
            openpne_redirect('pc', 'page_h_err_c_home');
        }

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));

        $this->set('c_commu', $c_commu);

        $this->set('is_c_commu_admin', _db_is_c_commu_admin($c_commu_id, $u));
        $this->set('is_c_commu_member', _db_is_c_commu_member($c_commu_id, $u));
        $this->set('is_c_commu_view', p_common_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u));
        $this->set('is_receive_mail', db_commu_is_receive_mail_ktai($c_commu_id, $u));
        $this->set('is_receive_mail_pc', db_commu_is_receive_mail_pc($c_commu_id, $u));
        $this->set('is_receive_message', db_commu_is_receive_message($c_commu_id, $u));

        //繧ｳ繝溘Η繝九ユ繧｣繝｡繝ｳ繝舌・
        $this->set('c_commu_member_list', p_c_home_c_commu_member_list4c_commu_id($c_commu_id, 9));

        //髱槫・髢九さ繝溘Η繝九ユ繧｣縺ｫ邂｡逅・・°繧画魚蠕・＆繧後◆縺九←縺・°
        $this->set('admin_invite', db_c_commu4c_admin_invite_id($c_commu_id, $u));

        //蜿ょ刈繧ｳ繝溘Η繝九ユ繧｣縺ｮ譁ｰ逹繝医ヴ繝・け譖ｸ縺崎ｾｼ縺ｿ
        $this->set('new_topic_comment', p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7));
        //蜿ょ刈繧ｳ繝溘Η繝九ユ繧｣縺ｮ譁ｰ逹繧､繝吶Φ繝域嶌縺崎ｾｼ縺ｿ
        $this->set('new_topic_comment_event', p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7, 1));
        //蜿ょ刈繧ｳ繝溘Η繝九ユ繧｣縺ｮ譁ｰ逹縺翫☆縺吶ａ繝ｬ繝薙Η繝ｼ
        $this->set('new_commu_review', p_c_home_new_commu_review4c_commu_id($c_commu_id, 7));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_c_home($this->getView()));

        $this->set('is_unused_pc_bbs', util_is_unused_mail('m_pc_bbs_info'));
        $this->set('is_unused_ktai_bbs', util_is_unused_mail('m_ktai_bbs_info'));

        return 'success';
    }
}

?>
