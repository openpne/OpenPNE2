<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

function convert_emoji_format_alpha_to_alpha2 ($table, $field)
{
    $primary_key = $table . '_id';
    $sql = 'SELECT ' . $primary_key . ',' . $field . ' FROM ' . $table;
    $result = db_get_all($sql);

    foreach ($result as $value) {
        $old_field_value = $value[$field];
        $new_field_value = preg_replace_callback('/%%([esi])([0-9]+)%%/',
            '_callback_emoji_replace_alpha_to_alpha2', $old_field_value);
        if ($old_field_value !== $new_field_value) {
            $data = array($field => $new_field_value);
            $where = array($primary_key => $value[$primary_key]);
            db_update($table, $data, $where);
        }        
    }
}

function _callback_emoji_replace_alpha_to_alpha2($matches)
{
    $carrier = $matches[1];
    $code = (int)$matches[2];

    if ($carrier == 'e') {
        return '[e:' . $code . ']';
    }

    if ($carrier == 'i' && $code <= 176) {
        return '[i:' . $code . ']';
    } elseif ($carrier == 'i') {
        $_def = 824;
        return '[i:' . ($code - $_def) . ']';
    }

    if ($carrier == 's') {
        if ($code <= 90) {
            $_def = 0;
        } elseif ($code >= 101 && $code <= 190) {
            $_def = 10;
        } elseif ($code >= 201 && $code <= 290) {
            $_def = 20;
        } elseif ($code >= 301 && $code <= 377) {
            $_def = 30;
        } elseif ($code >= 401 && $code <= 476) {
            $_def = 53;
        } elseif ($code >= 501 && $code <= 562) {
            $_def = 77;
        }

        return '[s:' . ($code - $_def) . ']';
    }
}

$target = array(
    'c_commu' => array('name', 'info',),
    'c_commu_admin_confirm' => array('message',),
    'c_commu_member_confirm' => array('message',),
    'c_commu_sub_admin_confirm' => array('message',),
    'c_commu_topic' => array('name', 'open_date_comment', 'open_pref_comment',),
    'c_commu_topic_comment' => array('body',),
    'c_diary' => array('subject', 'body',),
    'c_diary_category' => array('category_name',),
    'c_diary_comment' => array('body',),
    'c_friend' => array('intro',),
    'c_friend_confirm' => array('c_friend_confirm',),
    'c_member' => array('nickname',),
    'c_member_pre' => array('nickname', 'c_password_query_answer',),
    'c_member_pre_profile' => array('value',),
    'c_member_profile' => array('value',),
    'c_message' => array('body', 'subject',),
    'c_review_comment' => array('body',),
    'c_rss_cache' => array('subject', 'body',),
    'c_schedule' => array('title', 'body',),
    'c_searchlog' => array('searchword',),
    'c_tmp_file' => array('c_tmp_file',),
    'c_username' => array('username',),
);

foreach ($target as $tablename => $fields) {
    foreach ($fields as $fieldname) {
        convert_emoji_format_alpha_to_alpha2 ($tablename, $fieldname);
    }
}

?>
