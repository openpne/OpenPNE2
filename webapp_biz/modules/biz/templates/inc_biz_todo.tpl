<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<!-- ********************************** -->
<!-- ******ここから：Todo一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:240px;">
<tr>
<td style="width:10px;"><img src="./skin/dummy.gif" alt="dummy" style="width:10px;height:10px;display:block;"></td>
<td style="width:230px;" align="left">

({t_form m=biz a=do_`$cmd`_home_insert_biz_todo})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$target_id})">
<input type="hidden" name="nickname" value="({$nickname})">

({*ここから：header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:228px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:205px;" class="bg_06"><span class="b_b c_00">Todo一覧</span></td>
</tr>
</table>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:228px">
({****})
<tr>
<td class="bg_02 border_01 padding_ss" style="width:228px;border-top:none;border-bottom:none;" align="center">

<textarea class="text" name="todo" value="" style="width:100%;height:3em;"></textarea>

</td>
</tr>
({****})
<tr>
<td class="bg_02 border_01 padding_ss" style="border-top:none;" align="right" valign="top">

だれかがTodo<input type="checkbox" name="is_all" value="1" class="no_bg">&nbsp;

<input type="submit" class="submit" value="追加">&nbsp;

</td>
</tr>
({****})
</table>
({if $is_todo_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:228px">
({****})
<tr>
<td class="bg_02 border_01 padding_ss" style="width:228px;" style="border-top:none;">Todoはありません。</td>
</tr>
({****})
</table>
({else})

<table border="0" cellspacing="0" cellpadding="0" style="width:228px;">
({foreach key=i item=value from=$todolist})
({if $value.memo})
<tr>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:4px;height:33px;border-top:none;border-right:none;">
<img src="./skin/dummy.gif" alt="dummy" style="width:4px;height:33px;({if $value.priority == 1})background-color:#f00;({elseif $value.priority == 2})background-color:#f88;({/if})">
</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:35px;border-top:none;border-right:none;" valign="top">
<a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})&amp;target_c_member_id=({$target_id})">
<img src="./skin/default/img/biz/checkbox_nochecked_({if $value.c_member_id == 0})share_({/if})2.gif" style="width:34px;height:34px;display:block;"></a>

</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if}) padding_ss" style="width:179px;border-top:none;border-left:none;border-right:none;padding-left:0;" valign="top">

({$value.memo|nl2br|t_url2a})
({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({/if})

</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:20px;border-top:none;border-left:none;" valign="top">

({**ここから：機能ボタン**})
<table border="0" cellspacing="0" cellpadding="0" style="width:16px;height:33px;">
<tr>
<td style="width:16px;height:16px;" valign="bottom" align="right">

<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/edit_2.gif" style="width:14px;height:14px;display:block;"></a>

</td>
</tr>
<tr>
<td style="height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:16px;height:2px;"></td>
</tr>
<tr>
<td style="height:16px;" valign="top" align="right">

<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/delete_2.gif" style="width:14px;height:14px;display:block;"></a>

</td>
</tr>
</table>
({**ここまで：機能ボタン**})

</td>
</tr>
({****})
({/if})
({/foreach})


({foreach key=i item=value from=$checkedlist})
({if $value.memo})
<tr>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:4px;height:33px;border-top:none;border-right:none;">
<img src="./skin/dummy.gif" alt="dummy" style="width:4px;height:33px;">
</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:35px;border-top:none;border-right:none;" valign="top">

<a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})&amp;target_c_member_id=({$target_id})">
<img src="./skin/default/img/biz/checkbox_checked_({if !$value.member_id == 0})share_({/if})2.gif" style="width:34px;height:34px;display:block;"></a>

</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if}) padding_ss" style="width:181px;border-top:none;border-left:none;border-right:none;padding-left:0;color:#999999;" valign="top">

({$value.memo})
({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({/if})

</td>
<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:16px;border-top:none;border-left:none;" valign="top">

({**ここから：機能ボタン**})
<table border="0" cellspacing="0" cellpadding="0" style="width:16px;height:33px;">
<tr>
<td style="width:16px;height:16px;" valign="bottom" align="right">

<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/edit_2.gif" style="width:14px;height:14px;display:block;"></a>

</td>
</tr>
<tr>
<td style="height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:16px;height:2px;"></td>
</tr>
<tr>
<td style="height:16px;" valign="top" align="right">

<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})"><img src="./skin/default/img/biz/delete_2.gif" style="width:14px;height:14px;display:block;"></a>

</td>
</tr>
</table>
({**ここまで：機能ボタン**})

</td>
</tr>
({****})
({/if})
({/foreach})


({/if})
</table>
</form>

</td>
</tr>
</table>

<!-- ******ここまで：Todo一覧****** -->
<!-- ********************************** -->
