<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class setup_page_setup extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->_checkEnv();
        return 'success';
    }

    /**
     * 動作環境チェック
     * @access private
     */
    function _checkEnv()
    {
        $errors = array();

        // ENCRYPT_KEY のチェック
        if (!(defined('ENCRYPT_KEY') && ENCRYPT_KEY) ||
            strlen(ENCRYPT_KEY) > 56)
        {
            $errors[] = 'ENCRYPT_KEYが適切に設定されていません。config.phpの設定を確認してください。';
        }

        // database のチェック
        if (!$GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['database'])
        {
            $errors[] = 'データベース名が空です。config.phpの設定を確認してください。';
        }

        // ディレクトリの書き込み権限のチェック
        $dirs = array(
            OPENPNE_IMG_CACHE_DIR . '/jpg',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w120_h120',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w180_h180',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w76_h76',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w240_h320',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w600_h600',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w_h',
            OPENPNE_IMG_CACHE_DIR . '/jpg/w_h_raw',
            OPENPNE_IMG_CACHE_DIR . '/gif',
            OPENPNE_IMG_CACHE_DIR . '/gif/w120_h120',
            OPENPNE_IMG_CACHE_DIR . '/gif/w180_h180',
            OPENPNE_IMG_CACHE_DIR . '/gif/w76_h76',
            OPENPNE_IMG_CACHE_DIR . '/gif/w240_h320',
            OPENPNE_IMG_CACHE_DIR . '/gif/w600_h600',
            OPENPNE_IMG_CACHE_DIR . '/gif/w_h',
            OPENPNE_IMG_CACHE_DIR . '/gif/w_h_raw',
            OPENPNE_IMG_CACHE_DIR . '/png',
            OPENPNE_IMG_CACHE_DIR . '/png/w120_h120',
            OPENPNE_IMG_CACHE_DIR . '/png/w180_h180',
            OPENPNE_IMG_CACHE_DIR . '/png/w76_h76',
            OPENPNE_IMG_CACHE_DIR . '/png/w240_h320',
            OPENPNE_IMG_CACHE_DIR . '/png/w600_h600',
            OPENPNE_IMG_CACHE_DIR . '/png/w_h',
            OPENPNE_IMG_CACHE_DIR . '/png/w_h_raw',
            OPENPNE_VAR_DIR . '/function_cache',
            OPENPNE_VAR_DIR . '/log',
            OPENPNE_VAR_DIR . '/rss_cache',
            OPENPNE_VAR_DIR . '/templates_c',
            OPENPNE_VAR_DIR . '/tmp',
        );
        foreach ($dirs as $dir) {
            if (!is_writable($dir)) {
                $errors[] = 'ディレクトリの書き込み権限がありません: ' . $dir;
            }
        }

        if ($errors) {
            $this->_displayError($errors);
            exit;
        }
    }

    /**
     * Smartyを使わずにエラー表示
     * @access private
     */
    function _displayError($errors)
    {
        header('Content-Type: text/html; charset=UTF-8');
        $OPENPNE_VERSION = OPENPNE_VERSION;

echo <<<EOT
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>OpenPNEセットアップ</title>
<link rel="stylesheet" href="modules/setup/default.css" type="text/css">
</head>

<body>
<h1>OpenPNEセットアップ</h1>

<div>動作環境チェック
<ul class="caution">

EOT;

foreach ((array)$errors as $error) {
    echo '<li>' . $error . '</li>' . "\n";
}

echo <<<EOT
</ul>
</div>

<form action="./" method="get">
<input type="hidden" name="m" value="setup">
<input type="submit" class="submit" value="　再試行　">
</form>

<p style="font-size:10pt">Powered by OpenPNE v{$OPENPNE_VERSION}</p>

</body>
</html>
EOT;
    }
}

?>
