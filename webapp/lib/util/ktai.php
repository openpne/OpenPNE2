<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        0   => "ログインに失敗しました",
        1   => "本文を入力してください",
        2   => "タイトルを入力してください",
        3   => "承認が完了しました",
        4   => "承認依頼を削除しました",
        5   => "このメンバーは、現在リンク承認待ちです",
        6   => "このメンバーは、すでにリンク済みです",
        7   => "教える".WORD_MY_FRIEND_HALF."を選択してださい",
        8   => "メッセージを入力してください",
        9   => "このメンバーは既に登録済みです",
        10  => "管理者なので退会できません",
        11  => "このコミュニティのメンバーではありません",
        12  => "メールアドレスを入力してください",
        13  => "携帯アドレスには送信できません",
        14  => "かんたんﾛｸﾞｲﾝに失敗しました。通常ﾛｸﾞｲﾝ後、設定してください",
        15  => "ログインしてください",
        16  => "携帯アドレス以外は指定できません",
        17  => "このアドレスはすでに登録されています",
        18  => "パスワードが違います",
        19  => "携帯メールアドレスを登録しました",
        20  => "パスワードは6～12文字の半角英数で入力してください",
        21  => "パスワードを変更しました",
        22  => "質問を選択してください",
        23  => "答えを入力してください",
        24  => "秘密の質問・答えを変更しました",
        25  => "パスワード再発行できませんでした",
        26  => "新しいパスワードをメールで送信しました",
        27  => "携帯の個体識別番号を取得できませんでした",
        28  => "かんたんログイン設定を完了しました",
        29  => "かんたんログイン設定を解除しました",
        30  => "招待メールを送信しました",
        31  => "メールアドレスを正しく入力してください",
        32  => "メール受信設定を変更しました",
        33  => "紹介文を入力してください",
        34  => "あしあとお知らせメール設定を変更しました",
        35  => "日記の公開設定を変更しました",
        36  => "アクセスブロック設定を変更しました",
        37  => "このアドレスでは登録できません",
        38  => "退会理由を入力して下さい",
        39  => "この個体識別番号はすでに登録されています",
        40  => "日記の公開範囲を一括変更しました",
        41  => "無効なメンバーIDが含まれています",
        42  => "登録できませんでした",
        43  => "イベントの参加者数制限を超えています",
    );

    return $msg[$msg_id];
}

/**
 * 携帯電話からのアクセスかどうかを User-Agent の値から判別する
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

/** 関数
 * k_p_c_bbs_c_member_admin4c_commu_topic_id($c_commu_topic_id)
 * 
 * 
 */
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

    return $inc_smarty->ext_fetch('inc_ktai_footer.tpl');
}

function t_get_user_hash($c_member_id, $length = 12)
{
    $hashed_password = k_common_hashed_password4c_member_id($c_member_id);
    $seed = strval($c_member_id) . $hashed_password;

    return substr(md5($seed), 0, $length);
}

function ktai_display_error($errors)
{
    $smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $smarty->setOutputCharset('SJIS');
    $smarty->templates_dir = 'ktai/templates';
    $smarty->assign('inc_ktai_header', fetch_inc_ktai_header());
    $smarty->assign('inc_ktai_footer', fetch_inc_ktai_footer());
    $smarty->assign('errors', (array)$errors);
    $smarty->ext_display('error.tpl');
    exit;
}

?>
