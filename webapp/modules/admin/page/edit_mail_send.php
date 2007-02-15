<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メール送信設定
class admin_page_edit_mail_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $pc = array(
            'm_pc_ashiato' => 'あしあとお知らせメール',
            'm_pc_bbs_info' => 'コミュニティ書き込み通知メール',
            'm_pc_birthday_mail' => 'マイフレンドの誕生日お知らせメール',
//            'm_pc_change_mail' => 'PCメールアドレス変更確認メール',
            'm_pc_daily_news' => 'デイリー・ニュース',
            'm_pc_friend_intro' => 'マイフレンドからの紹介文お知らせメール',
            'm_pc_invite_end' => '登録完了メール',
            'm_pc_join_commu' => 'コミュニティ参加お知らせメール',
            'm_pc_message_event_message' => 'イベントお知らせメッセージお知らせメール',
            'm_pc_message_event_invite' => 'イベント紹介メッセージお知らせメール',
            'm_pc_message_syoukai_commu' => 'コミュニティ紹介メッセージお知らせメール',
            'm_pc_message_syoukai_member' => 'メンバー紹介メッセージお知らせメール',
            'm_pc_message_syounin' => '承認メッセージお知らせメール',
            'm_pc_message_zyushin' => 'メッセージお知らせメール',
//            'm_pc_password_query' => 'パスワード再発行メール',
            'm_pc_schedule_mail' => 'スケジュールお知らせメール',
            'm_pc_syounin_friend' => 'フレンドリンク承認完了メール',
//            'm_pc_syoutai_mail' => 'SNS招待メール',
//            'm_pc_taikai_end' => '退会完了メール',
        );
        $ktai = array(
            'm_ktai_ashiato' => 'あしあとお知らせメール',
            'm_ktai_bbs_info' => 'コミュニティ書き込み通知メール',
//            'm_ktai_change_ktai' => '携帯メールアドレス変更確認メール',
//            'm_ktai_login_get' => '携帯版ログインアドレスお知らせメール',
//            'm_ktai_login_regist_end' => '登録完了メール',
            'm_ktai_message_zyushin' => 'メッセージお知らせメール',
//            'm_ktai_password_query' => 'パスワード再発行メール',
//            'm_ktai_regist_get' => '新規登録メール(オープン制)',
//            'm_ktai_regist_invite' => '招待メール',
//            'm_ktai_taikai_end' => '退会完了メール',
        );

        $this->set('pc', $pc);
        $this->set('ktai', $ktai);
        $this->set('unused', explode(',', UNUSED_MAILS));
        return 'success';
    }
}

?>
