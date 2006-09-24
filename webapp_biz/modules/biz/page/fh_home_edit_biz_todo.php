<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

class biz_page_fh_home_edit_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $this->set("id", $requests['id']);
        $this->set("todo", biz_getTodo($requests['id']));

        if(empty($requests['target_id']) || ($requests['target_id'] == $u))  //自分自身
        {
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
            $this->set("cmd", 'h');
        }

        else  //他人
        {
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
            $this->set("cmd", 'f');
        }

        $this->set("target_id", $target_id);


        return 'success';
    }
}

?>
