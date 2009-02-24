<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $err_msg = $requests['err_msg'];
        // ----------

        $form_val=array(
            'name'=>$name,
            'c_commu_category_id'=>$c_commu_category_id,
            'info'=>$info,
            'public_flag'=>$public_flag,
        );

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_commu_category_list = db_commu_c_commu_category4is_create_commu();
        if (!$c_commu_category_list) {
            openpne_redirect('pc', 'page_h_err_c_commu_add');
        }

        $this->set("c_commu_category", $c_commu_category_list);

        $public_flag_list=
        array(
            'public' =>'参加：誰でも参加可能、掲示板：全員に公開',
            'auth_sns' =>'参加：管理者の承認が必要、掲示板：全員に公開',
            'auth_commu_member' =>'参加：管理者の承認が必要、掲示板：' . WORD_COMMUNITY . '参加者にのみ公開',
        );

        $this->set("c_commu_category_list", $c_commu_category_list);
        $this->set("public_flag_list", $public_flag_list);
        $this->set("form_val", $form_val);

        $this->set('err_msg', $err_msg);

        return 'success';
    }
}

?>
