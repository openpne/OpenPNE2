<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $this->set('is_unused_ashiato', util_is_unused_mail('m_ktai_ashiato'));
        $this->set('is_unused_diary_comment', util_is_unused_mail('m_ktai_diary_comment_info'));
        if (OPENPNE_USE_POINT_RANK) {
            $this->set('is_unused_rank_up', util_is_unused_mail('m_ktai_rank_up'));
        }
        return 'success';
    }
}

?>
