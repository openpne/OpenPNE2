<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_add extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $form_val['subject'] = $requests['subject'];
        $form_val['description'] = $requests['description'];
        $form_val['public_flag'] = $requests['public_flag'];
        $err_msg = $requests['err_msg'];
        // ----------

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $this->set('inc_navi', fetch_inc_navi("h"));
        $this->set("form_val", $form_val);
        $this->set('err_msg', $err_msg);

        return 'success';
    }
}

?>
