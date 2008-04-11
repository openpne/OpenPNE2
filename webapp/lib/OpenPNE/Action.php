<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * OpenPNEの全アクションの親クラス
 *
 * @package OpenPNE
 * @author OGAWA Rinpei <ogawa@tejimaya.com>
 */
class OpenPNE_Action
{
    /**
     * OpenPNE_Smartyのインスタンス
     *
     * @var OpenPNE_Smarty
     */
    var $view;

    /**
     * Validation済みリクエスト変数
     *
     * @var array
     */
    var $requests;

    /**
     * アクションの実際の処理
     *
     * @return string pageアクションが成功した場合は、'success'を返す
     */
    function execute()
    {
        return 'success';
    }

    /**
     * Request Validation のエラー処理
     *
     * @param array $errors
     */
    function handleError($errors)
    {
        openpne_display_error($errors);
    }

    /**
     * 認証が必要なアクションかどうかを返す
     *
     * @return bool
     */
    function isSecure()
    {
        return true;
    }

    /**
     * Viewに値をセットする
     *
     * @param string $key
     * @param mixed $value
     */
    function set($key, $value = null)
    {
        $this->view->assign($key, $value);
    }

    /**
     * Viewにセットされた値を取得
     *
     * @param string $key
     * @return mixed
     */
    function get($key)
    {
        return $this->view->get_template_vars($key);
    }

    /**
     * Viewのインスタンスを返す
     *
     * @return OpenPNE_Smarty
     */
    function &getView()
    {
        return $this->view;
    }
}

?>
