<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージコードからメッセージを得る
 */
function k_p_common_msg4msg_id($msg_id)
{
    if (is_null($msg_id)) return '';

    $msg =
    array(
        0   => "ﾛｸﾞｲﾝに失敗しました",
        1   => "本文を入力してください",
        2   => "ﾀｲﾄﾙを入力してください",
        3   => "承認が完了しました",
        4   => "承認依頼を削除しました",
        5   => "このﾒﾝﾊﾞｰは、現在ﾘﾝｸ承認待ちです",
        6   => "このﾒﾝﾊﾞｰは、すでにﾘﾝｸ済みです",
        7   => "教える".WORD_MY_FRIEND_HALF."を選択してださい",
        8   => "ﾒｯｾｰｼﾞを入力してください",
        9   => "このﾒﾝﾊﾞｰは既に登録済みです",
        10  => "管理者なので退会できません",
        11  => "この".WORD_COMMUNITY_HALF."のﾒﾝﾊﾞｰではありません",
        12  => "ﾒｰﾙｱﾄﾞﾚｽを入力してください",
        13  => "携帯ﾒｰﾙｱﾄﾞﾚｽには送信できません",
        14  => "かんたんﾛｸﾞｲﾝに失敗しました。通常ﾛｸﾞｲﾝ後、設定してください",
        15  => "ﾛｸﾞｲﾝしてください",
        16  => "携帯ﾒｰﾙｱﾄﾞﾚｽ以外は指定できません",
        17  => "このﾒｰﾙｱﾄﾞﾚｽはすでに登録されています",
        18  => "ﾊﾟｽﾜｰﾄﾞが違います",
        19  => "携帯ﾒｰﾙｱﾄﾞﾚｽを登録しました",
        20  => "ﾊﾟｽﾜｰﾄﾞは6～12文字の半角英数で入力してください",
        21  => "ﾊﾟｽﾜｰﾄﾞを変更しました",
        22  => "質問を選択してください",
        23  => "答えを入力してください",
        24  => "秘密の質問・答えを変更しました",
        25  => "ﾊﾟｽﾜｰﾄﾞ再設定できませんでした",
        26  => "ﾊﾟｽﾜｰﾄﾞ再設定用URLをﾒｰﾙで送信しました",
        27  => "携帯個体識別番号を取得できませんでした",
        28  => "かんたんﾛｸﾞｲﾝ設定を完了しました",
        29  => "かんたんﾛｸﾞｲﾝ設定を解除しました",
        30  => "招待ﾒｰﾙを送信しました",
        31  => "ﾒｰﾙｱﾄﾞﾚｽを正しく入力してください",
        32  => "ﾒｰﾙ受信設定を変更しました",
        33  => "紹介文を入力してください",
        34  => "あしあとお知らせﾒｰﾙ設定を変更しました",
        35  => WORD_DIARY_HALF."の公開設定を変更しました",
        36  => "ｱｸｾｽﾌﾞﾛｯｸ設定を変更しました",
        37  => "このﾒｰﾙｱﾄﾞﾚｽでは登録できません",
        38  => "退会理由を入力して下さい",
        39  => "この携帯個体識別番号はすでに登録されています",
        40  => WORD_DIARY_HALF."の公開範囲を一括変更しました",
        41  => "無効なﾒﾝﾊﾞｰIDが含まれています",
        42  => "登録できませんでした",
        44  => "この携帯個体識別番号は登録することができません",
        45  => "ｲﾍﾞﾝﾄの参加者数制限を超えています",
        46  => "ﾛｸﾞｱｳﾄしました",
        47  => "ｺﾒﾝﾄが1000番に達したので、これ以上のｺﾒﾝﾄはできません",
        48  => "設定を変更しました",
        49  => "その" . WORD_COMMUNITY_HALF . "はすでに存在します",
        50  => "指定されたｶﾃｺﾞﾘは選択できません",
        51  => "説明文を入力してください",
        52  => "秘密の質問・答えを登録してください",
        53  => "公開範囲とﾄﾋﾟｯｸ作成権限が指定できない組み合わせです",
        54  => "公開範囲とｺﾒﾝﾄ作成権限が指定できない組み合わせです",
        55 =>  "ﾊﾟｽﾜｰﾄﾞ再設定の有効期限が過ぎています"
    );

    return $msg[$msg_id];
}

/**
 * 携帯端末からのアクセスかどうかを User-Agent の値から判別する
 *
 * @return bool
 */
function isKtaiUserAgent()
{
    include_once 'OpenPNE/KtaiUA.php';
    $ktaiUA = new OpenPNE_KtaiUA();
    return $ktaiUA->is_ktai();
}

/**
 * fhページのタイプを取得
 */
function k_p_fh_common_get_type($target_c_member_id, $u)
{
    // ナビゲーションタイプ : "h" | "f"
    if ($target_c_member_id && $target_c_member_id != $u) {
        return 'f';
    } else {
        return 'h';
    }
}

