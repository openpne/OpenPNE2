<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

set_time_limit(0);

echo "Begin converter.\n";

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
    'biz_group' => array('name', 'info',),
    'biz_schedule' => array('title', 'value',),
    'biz_shisetsu' => array('name', 'info',),
    'biz_todo' => array('memo',),
    'c_commu' => array('name', 'info',),
    'c_commu_admin_confirm' => array('message',),
    'c_commu_category' => array('name',),
    'c_commu_category_parent' => array('name',),
    'c_commu_member_confirm' => array('message',),
    'c_commu_sub_admin_confirm' => array('message',),
    'c_commu_topic' => array('name', 'open_date_comment', 'open_pref_comment',),
    'c_commu_topic_comment' => array('body',),
    'c_diary' => array('subject', 'body',),
    'c_diary_category' => array('category_name',),
    'c_diary_comment' => array('body',),
    'c_free_page' => array('title', 'body',),
    'c_friend' => array('intro',),
    'c_friend_confirm' => array('message',),
    'c_holiday' => array('name',),
    'c_member' => array('nickname',),
    'c_member_pre' => array('nickname', 'c_password_query_answer',),
    'c_member_pre_profile' => array('value',),
    'c_member_profile' => array('value',),
    'c_message' => array('body', 'subject',),
    'c_message_queue' => array('subject', 'body',),
    'c_profile' => array('caption', 'info',),
    'c_profile_option' => array('value',),
    'c_rank' => array('name',),
    'c_review_comment' => array('body',),
    'c_schedule' => array('title', 'body',),
    'c_searchlog' => array('searchword',),
    'c_send_messages_history' => array('subject', 'body',),
    'c_siteadmin' => array('body',),
    'c_template' => array('source',),
);

foreach ($target as $tablename => $fields) {
    foreach ($fields as $fieldname) {
        echo "Converting {$tablename}.{$fieldname}...";
        convert_emoji_format_alpha_to_alpha2 ($tablename, $fieldname);
        echo "done.\n";
    }
}

echo "Finish converter.\n";

?>
