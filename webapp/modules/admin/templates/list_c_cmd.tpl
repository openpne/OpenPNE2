({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="CMD設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD設定</h2>
<div class="contents">

<p>※CMD名称記述例 : ファイル名から拡張子を取り除いたもの<br>youtube.js → youtube</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>CMD名称</th>
<th>使用範囲</th>
<th colspan='2'>操作</th>
</tr>
</thead>
<tbody>

({foreach from=$c_cmd_list item=c_cmd})
<tr>
<th>({$c_cmd.c_cmd_id})</th>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">

<td><input type="text" class="basic" name="name" value="({$c_cmd.name})"></td>
<td>

({foreach from=$permit_list key=key item=name})
<input name="permit[]" type="checkbox" value="({$key})"({if $c_cmd.permit[$name] == 1}) checked="checked"({/if})>({$name})<br />
({/foreach})

</td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　変　更　"></span></td>
</form>
<td>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_c_cmd_confirm','page')})">
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">
<span class="textBtnS"><input type="submit" class="submit" value="　削　除　"></span>
</form>

</td>
</tr>
({foreachelse})
<tr>
<td colspan="5">APIが登録されていません</td>
</tr>
({/foreach})
</tbody>

<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<td class="idnumber"></td>
<td><input type="text" class="basic" name="name"></td>
<td>

({foreach from=$permit_list key=key item=name})
<input name="permit[]" type="checkbox" value="({$key})" checked="checked">({$name})<br />
({/foreach})

</td>
<td colspan='2' align='center'><span class="textBtnS"><input type="submit" class="submit" value="　追　加　"></span></td>
</tr>
</form>

</table>

({$inc_footer|smarty:nodefaults})