function k_p_h_message_ktai_url4url($str, $tail)
{
    $matches = array();

    // 旧形式のURL
    $pat = '|https?://.+page.php\?p=(c_home.+target_c_commu_id=\d+)$|';
    if (preg_match($pat, $str, $matches)) {
        if (!empty($matches[1])) {
            $com_url = OPENPNE_URL."?m=ktai&a=page_".$matches[1]."&$tail";
        }
        $str = preg_replace($pat, "", $str);
    }
    $pat = '|https?://.+page.php\?p=(f_home.+target_c_member_id=\d+)$|';
    if (preg_match($pat, $str, $matches)) {
        if (!empty($matches[1])) {
            $friend_url = OPENPNE_URL."?m=ktai&a=page_".$matches[1]."&$tail";
        }
        $str = preg_replace($pat, "", $str);
    }

    // 新形式のURL
    $pat = '|https?://.+\?m=pc(&a=page_c_home.+target_c_commu_id=\d+)$|';
    if (preg_match($pat, $str, $matches)) {
        if (!empty($matches[1])) {
            $com_url = OPENPNE_URL."?m=ktai".$matches[1]."&$tail";
        }
        $str = preg_replace($pat, "", $str);
    }
    $pat = '|https?://.+\?m=pc(&a=page_f_home.+target_c_member_id=\d+)$|';
    if (preg_match($pat, $str, $matches)) {
        if (!empty($matches[1])) {
            $friend_url = OPENPNE_URL."?m=ktai".$matches[1]."&$tail";
        }
        $str = preg_replace($pat, "", $str);
    }

    return array($str, $com_url, $friend_url);
}

function fetch_inc_ktai_header()
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'ktai/templates';

    require_once 'OpenPNE/KtaiUA.php';
    $ktai = new OpenPNE_KtaiUA();
    $inc_smarty->assign('is_au', $ktai->is_au());
    $inc_smarty->assign('is_softbank', $ktai->is_vodafone());
    $inc_smarty->assign('is_docomo', $ktai->is_docomo());

    $inc_smarty->assign('ktai_color_config', util_get_color_config_ktai());

    if (SNS_TITLE) {
        $inc_smarty->assign('title', SNS_TITLE);
    } else {
        $inc_smarty->assign('title', SNS_NAME);
    }
    $inc_smarty->assign('inc_ktai_html_head', p_common_c_siteadmin4target_pagename('inc_ktai_html_head'));
    $inc_smarty->assign('inc_ktai_header', p_common_c_siteadmin4target_pagename('inc_ktai_header'));

    return $inc_smarty->ext_fetch('inc_ktai_header.tpl');
}

function fetch_inc_ktai_footer()
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'ktai/templates';

    $inc_smarty->assign('inc_ktai_footer', p_common_c_siteadmin4target_pagename('inc_ktai_footer'));
    $inc_smarty->assign('tail', $GLOBALS['KTAI_URL_TAIL']);
    $inc_smarty->assign('page', $GLOBALS['__Framework']['current_action']);
    $inc_smarty->assign('ktai_color_config', util_get_color_config_ktai());

    return $inc_smarty->ext_fetch('inc_ktai_footer.tpl');
}

/**
 * 携帯メール投稿用アドレスに付けるハッシュ文字列を生成する
 *
 * @param int $c_member_id
 * @param int $length
 * @return string
 */
function t_get_user_hash($c_member_id, $length = MAIL_ADDRESS_HASH_LENGTH)
{
    $hashed_password = db_member_hashed_password4c_member_id($c_member_id);
    $seed = strval($c_member_id) . $hashed_password;

    $length = (int)$length;
    if ($length <= 0 || $length > 32) {
        $length = 32;
    }

    return substr(md5($seed), 0, $length);
}

/**
 * 携帯メール投稿用アドレスに付けるハッシュ文字列が正しいかどうかを判定する
 * (前方一致で比較する)
 *
 * @param int $c_member_id
 * @param string $input_hash
 * @return bool
 */
function t_check_user_hash($c_member_id, $input_hash)
{
    return (strpos($input_hash, t_get_user_hash($c_member_id)) === 0);
}

/**
 * 携帯端末からのアクセスかどうかを IPアドレスから判別する
 *
 * @return bool
 */
function is_ktai_ip()
{
    require_once 'Net/IPv4.php';
    require_once 'ktaiIP.php';
    $is_valid_ip = false;
    foreach ($GLOBALS['_OPENPNE_KTAI_IP_LIST'] as $ktai_ip) {
        if (Net_IPv4::ipInNetwork($_SERVER[SERVER_IP_KEY], $ktai_ip)) {
            $is_valid_ip = true;
            break;
        }
    }

    return $is_valid_ip;
}

function ktai_display_error($errors)
{
    $smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $smarty->setOutputCharset('SJIS');
    $smarty->templates_dir = 'ktai/templates';
    $smarty->assign('inc_ktai_header', fetch_inc_ktai_header());
    $smarty->assign('inc_ktai_footer', fetch_inc_ktai_footer());
    $smarty->assign('errors', (array)$errors);
    $smarty->assign('ktai_color_config', util_get_color_config_ktai());
    $smarty->ext_display('error.tpl');
    exit;
}

?>
