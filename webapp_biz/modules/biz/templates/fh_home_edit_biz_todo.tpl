<div id="LayoutC">
<div id="Center">

({t_form_block m=biz a=do_`$cmd`_home_edit_biz_todo})
<input type="hidden" name="target_id" value="({$target_id})" />
<input type="hidden" name="nickname" value="({$nickname})" />
<input name="id" type="hidden" value="({$todo.biz_todo_id})" />
<input name="writer_id" type="hidden" value="({$todo.writer_id})" />
<input name="writer_name" type="hidden" value="({$todo.writer_name})" />
<input name="sort_order" type="hidden" value="({$todo.sort_order})" />
<input name="member_id" type="hidden" value="({$todo.c_member_id})" />
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_01" align="center">
<!-- *ここから：Todo編集＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
Todo編集
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞編集入力フォーム -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

Todo

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<textarea class="text" name="memo" style="width:30em;height:6em;">({$todo.memo})</textarea>

</div>

<div class="padding_s">

<input type="checkbox" name="is_done" value="1"({if $todo.is_check}) checked({/if}) class="no_bg" />このTodoを完了済みにする<br>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

目標期日

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<select name="due_year">
<option>--
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$todo_date.0}) selected({/if})>({$item})
({/foreach})
</select>年
<select name="due_month">
<option>--
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$todo_date.1}) selected({/if})>({$item})
({/foreach})
</select>月
<select name="due_day">
<option>--
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$todo_date.2}) selected({/if})>({$item})
({/foreach})
</select>日

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

重要度

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">
<select name="priority">
	<option value="1"({if $todo.priority == 1}) selected({/if})>高
	<option value="2"({if $todo.priority == 2}) selected({/if})>中
	<option value="3"({if $todo.priority == 3}) selected({/if})>低
</select>
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

グループ

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">
<select name="biz_group_id">
	<option value="0">指定なし
({foreach from=$biz_group_list item=biz_group})
	<option value="({$biz_group.biz_group_id})"
	({if $biz_group.biz_group_id == $todo.biz_group_id})
	 selected
	({/if})
	>({$biz_group.name})
({/foreach})
</select>
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

公開範囲

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="radio" name="public_flag" value="public"({if $todo.public_flag == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_public" /><label for="public_flag_public">全員に公開</label><br>
<input type="radio" name="public_flag" value="group"({if $todo.public_flag == "group"}) checked="checked"({/if}) class="no_bg" id="public_flag_group" /><label for="public_flag_group">グループまで公開</label><br>
({if $is_h})
<input type="radio" name="public_flag" value="private"({if $todo.public_flag == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_private" /><label for="public_flag_private">公開しない</label><br>
({/if})
</div>

<div class="padding_s">

<input type="checkbox" name="is_check" value="1"({if $todo.c_member_id == 0}) checked({/if}) class="no_bg" />だれかがTodo<br>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<div style="text-align:left;" class="padding_w_s">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />

<div style="text-align:center;">
<input type="submit" class="submit" value="　編　集　" />
</div>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
</table>
<!-- ここから：主内容＞＞編集入力フォーム -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：Todo編集＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
</table>
({/t_form_block})

</div><!-- Center -->
</div><!-- LayoutC -->
