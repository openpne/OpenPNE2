<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_googlemap extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('pc', 'page_h_home');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $t = $requests['t'];
        // ----------

        //表示モード
        {
            $MapType = 'G_NORMAL_MAP';
            switch($t){
                case 'k':
                    $MapType = 'G_SATELLITE_MAP';
                    break;
                case 'h':
                    $MapType = 'G_HYBRID_MAP';
                    break;
            }
        }

        $this->set('MapType', $MapType);
        $this->set('OPENPNE_URL', OPENPNE_URL);
        $this->set('SNS_NAME', SNS_NAME);

        $view =& $this->getView();
        $view->ext_display('h_googlemap.tpl');
        exit;
    }
}

?>
