<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_receive_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('ktai', 'page_h_home');
        }

        $is_c_commu_member = db_commu_is_c_commu_member($target_c_commu_id, $u);
        $relation_c_member_and_c_commu = db_commu_relationship_between_member_commu($target_c_commu_id, $u);
        $is_unused_pc_bbs = util_is_unused_mail('m_pc_bbs_info');
        $is_unused_ktai_bbs = util_is_unused_mail('m_ktai_bbs_info');

        if (!$is_c_commu_member) {
            handle_kengen_error();
        } elseif ($is_unused_pc_bbs && $is_unused_ktai_bbs) {
            handle_kengen_error();
        }

        $c_member_secure = db_member_c_member_secure4c_member_id($u);
        if (empty($c_member_secure['pc_address'])) {
            $is_registered_pc_address = false;
        } else {
            $is_registered_pc_address = true;
        }

        //コミュニティ情報
        $this->set("c_commu", db_commu_c_commu4c_commu_id_k($target_c_commu_id));

        //コミュニティメール(ktai)受信設定
        $this->set("is_receive_mail", db_commu_is_receive_mail_ktai($target_c_commu_id, $u));
        //コミュニティメール(pc)受信設定
        $this->set("is_receive_mail_pc", db_commu_is_receive_mail_pc($target_c_commu_id, $u));
        //管理者からのメッセージ受信設定
        $this->set("is_receive_message", db_commu_is_receive_message($target_c_commu_id, $u));
        // PCメールアドレス登録状況
        $this->set('is_registered_pc_address', $is_registered_pc_address);

        return 'success';
    }
}

?>
