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
        $is_admit = $requests['is_admit'];
        $is_open = $requests['is_open'];
        $err_msg = $requests['err_msg'];
        // ----------

        $form_val=array(
            'name'=>$name,
            'c_commu_category_id'=>$c_commu_category_id,
            'info'=>$info,
            'is_admit'=>$is_admit,
            'is_open'=>$is_open,
        );

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_commu_category_list = db_commu_c_commu_category4is_create_commu();
        if (!$c_commu_category_list) {
            openpne_redirect('pc', 'page_h_err_c_commu_add');
        }

        $this->set("c_commu_category", $c_commu_category_list);

        $this->set("c_commu_category_list", $c_commu_category_list);
        $this->set("form_val", $form_val);

        $this->set('err_msg', $err_msg);

        return 'success';
    }
}

?>
