<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_url2cmd($string, $type = '', $target_c_member_id = '', $is_html = true)
{
    $list = array();

    if ($type === 'entry_point') {
        // 置換用に文字列を退避
        list($list, $string) = util_replace_patterns_to_marker($string);
    }

    if (!$is_html || in_array($type, db_get_url2a_denied_list())) {
        // HTMLエスケープされていない場合、 t_url2a の変換対象でない場合
        // ", ', </a> がURLの後に続く場合はマッチさせない
        $url_pattern = '/https?:\/\/([a-zA-Z0-9\-.]+)\/?(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!()&])*(?!["\'a-zA-Z0-9_\-\/.,:;~?@=+$%#!()&]|<\/a>)/';
    } else {
        $url_pattern = '/https?:\/\/([a-zA-Z0-9\-.]+)\/?(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!()]|&amp;)*/';
    }

    $GLOBALS['_CMD']['type'] = $type;
    $GLOBALS['_CMD']['target_c_member_id'] = $target_c_member_id;

    $string = preg_replace_callback($url_pattern, '_smarty_modifier_t_cmd_make_url_js', $string);

    if ($type === 'entry_point') {
        // 退避した文字列を元に戻す
        $string = str_replace(array_keys($list), array_values($list), $string);
    }

    return $string;
}

function _smarty_modifier_t_cmd_make_url_js($matches)
{
    $url = str_replace('&amp;', '&', $matches[0]);
    $cmd = $matches[1];

    // SNS内を指すURLの場合は cmd/openpne ディレクトリ以下の小窓を読み込む
    $openpne_url = '';
    if (strpos($url, OPENPNE_URL) === 0) {
        $openpne_url = OPENPNE_URL;
    } elseif (OPENPNE_USE_PARTIAL_SSL && strpos($url, OPENPNE_SSL_URL) === 0) {
        $openpne_url = OPENPNE_SSL_URL;
    }

    if ($openpne_url) {
        $url_pattern = sprintf('/^%s(?:index.php)?\?m=(\w+)&a=(\w+)((?:[a-zA-Z0-9_=]|&)*)$/', preg_quote($openpne_url, '/'));

        $openpne_url_matches = array();
        if (preg_match($url_pattern, $url, $openpne_url_matches)) {
            $module = $openpne_url_matches[1];
            $action = $openpne_url_matches[2];
            $cmd = 'openpne/' . $module . '_' . $action;
        }
    }

    $file = $cmd . '.js';
    $path = './cmd/' . $file;

    // ファイルが読み込めない場合は、小窓キャスト配信者のJavaScriptを読み込む
    if (!is_readable($path)) {
        $path = db_etc_c_cmd_url4name($cmd);
    }

    if (!OPENPNE_USE_CMD_TAG || !db_is_use_cmd($cmd, $GLOBALS['_CMD']['type']) || !$path) {
        if (in_array($GLOBALS['_CMD']['type'], db_get_url2a_denied_list())) {
            // t_url2aが無効: 何もせずに返す
            return $matches[0];
        } else {
            // t_url2aが有効
            return pne_url2a($url);
        }
    }

    $url_html = str_replace('&', '&amp;', $url);
    $result = <<<EOD
<script type="text/javascript" src="{$path}"></script>
<script type="text/javascript">
<!--
url2cmd('{$url_html}', '{$GLOBALS['_CMD']['target_c_member_id']}');
//-->
</script>
EOD;
    return $result;
}

?>
