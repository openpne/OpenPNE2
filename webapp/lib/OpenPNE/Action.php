<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_Action
{
    /**
     * @var OpenPNE_Smarty
     */
    var $view;

    var $requests;

    function OpenPNE_Action()
    {
    }

    function execute()
    {
        return 'success';
    }

    function handleError($errors)
    {
        openpne_display_error($errors);
    }

    function isSecure()
    {
        return true;
    }

    function set($key, $value = null)
    {
        $this->view->assign($key, $value);
    }

    function get($key)
    {
        return $this->view->get_template_vars($key);
    }

    function &getView()
    {
        return $this->view;
    }
}

?>
