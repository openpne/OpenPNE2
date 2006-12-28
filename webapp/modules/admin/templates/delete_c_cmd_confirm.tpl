({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="CMD設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})({/capture})

({assign var="page_name" value="CMD削除確認画面"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD削除確認画面</h2>
<div class="contents">

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<td>({$c_cmd.c_cmd_id})</td>
</tr>
<tr>
<th>URL</th>
<td>({$c_cmd.name})</td>
</tr>
<tr>
<th>使用範囲</th>
<td>
({foreach from=$permit_list key=key item=name})
({$name}) : ({if $c_cmd.permit[$name] == 1})可({else})不可({/if})<br>
({/foreach})
</td>
</tr>
</thead>
</table>

<p>本当に削除してもよろしいですか？</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">
<p class="textBtn"><input type="submit" value=" は　い ">　<input type="button" value=" いいえ " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})'"></p>
</form>

({$inc_footer|smarty:nodefaults})
