<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class mail_sns
{
    var $decoder;
    var $from;
    var $to;

    var $c_member_id;

    function mail_sns(&$decoder)
    {
        $this->decoder =& $decoder;
        $this->from = $decoder->get_from();
        $this->to = $decoder->get_to();

        $this->c_member_id = do_common_c_member_id4ktai_address($this->from);

        // メンバーIDが見つからない場合は、ローカルパートに二重引用符を付加してリトライ
        if (!$this->c_member_id) {
            list($local, $domain) = explode('@', $this->from, 2);
            $this->c_member_id = do_common_c_member_id4ktai_address('"' . $local . '"' . '@' . $domain);
        }
    }

    function main()
    {
        $matches = array();
        list($from_user, $from_host) = explode('@', $this->from, 2);
        list($to_user, $to_host) = explode('@', $this->to, 2);

        // from_host が携帯ドメイン以外はエラー
        if (!is_ktai_mail_address($this->from)) {
            m_debug_log('mail_sns::main() from wrong host');
            return false;
        }

        if (MAIL_ADDRESS_PREFIX) {
            if (strpos($to_user, MAIL_ADDRESS_PREFIX) === 0) {
                $to_user = substr($to_user, strlen(MAIL_ADDRESS_PREFIX));
            }
        }

        if (!$this->c_member_id) {
            // 送信者がSNSメンバーでない場合

            if (!IS_CLOSED_SNS) {
                // get 新規登録
                if ($to_user == 'get') {
                    // アフィリエイトIDが付いている場合
                    $body = $this->decoder->get_text_body();

                    m_debug_log('mail_sns::regist_get()', PEAR_LOG_INFO);
                    return $this->regist_get($body);
                }
            }

            m_debug_log('mail_sns::main() action not found');
            return false;
        }

        //---

        // ログインアドレス通知
        if ($to_user == 'get') {
            m_debug_log('mail_sns::login_get()', PEAR_LOG_INFO);
            return $this->login_get();
        }

        //---

        // コミュニティ掲示板投稿
        elseif (
            preg_match('/^t(\d+)$/', $to_user, $matches) ||
            preg_match('/^t(\d+)-([0-9a-f]{12})$/', $to_user, $matches)
        ) {

            // トピックIDのチェック
            if (!$c_commu_topic_id = $matches[1]) {
                return false;
            }

            if (MAIL_ADDRESS_HASHED) {
                if (empty($matches[2])) return false;

                // メンバーハッシュのチェック
                if ($matches[2] != t_get_user_hash($this->c_member_id)) {
                    return false;
                }
            }

            m_debug_log('mail_sns::add_commu_topic_comment()', PEAR_LOG_INFO);
            return $this->add_commu_topic_comment($c_commu_topic_id);
        }

        //---

        // 日記投稿
        elseif (
            $to_user == 'blog' ||
            preg_match('/^b(\d+)-([0-9a-f]{12})$/', $to_user, $matches)
        ) {

            if (MAIL_ADDRESS_HASHED) {
                if (empty($matches[1]) || empty($matches[2])) return false;

                // メンバーIDのチェック
                if ($matches[1] != $this->c_member_id) {
                    return false;
                }
                // メンバーハッシュのチェック
                if ($matches[2] != t_get_user_hash($this->c_member_id)) {
                    return false;
                }
            }

            m_debug_log('mail_sns::add_diary()', PEAR_LOG_INFO);
            return $this->add_diary();
        }

        //---

        //プロフィール画像変更
        elseif (
            preg_match('/^p(\d+)$/', $to_user, $matches) ||
            preg_match('/^p(\d+)-([0-9a-f]{12})$/', $to_user, $matches)
        ) {

            // メンバーIDのチェック
            if ($matches[1] != $this->c_member_id) {
                return false;
            }

            if (MAIL_ADDRESS_HASHED) {
                if (empty($matches[2])) return false;

                // メンバーハッシュのチェック
                if ($matches[2] != t_get_user_hash($this->c_member_id)) {
                    return false;
                }
            }

            m_debug_log('mail_sns::add_member_image()', PEAR_LOG_INFO);
            return $this->add_member_image();
        }

        m_debug_log('mail_sns::main() action not found(member)');
        return false;
    }

    /**
     * 新規登録のURL取得
     */
    function regist_get($aff_id)
    {
        // 招待者は c_member_id = 1 (固定)
        $c_member_id_invite = 1;

        // _pre に追加
        $session = create_hash();
        mail_insert_c_member_ktai_pre($session, $this->from, $c_member_id_invite);

        do_common_send_mail_regist_get($session, $this->from, $aff_id);
        return true;
    }

    /**
     * ログインページのURL取得
     */
    function login_get()
    {
        do_mail_sns_login_get_mail_send($this->c_member_id, $this->from);
        return true;
    }

    /**
     * コミュニティ掲示板投稿
     */
    function add_commu_topic_comment($c_commu_topic_id)
    {
        if (!$topic = mail_c_commu_topic4c_commu_topic_id($c_commu_topic_id)) {
            return false;
        }

        $c_commu_id = $topic['c_commu_id'];
        if (!_db_is_c_commu_member($c_commu_id, $this->c_member_id)) {
            $this->error_mail('コミュニティに参加していないため投稿できませんでした');
            m_debug_log('mail_sns::add_commu_topic_comment() not a member');
            return false;
        }

        $body = $this->decoder->get_text_body();
        if ($body === '') {
            $this->error_mail('本文が空のため投稿できませんでした');
            m_debug_log('mail_sns::add_commu_topic_comment() body is empty');
            return false;
        }

        // 書き込みをDBに追加
        $ins_id = db_commu_insert_c_commu_topic_comment($c_commu_id, $topic['c_commu_topic_id'], $this->c_member_id, $body);

        // 画像保存
        $images = $this->decoder->get_images();
        if ($images === false) {
            $this->error_mail('画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください。');
            return false;
        }
        $image_num = 1;
        foreach ($images as $image) {
            $image_ext = $image['ext'];
            $image_data = $image['data'];
            $filename = 'tc_' . $ins_id . '_' . $image_num . '_' . time() . '.' . $image_ext;

            db_image_insert_c_image($filename, $image_data);
            mail_update_c_commu_topic_comment_image($ins_id, $filename, $image_num);
            $image_num++;
            if ($image_num > 3) {
                break;
            }
        }

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($ins_id, $this->c_member_id);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($ins_id, $this->c_member_id);

        if (OPENPNE_USE_POINT_RANK) {
            //トピック・イベントにコメントした人にポイント付与
            $point = db_action_get_point4c_action_id(11);
            db_point_add_point($this->c_member_id, $point);
        }

        return true;
    }

    /**
     * 日記投稿
     */
    function add_diary()
    {
        $subject = $this->decoder->get_subject();
        $body    = $this->decoder->get_text_body();

        if ($subject === '') {
            $subject = '無題';
        }
        if ($body === '') {
            $this->error_mail('本文が空のため投稿できませんでした');
            m_debug_log('mail_sns::add_diary() body is empty');
            return false;
        }

        $c_member = db_common_c_member4c_member_id($this->c_member_id);
        if (!$ins_id = db_diary_insert_c_diary($this->c_member_id, $subject, $body, $c_member['public_flag_diary'])) {
            return false;
        }

        // 画像登録
        $images = $this->decoder->get_images();
        if ($images === false) {
            $this->error_mail('画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください。');
            return false;
        }
        $image_num = 1;
        foreach ($images as $image) {
            $image_ext = $image['ext'];
            $image_data = $image['data'];
            $filename = 'd_' . $ins_id . '_' . $image_num . '_' . time() . '.' . $image_ext;

            db_image_insert_c_image($filename, $image_data);
            db_diary_update_c_diary_image_filename($ins_id, $filename, $image_num);
            $image_num++;
            if ($image_num > 3) {
                break;
            }
        }

        if (OPENPNE_USE_POINT_RANK) {
            //日記を書いた人にポイント付与
            $point = db_action_get_point4c_action_id(4);
            db_point_add_point($this->c_member_id, $point);
        }

        return true;
    }

    /**
     * プロフィール画像変更
     */
    function add_member_image()
    {
        $c_member = db_common_c_member4c_member_id($this->c_member_id);

        // 登録する画像番号(1-3)を決める
        $target_number = 0;
        if ($c_member['image_filename']) {
            if (!$c_member['image_filename_1']) {
                $target_number = 1;
            } elseif (!$c_member['image_filename_2']) {
                $target_number = 2;
            } elseif (!$c_member['image_filename_3']) {
                $target_number = 3;
            } else {
                $this->error_mail('プロフィール画像の登録は最大三枚までです。');
                m_debug_log('mail_sns::add_diary() image is full');
                return false;
            }
        } else {
            $target_number = 1;
        }

        // 画像登録
        if ($images = $this->decoder->get_images()) {
            $image = $images[0];
            $image_ext = $image['ext'];
            $image_data = $image['data'];
            $filename = 'm_' . $this->c_member_id . '_' . time() . '.' . $image_ext;

            db_image_insert_c_image($filename, $image_data);
            mail_update_c_member_image($this->c_member_id, $filename, $target_number);
            return true;
        } else {
            m_debug_log('mail_sns::add_member_image() no images');
            return false;
        }
    }

    /**
     * エラーメールをメール送信者へ返信
     */
    function error_mail($body)
    {
        $subject = '['.SNS_NAME.']メール投稿エラー';
        t_send_email($this->from, $subject, $body);
    }
}

?>
