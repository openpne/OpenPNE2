<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'Smarty/Smarty.class.php';

class OpenPNE_Smarty extends Smarty
{
    var $templates_dir;
    var $output_charset;

    function OpenPNE_Smarty($configs = array(), $is_html = true)
    {
        $this->Smarty();

        // 設定値をセット
        foreach ($configs as $key => $value) {
            if (isset($this->$key)) {
                $this->$key = $value;
            }
        }

        // 名称変更
        $this->assign('WORD_FRIEND', WORD_FRIEND);
        $this->assign('WORD_FRIEND_HALF', WORD_FRIEND_HALF);
        $this->assign('WORD_MY_FRIEND', WORD_MY_FRIEND);
        $this->assign('WORD_MY_FRIEND_HALF', WORD_MY_FRIEND_HALF);
        $this->assign('WORD_DIARY', WORD_DIARY);
        $this->assign('WORD_DIARY_HALF', WORD_DIARY_HALF);
        $this->assign('WORD_COMMUNITY', WORD_COMMUNITY);
        $this->assign('WORD_COMMUNITY_HALF', WORD_COMMUNITY_HALF);
        $this->assign('WORD_NICKNAME', WORD_NICKNAME);
        $this->assign('WORD_NICKNAME_HALF', WORD_NICKNAME_HALF);

        if ($is_html) {
            $this->default_modifiers = array('@t_escape');
            $this->autoload_filters['pre'][] = 'pne_nodefaults';
        } else {
            $this->default_modifiers = array();
        }
    }

    // extディレクトリ対応 SMARTY->display() ラッパー
    function ext_display($resource_name, $cache_id = null, $compile_id = null)
    {
        $this->load_filter('output', 'pne_display_emoji');
        $this->register_outputfilter('smarty_outputfilter_pne_display_emoji');
        // とりあえず携帯用にSJISのみ対応
        if ($this->output_charset == 'SJIS') {
            $this->register_outputfilter('smarty_outputfilter_convert_utf82sjis');
            $this->register_outputfilter('smarty_outputfilter_unescape_emoji');
            require_once 'OpenPNE/KtaiUA.php';
            $ktai = new OpenPNE_KtaiUA();
            if ($ktai->is_docomo() && OPENPNE_IS_SET_KTAI_FONT_SIZE) {
                $this->register_outputfilter('smarty_outputfilter_add_font4docomo');
            }
            if ($ktai->is_vodafone()) {
                $this->register_outputfilter('smarty_outputfilter_change_table_width4softbank');
            }
        }
        $this->sendContentType();
        $this->ext_fetch($resource_name, $cache_id, $compile_id, true);
    }

    function ext_fetch($resource_name, $cache_id = null, $compile_id = null, $display = false)
    {
        if ($this->templates_dir) {
            $place = '';
            $template = $this->templates_dir . '/' . $resource_name;

            if (!$tpl = $this->ext_search($template, $place)) {
                return false;
            }
            $tpl = 'file:' . $tpl;
            $cache_id = $compile_id = $place . '_' . str_replace('/', '_', $this->templates_dir);
        } else {
            $tpl = $resource_name;
        }

        return $this->fetch($tpl, $cache_id, $compile_id, $display);
    }

    function ext_search($path, &$place)
    {
        $dft = OPENPNE_MODULES_DIR . '/' . $path;
        $ext = OPENPNE_MODULES_EXT_DIR . '/' . $path;
        $biz = OPENPNE_MODULES_BIZ_DIR . '/' . $path;

        if (USE_EXT_DIR && is_readable($ext)) {
            $place = 'ext';
            return $ext;
        } elseif (USE_BIZ_DIR && is_readable($biz)) {
            $place = 'biz';
            return $biz;
        } elseif (is_readable($dft)) {
            $place = 'dft';
            return $dft;
        }

        return false;
    }

    function setOutputCharset($charset)
    {
        $this->output_charset = $charset;
    }

    function sendContentType()
    {
        if ($this->output_charset == 'SJIS') {
            header('Content-Type: text/html; charset=Shift_JIS');
        } else {
            header('Content-Type: text/html; charset=UTF-8');
        }
    }
}

function smarty_outputfilter_convert_utf82sjis($tpl_output, &$smarty)
{
    return mb_convert_encoding($tpl_output, 'SJIS-win', 'UTF-8');
}

function smarty_outputfilter_unescape_emoji($tpl_output, &$smarty)
{
    $tpl_output = emoji_unescape($tpl_output, true);
    $tpl_output = emoji_unescape($tpl_output, false);
    return $tpl_output;
}

function smarty_outputfilter_add_font4docomo($tpl_output, &$smarty)
{
    // 開始タグは属性値が入る可能性があるので正規表現で置換
    $pattern_start_tag = array('/(<body.*?>)/', '/(<td.*?>)/');
    $replacement_start_tag = '$1<font size="2">';
    $tpl_output = preg_replace($pattern_start_tag, $replacement_start_tag, $tpl_output);

    // 終了タグは単純な置換
    $pattern_end_tag = array('</body>', '</td>');
    $replacement_end_tag = array('</font></body>', '</font></td>');
    $tpl_output = str_replace($pattern_end_tag, $replacement_end_tag, $tpl_output);

    return $tpl_output;
}

function smarty_outputfilter_change_table_width4softbank($tpl_output, &$smarty)
{
    // table要素のwidth属性を x-jphone-display で得られる表示可能幅に置換
    // ただし3G端末は x-jphone-display の仕様が異なるため、置換しない
    if (!strncmp($_SERVER['HTTP_USER_AGENT'], 'J-PHONE', 7) && !is_null($_SERVER['HTTP_X_JPHONE_DISPLAY'])) {
        $display_size = explode('*', $_SERVER['HTTP_X_JPHONE_DISPLAY']);

        if (!ctype_digit($display_size[0]) || intval($display_size[0]) <= 0) {
            return $tpl_output;
        }

        $pattern_start_tag = '<table width="100%"';
        $replacement_start_tag = '<table width="' . intval($display_size[0]) . '"';
        $tpl_output = str_replace($pattern_start_tag, $replacement_start_tag, $tpl_output);
    }

    return $tpl_output;
}

?>
