<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_cmd($string, $type = '')
{
    if (!OPENPNE_USE_CMD_TAG) {
        return $string;
    }

    $regexp = '/(?:&lt;|<)cmd\s+src=(&quot;|")([a-z0-9_\.]+)\1(?:\s+args=(&quot;|")([a-z0-9_\-+%]+(,[a-z0-9_\-+%]+)*)?\3)?\s*(?:&gt;|>)/i';
    $GLOBALS['_CMD']['type'] = $type;

    return preg_replace_callback($regexp, '_smarty_modifier_t_cmd_make_js', $string);
}

function _smarty_modifier_t_cmd_make_js($matches)
{
    $src  = $matches[2];
    $args = $matches[4];

    $path = 'cmd/' . $src . '.js';

    // ファイルが読み込めない場合は、小窓キャスト配信者のJavaScriptを読み込む
    if (!is_readable($path)) {
        $path = db_etc_c_cmd_url4name($src);
    }

    if (!db_is_use_cmd($src, $GLOBALS['_CMD']['type']) || !$path) {
        return $matches[0];
    }

    $_args = explode(',', $args);
    $arg_str = "'" . implode("','", $_args) . "'";

    $result = <<<EOD
<script type="text/javascript" src="{$path}"></script>
<script type="text/javascript">
<!--
main({$arg_str});
//-->
</script>
EOD;
    return $result;
}

?>
