({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="祝日設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>祝日設定</h2>
<div class="contents">

<p>祝日名称と祝日を設定してください。</p>

<table class="basicType2">
<thead>
<tr>
<th>祝日名称</th>
<th>祝日</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_holiday_list item=item})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_holiday','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_holiday_id" value="({$item.c_holiday_id})">
<input type="text" class="basic" name="name" value="({$item.name})" size="20"></td>
<td><select class="basic" name="month">
({foreach from=$month_list item=monthvalue})
<option value="({$monthvalue})"({if $monthvalue==$item.month}) selected({/if})>({$monthvalue})
({/foreach})
</select>月
<select class="basic" name="day">
({foreach from=$day_list item=dayvalue})
<option value="({$dayvalue})"({if $dayvalue==$item.day}) selected({/if})>({$dayvalue})
({/foreach})
</select>日</td>
<td><span class="textBtnS"><input type="submit" value="　変　更　"></span></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_holiday','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_holiday_id" value="({$item.c_holiday_id})">
<span class="textBtnS"><input type="submit" class="submit" value="　削　除　"></span>
</td>
</form>
</tr>
({/foreach})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_holiday','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="text" class="basic" name="name" value="" size="20"></td>
<td><select class="basic" name="month">
({foreach from=$month_list item=monthvalue})
<option value="({$monthvalue})">({$monthvalue})
({/foreach})
</select>月
<select class="basic" name="day">
({foreach from=$day_list item=dayvalue})
<option value="({$dayvalue})">({$dayvalue})
({/foreach})
</select>日</td>
<td colspan="2"><span class="textBtnS"><input type="submit" value="項目追加"></span></td>
</form>
</tr>
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
