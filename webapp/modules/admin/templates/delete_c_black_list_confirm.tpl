({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="ブラックリスト設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})({/capture})

({assign var="page_name" value="ブラックリスト削除確認画面"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリスト削除確認画面</h2>
<div class="contents">

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<td>({$c_black_list.c_black_list_id})</td>
</tr>
<tr>
<th>アドレス</th>
<td>({$c_black_list.address})</td>
</tr>
<tr>
<th>登録日</th>
<td>({$c_black_list.r_datetime|date_format:"%y-%m-%d"})</td>
</tr>
<tr>
<th>備考</th>
<td>({$c_black_list.memo})</td>
</tr>
</thead>
</table>

<p>本当に削除してもよろしいですか？</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_black_list','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_black_list_id" value="({$c_black_list.c_black_list_id})">
<p class="textBtn"><input type="submit" value=" は　い ">　<input type="button" value=" いいえ " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})'"></p>
</form>

({$inc_footer|smarty:nodefaults})
