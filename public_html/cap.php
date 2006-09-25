<?php

require_once './config.inc.php';
require_once OPENPNE_LIB_DIR.'/include/kcaptcha/kcaptcha.php';

@session_start();
$captcha = new KCAPTCHA();
$_SESSION['captcha_keystring'] = $captcha->getKeyString();


?>