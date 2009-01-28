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
<option value="normal">「メンバー管理」「SNS内データ閲覧部分」以外全て</option>
({/if})
</td>
<td>({if $item.c_admin_user_id != 1})<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_c_admin_user','do')})&amp;target_id=({$item.c_admin_user_id})&amp;sessid=({$PHPSESSID})">削除</a>({else})&nbsp;({/if})</td>
</tr>
({/foreach})
</tbody>
</table>


<p class="add">各権限で使用できる機能は以下のとおりです。</p>

<table class="basicType2">
<thead>
<tr>
<th>項目</th>
<th width="150">全権限</th>
<th width="150">「メンバーリスト関連部分」<br />
以外全て</th>
<th width="150">「メンバー管理」<br />
「SNS内データ閲覧部分」<br />
以外全て</th>
</tr>
</thead>
<tbody>
<tr>
<th>メンバー管理</th>
<td>○</td>
<td>× メンバーリスト<br />
○ 招待メール送信<br />
× CSVダウンロード<br />
○ CSVインポート<br />
× ブラックリスト管理</td>
<td>×</td>
</tr>
<tr>
<th>画像・書き込み管理</th>
<td>○</td>
<td>○</td>
<td>×</td>
</tr>
<tr>
<th>統計情報</th>
<td>○</td>
<td>○</td>
<td>×</td>
</tr>
<tr>
<th>デザイン</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>SNS設定</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>拡張機能</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>管理画面設定</th>
<td>○</td>
<td>× アカウント管理<br />
○ パスワード変更<br />
× ページ名ランダム生成</td>
<td>× アカウント管理<br />
○ パスワード変更<br />
× ページ名ランダム生成</td>
</tr>
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
