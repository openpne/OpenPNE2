<div class="subNavi">
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})" title="SNS設定変更: SNSの動作に関する詳細設定">SNS設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})" title="登録できるドメインの設定">ドメイン制限</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})" title="APIの設定">API設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})" title="CMDタグの使用箇所・使用サービスの設定">CMD設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})" title="メール設定変更: SNSから送信する各種メールの送信設定、文言変更">メール送信設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})" title="メール文言変更: SNSから送信する各種メールの文言変更">メール文言変更</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})" title="プロフィール項目変更: プロフィール項目の追加、編集、削除、並び替え">プロフィール項目設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})" title="コミュニティカテゴリ変更: コミュニティカテゴリの追加、編集、削除、並び替え">コミュニティカテゴリ設定</a>&nbsp;|&nbsp;
({if $auth_type == 'all' || $auth_type == ''})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})" title="初期コミュニティ設定: 新規登録時に参加させるコミュニティの設定">初期コミュニティ設定</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})" title="カレンダーの祝日の設定：　カレンダーに表示させる祝日の設定">祝日設定</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_DISP_POINT})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})" title="ランクの設定：　貯めたポイントで到達するランクを設定">ランク設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})" title="アクションの設定：　ユーザーの行動毎に加算されるポイントを設定">アクション設定</a>
({/if})
</div>
