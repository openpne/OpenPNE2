<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_regist_ktai extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $password = $requests['password'];
        $c_member_id = intval($requests['id']);
        $c_member_pre_id = intval($requests['pre_id']);
        // ----------

        $pre = array();

        // セッションが有効かどうか
        if ((!$pre = db_member_c_ktai_address_pre4session($ses)) && !empty($c_member_id)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login');
        } elseif (!empty($c_member_id)) {
        } elseif ((!$pre = db_member_c_member_pre4session($ses)) && !empty($c_member_pre_id)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'])) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        $c_member_id = $pre['c_member_id'];
        $c_member_pre_id = $pre['c_member_pre_id'];
        $ktai_address = $pre['ktai_address'];

        // パスワードチェック
        if (!empty($c_member_id) && !db_common_authenticate_password($c_member_id, $password, true)) {
            $p = array('msg' => 18, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_login2', $p);
        } elseif (!empty($c_member_pre_id) && (md5($password) !== $pre['password'])) {
            $p = array('msg' => 18, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_login2', $p);
        }

        if ((!$easy_access_id = OpenPNE_KtaiID::getID()) && (!$pre['is_disabled_regist_easy_access_id'])) {
            if (!empty($c_member_id)) {
                $p = array('ses' => $ses, 'id' => $c_member_id);
            } elseif (!empty($c_member_pre_id)) {
                $p = array('ses' => $ses, 'pre_id' => $c_member_pre_id);
            }
            openpne_redirect('ktai', 'page_o_regist_ktai_uid_err', $p);
        }
        
        $id = db_member_c_member_id4easy_access_id($easy_access_id);
        if (!$pre['is_disabled_regist_easy_access_id']) {
            if (!empty($c_member_id) && $id && $c_member_id != $id) {
                $p = array('msg' => 39, 'ses' => $ses, 'id' => $c_member_id);
                openpne_redirect('ktai', 'page_o_regist_ktai', $p);
            } elseif (!empty($c_member_pre_id) && !empty($id)) {
                $p = array('msg' => 39, 'ses' => $ses, 'pre_id' => $c_member_pre_id);
                openpne_redirect('ktai', 'page_o_regist_ktai', $p);
            }
        }

        if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
            if (!empty($c_member_id)) {
                $p = array('msg' => 44, 'ses' => $ses, 'c_member_id' => $c_member_id);
            } elseif (!empty($c_member_pre_id)) {
                $p = array('msg' => 44, 'ses' => $ses, 'c_member_pre_id' => $c_member_pre_id);
            }
            openpne_redirect('ktai', 'page_o_regist_ktai', $p);
        }
        
        if (!empty($c_member_id)) {
            // 既存ユーザの場合は個体識別番号を登録するだけ
            db_member_update_easy_access_id($c_member_id, $easy_access_id);
            db_member_update_ktai_address($c_member_id, $ktai_address);
            db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);
        } elseif (!empty($c_member_pre_id)) {
            // 新規ユーザの場合、PC版で行わなかったメンバー登録処理をここで行う
            $c_member = $pre;
            $c_member['c_member_id_invite'] = $pre['c_member_id_invite'];
            $c_member['is_receive_mail'] = 1;
            $c_member['is_receive_ktai_mail'] = 1;
            $c_member['is_receive_daily_news'] = 1;
            $c_member_secure = array(
                'password' => $pre['password'],
                'c_password_query_id' => $pre['c_password_query_id'],
                'password_query_answer' => $pre['c_password_query_answer'],
                'pc_address' => $pre['pc_address'],
                'ktai_address' => $pre['ktai_address'],
                'regist_address' => $pre['pc_address'],
            );

            $u = db_member_insert_c_member($c_member, $c_member_secure);
    
            if (OPENPNE_USE_POINT_RANK) {
                //入会者にポイント加算
                $point = db_action_get_point4c_action_id(1);
                db_point_add_point($u, $point);
    
                //メンバー招待をした人にポイント付与
                $point = db_action_get_point4c_action_id(7);
                db_point_add_point($pre['c_member_id_invite'], $point);
            }
    
            // c_member_profile
            $c_member_pre_profile = db_member_c_member_pre_profile4c_member_pre_id($pre['c_member_pre_id']);
            foreach ($c_member_pre_profile as $item) {
                db_member_insert_c_member_profile($u, $item['c_profile_id'], $item['c_profile_option_id'], $item['value'], $item['public_flag']);
            }
    
            // 招待者とフレンドリンク
            db_friend_insert_c_friend($u, $pre['c_member_id_invite']);
    
            //管理画面で指定したコミュニティに強制参加
            $c_commu_id_list = db_commu_regist_join_list();
            foreach ($c_commu_id_list as $c_commu_id) {
                db_commu_join_c_commu($c_commu_id, $u);
            }

            db_member_update_easy_access_id($u, $easy_access_id);
            db_member_update_ktai_address($u, $ktai_address);
            db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);
        }
        // pre の内容を削除
        db_member_delete_c_member_pre4sid($ses);
        db_member_delete_c_member_pre4ktai_session($ses);
        db_member_delete_c_member_pre_profile4c_member_pre_id($pre['c_member_pre_id']);

        // 登録完了メール送信
        do_regist_prof_do_regist2_mail_send($u);

        if (!empty($c_member_id)) {
            $p = array('ses' => $ses, 'id' => $c_member_id);
        } elseif (!empty($c_member_pre_id)) {
            $p = array('ses' => $ses, 'pre_id' => $c_member_pre_id);
        }

        openpne_redirect('ktai', 'page_o_regist_ktai_end', $p);
    }
}

?>
