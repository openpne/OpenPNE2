<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_insert_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $todo = $requests['todo'];
        $is_all = $requests['is_all'];
        $nickname = $requests['nickname'];
        // ----------

        if (empty($todo)) {
            $p = array('msg' => 'Todoの内容を入力してください。');
            openpne_redirect('pc', 'page_h_home', $p);
        }

        biz_insertTodo($u, $todo, $u, 0, $is_all);

        openpne_redirect('pc', 'page_h_home');
    }
}
?>
