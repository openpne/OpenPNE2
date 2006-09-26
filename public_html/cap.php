<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @deprecated File deprecated in Release 1.9.0
 */

require_once './config.inc.php';
require_once OPENPNE_LIB_DIR.'/include/kcaptcha/kcaptcha.php';

@session_start();
$captcha = new KCAPTCHA();
$_SESSION['captcha_keystring'] = $captcha->getKeyString();


?>