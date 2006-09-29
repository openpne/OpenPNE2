<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 繝励Ο繝輔ぅ繝ｼ繝ｫ鬆・岼霑ｽ蜉
class admin_biz_do_insert_c_admin_user extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_biz_client_redirect('insert_c_admin_user', array_shift($errors));
    }

    function execute($requests)
    {
        $errors = array();
        if (db_admin_exists_c_admin_username($requests['username'])) {
            $errors[] = '縺昴・繝ｦ繝ｼ繧ｶ蜷阪・譌｢縺ｫ逋ｻ骭ｲ縺輔ｌ縺ｦ縺・∪縺・;
        }
        if ($requests['password'] != $requests['password2']) {
            $errors[] = '繝代せ繝ｯ繝ｼ繝峨′荳閾ｴ縺励※縺・∪縺帙ｓ';
        }
        if ($errors) {
            $this->handleError($errors);
        }

        db_admin_insert_c_admin_user(
            $requests['username'],
            $requests['password'],
            $requests['auth_type']
        );
        admin_biz_client_redirect('list_c_admin_user', '繧｢繧ｫ繧ｦ繝ｳ繝医ｒ霑ｽ蜉縺励∪縺励◆');
    }
}

?>
