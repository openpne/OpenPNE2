<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Validator.php';

/**
 * OpenPNE_Validator_Common
 *
 * 共通iniファイルの読み込みを省略化するためのサブクラス
 */
class OpenPNE_Validator_Common
{
    /**
     * @var OpenPNE_Validator
     * @access public
     */
    var $validator;

    /**
     * common_validate
     *
     * <ul>
     * <li>共通のiniファイル(validate/common/*.ini)の読み込み</li>
     * <li>$resultの取得</li>
     * <li>$requestsの取得</li>
     * </ul>
     * をまとめて行う。
     *
     * @access public
     * @param array *.ini file names. full path. array('/hogehoge/example.ini',,,)
     * @return array(boolean,array(name=>value, name=>value,,,))
     */
    function common_validate($ini_files = array())
    {
        $this->validator =& new OpenPNE_Validator();

        // 全アクション共通のiniファイル
        $v_dir = OPENPNE_WEBAPP_DIR . '/validate/';
        $common_ini_files = array();
        $common_ini_files[] = $v_dir . 'msg.ini';
        $common_ini_files[] = $v_dir . 'sessid.ini';
        foreach ($common_ini_files as $ini) {
            $this->validator->addIniSetting($ini);
        }

        // 任意のiniファイル
        foreach ($ini_files as $ini) {
            $this->validator->addIniSetting($ini);
        }

        // 値チェック実行
        $result = $this->validator->validate();
        $requests = $this->validator->getParams();

        return array($result, $requests);
    }

    function getErrors()
    {
        return $this->validator->getErrors();
    }
}

?>
