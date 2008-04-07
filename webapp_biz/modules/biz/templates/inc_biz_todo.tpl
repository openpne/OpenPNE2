({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})
({* unknown *})<!-- ********************************** -->
({* unknown *})<!-- ******ここから：Todo一覧****** -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:240px;">
({* unknown *})<tr>
({* unknown *})<td style="width:10px;"><img src="./skin/dummy.gif" alt="dummy" style="width:10px;height:10px;display:block;" /></td>
({* unknown *})<td style="width:230px;" align="left">
({* unknown *})
({* unknown *})({t_form_block m=biz a=do_`$cmd`_home_insert_biz_todo})
({* unknown *})<input type="hidden" name="target_id" value="({$target_id})" />
({* unknown *})<input type="hidden" name="nickname" value="({$nickname})" />
({* unknown *})
({* unknown *})({*ここから：header*})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:228px" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy" /></td>
({* unknown *})<td style="width:205px;" class="bg_06"><span class="b_b c_00">Todo一覧</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:228px">
({* unknown *})({****})
({* unknown *})<tr>
({* unknown *})<td class="bg_02 border_01 padding_ss" style="width:228px;border-top:none;border-bottom:none;" align="center">
({* unknown *})
({* unknown *})<textarea class="text" name="todo" value="" style="width:100%;height:3em;"></textarea>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({****})
({* unknown *})<tr>
({* unknown *})<td class="bg_02 border_01 padding_ss" style="border-top:none;" align="right" valign="top">
({* unknown *})
({* unknown *})だれかがTodo<input type="checkbox" name="is_all" value="1" class="no_bg" />&nbsp;
({* unknown *})
({* unknown *})<input type="submit" class="submit" value="追加" />&nbsp;
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({****})
({* unknown *})</table>
({* unknown *})({if $is_todo_list})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:228px">
({* unknown *})({****})
({* unknown *})<tr>
({* unknown *})<td class="bg_02 border_01 padding_ss" style="width:228px;" style="border-top:none;">Todoはありません。</td>
({* unknown *})</tr>
({* unknown *})({****})
({* unknown *})</table>
({* unknown *})({else})
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:228px;">
({* unknown *})({foreach key=i item=value from=$todolist})
({* unknown *})({if $value.memo})
({* unknown *})<tr>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:4px;height:33px;border-top:none;border-right:none;">
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:4px;height:33px;({if $value.priority == 1})background-color:#f00;({elseif $value.priority == 2})background-color:#f88;({/if})" />
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:35px;border-top:none;border-right:none;" valign="top">
({* unknown *})<a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})">
({* unknown *})<img src="./skin/default/img/biz/checkbox_nochecked_({if $value.c_member_id == 0})share_({/if})2.gif" style="width:34px;height:34px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if}) padding_ss" style="width:179px;border-top:none;border-left:none;border-right:none;padding-left:0;" valign="top">
({* unknown *})
({* unknown *})({$value.memo|nl2br|t_url2a})
({* unknown *})({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
({* unknown *})（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:20px;border-top:none;border-left:none;" valign="top">
({* unknown *})
({* unknown *})({**ここから：機能ボタン**})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:16px;height:33px;">
({* unknown *})<tr>
({* unknown *})<td style="width:16px;height:16px;" valign="bottom" align="right">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/edit_2.gif" style="width:14px;height:14px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:16px;height:2px;" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:16px;" valign="top" align="right">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/delete_2.gif" style="width:14px;height:14px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({**ここまで：機能ボタン**})
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({****})
({* unknown *})({/if})
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})
({* unknown *})({foreach key=i item=value from=$checkedlist})
({* unknown *})({if $value.memo})
({* unknown *})<tr>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:4px;height:33px;border-top:none;border-right:none;">
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:4px;height:33px;" />
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:35px;border-top:none;border-right:none;" valign="top">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})">
({* unknown *})<img src="./skin/default/img/biz/checkbox_checked_({if !$value.member_id == 0})share_({/if})2.gif" style="width:34px;height:34px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if}) padding_ss" style="width:181px;border-top:none;border-left:none;border-right:none;padding-left:0;color:#999999;" valign="top">
({* unknown *})
({* unknown *})({$value.memo})
({* unknown *})({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
({* unknown *})（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="border_01({if $value.writer_id != $target_id}) bg_09({else}) bg_02({/if})" style="width:16px;border-top:none;border-left:none;" valign="top">
({* unknown *})
({* unknown *})({**ここから：機能ボタン**})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:16px;height:33px;">
({* unknown *})<tr>
({* unknown *})<td style="width:16px;height:16px;" valign="bottom" align="right">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})"><img src="./skin/default/img/biz/edit_2.gif" style="width:14px;height:14px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:16px;height:2px;" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:16px;" valign="top" align="right">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})"><img src="./skin/default/img/biz/delete_2.gif" style="width:14px;height:14px;display:block;" /></a>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({**ここまで：機能ボタン**})
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({****})
({* unknown *})({/if})
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<!-- ******ここまで：Todo一覧****** -->
({* unknown *})<!-- ********************************** -->
