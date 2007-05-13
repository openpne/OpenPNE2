({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="page_name" value="アカウント管理"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>アカウント管理</h2>
<div class="contents">
<p class="info">管理用アカウントを設定します。</p>
<p class="add"><strong class="item"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_admin_user')})">アカウントを追加する</a></strong></p>

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table class="basicType2">
({capture name="table_header"})
<tr>
<th>ID</th>
<th>アカウント名</th>
<th>権限</th>
<th>操作</th>
</tr>
({/capture})
<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tbody>
({foreach from=$user_list item=item})
<tr id="userID({$item.c_admin_user_id})">
<td class="cell01">({$item.c_admin_user_id})</td>
<td>({$item.username})</td>
<td>
({if $item.auth_type=='all'})
<option value="all">全権限</option>
({elseif $item.auth_type==''})
<option value="">「メンバーリスト関連部分」以外全て</option>
({elseif $item.auth_type=='normal'})
<option value="normal">「メンバーリスト関連部分」「SNS内データ閲覧部分」以外全て</option>
({/if})
</td>
<td>({if $item.c_admin_user_id != 1})<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_c_admin_user','do')})&amp;target_id=({$item.c_admin_user_id})&amp;sessid=({$PHPSESSID})">削除</a>({else})&nbsp;({/if})</td>
</tr>
({/foreach})
</tbody>
</table>

<pre>
■全権限
1) ○メンバー管理
2) ○画像・書き込み管理
3) ○統計情報
4) ○デザイン
5) ○SNS設定
6) ○お知らせ・規約設定
7) ○管理画面設定

■「メンバーリスト関連部分」以外全て
1) △メンバー管理
 1-1) ×メンバーリスト
 1-2) ○招待メール送信
 1-3) ×CSVダウンロード
 1-4) ○CSVインポート
2) ○画像・書き込み管理
3) ○統計情報
4) ○デザイン
5) ○SNS設定
6) ○お知らせ・規約設定
7) △管理画面設定
 7-1) ×アカウント管理
 7-2) ○パスワード変更
 7-3) ×ページ名ランダム生成

■「メンバーリスト関連部分」「SNS内データ閲覧部分」以外全て
1) ×メンバー管理
2) ×画像・書き込み管理
3) ×統計情報
4) ○デザイン
5) ○SNS設定
6) ○お知らせ・規約設定
7) △管理画面設定
 7-1) ×アカウント管理
 7-2) ○パスワード変更
 7-3) ×ページ名ランダム生成
</pre>

({$inc_footer|smarty:nodefaults})
