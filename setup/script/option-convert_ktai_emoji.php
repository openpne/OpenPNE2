<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

$carrier = $argv[1];
$input_path = $argv[2];
$output_path = $argv[3];

if (empty($carrier) || empty($input_path)) {
    exit('carrier and input_path are must paramater');
} elseif (is_dir($input_path) === false) {
    exit('input_path is not directory');
}

if (empty($output_path)) {
    $output_path = OPENPNE_PUBLIC_HTML_DIR .  '/skin/default/img/emoji/' . $carrier . '/';
} elseif (is_dir($output_path) === false) {
    exit('output_path is not directory');
}

switch ($carrier) {
case 'i':
    convert_i_emoji_img($input_path, $output_path);
    break;
case 'e':
    convert_e_emoji_img($input_path, $output_path);
    break;
case 's':
    convert_s_emoji_img($input_path, $output_path);
    break;
default:
    exit('carrier is not valid');
    break;
}

function convert_i_emoji_img($input_path, $output_path)
{
    $input_dir = opendir($input_path);

    if ($input_dir !== false && $output_dir !== false) {
        while (($file = readdir($input_dir)) !== false) {
            if (array_pop(explode('.', $file)) == 'gif') {
                $code = hexdec('0x' . basename($file, '.gif'));
                if ((0xF89F <= $code) && ($code <= 0xF8FC) ||
                    (0xF940 <= $code) && ($code <= 0xF949) ||
                    (0xF950 <= $code) && ($code <= 0xF952) ||
                    (0xF955 <= $code) && ($code <= 0xF957) ||
                    (0xF95B <= $code) && ($code <= 0xF95E) ||
                    (0xF972 <= $code) && ($code <= 0xF97E) ||
                    (0xF980 <= $code) && ($code <= 0xF9B0)) {
                    $emoji_bin = pack("C*", $code >> 8, $code % 256);
                } else {
                    $emoji_bin = pack("C*", 0xF9, $code);
                }
                $emoji_num = mbereg_replace('[\[\]\:]', '', emoji_escape_i($emoji_bin));
                if (!empty($emoji_num)) {
                    $input_emoji = $input_path . $file;
                    $output_emoji = $output_path .  $emoji_num . '.gif';
                    copy($input_emoji, $output_emoji);
                }
            }
        }
    }

    return false;
}

function convert_e_emoji_img($input_path, $output_path)
{
    $input_dir = opendir($input_path);

    if ($input_dir !== false && $output_dir !== false) {
        while (($file = readdir($input_dir)) !== false) {
            if (array_pop(explode('.', $file)) == 'gif') {
                $code = hexdec('0x' . basename($file, '.gif'));
                if ((0xF340 <= $code) && ($code <= 0xF37E) ||
                    (0xF380 <= $code) && ($code <= 0xF3FC) ||
                    (0xF440 <= $code) && ($code <= 0xF47E) ||
                    (0xF480 <= $code) && ($code <= 0xF493) ||
                    (0xF640 <= $code) && ($code <= 0xF67E) ||
                    (0xF680 <= $code) && ($code <= 0xF6FC) ||
                    (0xF740 <= $code) && ($code <= 0xF77E) ||
                    (0xF780 <= $code) && ($code <= 0xF7FC)) {
                    $emoji_bin = pack("C*" , $code >> 8, $code % 256);
                }
                $emoji_num = mbereg_replace('[\[\]\:]', '', emoji_escape_e($emoji_bin));
                if (!empty($emoji_num)){
                    $input_emoji = $input_path . $file;
                    $output_emoji = $output_path . $emoji_num . '.gif';
                    copy($input_emoji, $output_emoji);
                }
            }
        }
    }

    return false;
}

function convert_s_emoji_img($input_path, $output_path)
{
    $input_dir = opendir($input_path);
    
    if ($input_dir !== false && $output_dir !== false) {
        while (($file = readdir($input_dir)) !== false) {
            if (array_pop(explode('.', $file)) == 'gif') {
                $emoji_num = get_s_emoji_num(basename($file,'.gif'));
                if ($emoji_num != ''){
                    $input_emoji = $input_path . $file;
                    $output_emoji = $output_path . str_replace(':', '', $emoji_num) . '.gif';
                    copy($input_emoji,$output_emoji);
                }
            }
        }
    }
}

function get_s_emoji_num($file_basename)
{
    $pattern_g = "/G[0-9a-z]+/";
    $pattern_e = "/E[0-9a-z]+/";
    $pattern_f = "/F[0-9a-z]+/";
    $pattern_o = "/O[0-9a-z]+/";
    $pattern_p = "/P[0-9a-z]+/";
    $pattern_q = "/Q[0-9a-z]+/";
    
    $web1 = $web2 = 0;
    
    $pattern_num = "/[0-9a-z]+/";
    preg_match($pattern_num,$file_basename,$result);
    $web2 = hexdec($result[0]);
        
    if (preg_match($pattern_g, $file_basename)) {
        $web1 = ord('G');
    }else if (preg_match($pattern_e,$file_basename)) {
        $web1 = ord('E');
    }else if (preg_match($pattern_f,$file_basename)) {
        $web1 = ord('F');
    }else if (preg_match($pattern_o,$file_basename)) {
        $web1 = ord('O');
    }else if (preg_match($pattern_p,$file_basename)) {
        $web1 = ord('P');
    }else if (preg_match($pattern_q,$file_basename)) {
        $web1 = ord('Q');
    }
    
    $emoji_code = OpenPNE_KtaiEmoji::getInstance();
    $code = $emoji_code->get_emoji_code4emoji(pack('c5', 0x1b, 0x24, $web1, $web2, 0x0f), 's');
        
    return $code;
    
}

?>
