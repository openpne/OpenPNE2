({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({t_form_block m=biz a=do_`$cmd`_home_edit_biz_todo})
({* unknown *})<input type="hidden" name="target_id" value="({$target_id})" />
({* unknown *})<input type="hidden" name="nickname" value="({$nickname})" />
({* unknown *})<input name="id" type="hidden" value="({$todo.biz_todo_id})" />
({* unknown *})<input name="writer_id" type="hidden" value="({$todo.writer_id})" />
({* unknown *})<input name="writer_name" type="hidden" value="({$todo.writer_name})" />
({* unknown *})<input name="sort_order" type="hidden" value="({$todo.sort_order})" />
({* unknown *})<input name="member_id" type="hidden" value="({$todo.c_member_id})" />
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：Todo編集＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- ここから：小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* unknown *})Todo編集
({* unknown *})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<!-- ここから：主内容＞＞編集入力フォーム -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:130px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})Todo
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:503px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})<textarea class="text" name="memo" style="width:30em;height:6em;">({$todo.memo})</textarea>
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})<input type="checkbox" name="is_done" value="1"({if $todo.is_check}) checked({/if}) class="no_bg" />このTodoを完了済みにする<br>
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:130px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})目標期日
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:503px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})<select name="due_year">
({* unknown *})<option>--
({* unknown *})({foreach from=$year_list item=item})
({* unknown *})<option value="({$item})"({if $item==$todo_date.0}) selected({/if})>({$item})
({* unknown *})({/foreach})
({* unknown *})</select>年
({* unknown *})<select name="due_month">
({* unknown *})<option>--
({* unknown *})({foreach from=$month_list item=item})
({* unknown *})<option value="({$item})"({if $item==$todo_date.1}) selected({/if})>({$item})
({* unknown *})({/foreach})
({* unknown *})</select>月
({* unknown *})<select name="due_day">
({* unknown *})<option>--
({* unknown *})({foreach from=$day_list item=item})
({* unknown *})<option value="({$item})"({if $item==$todo_date.2}) selected({/if})>({$item})
({* unknown *})({/foreach})
({* unknown *})</select>日
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:130px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})重要度
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:503px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})<select name="priority">
({* unknown *})	<option value="1"({if $todo.priority == 1}) selected({/if})>高
({* unknown *})	<option value="2"({if $todo.priority == 2}) selected({/if})>中
({* unknown *})	<option value="3"({if $todo.priority == 3}) selected({/if})>低
({* unknown *})</select>
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:130px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})グループ
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:503px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})<select name="biz_group_id">
({* unknown *})	<option value="0">指定なし
({* unknown *})({foreach from=$biz_group_list item=biz_group})
({* unknown *})	<option value="({$biz_group.biz_group_id})"
({* unknown *})	({if $biz_group.biz_group_id == $todo.biz_group_id})
({* unknown *})	 selected
({* unknown *})	({/if})
({* unknown *})	>({$biz_group.name})
({* unknown *})({/foreach})
({* unknown *})</select>
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:130px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})公開範囲
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:503px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})<input type="radio" name="public_flag" value="public"({if $todo.public_flag == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_public" /><label for="public_flag_public">全員に公開</label><br>
({* unknown *})<input type="radio" name="public_flag" value="group"({if $todo.public_flag == "group"}) checked="checked"({/if}) class="no_bg" id="public_flag_group" /><label for="public_flag_group">グループまで公開</label><br>
({* unknown *})({if $is_h})
({* unknown *})<input type="radio" name="public_flag" value="private"({if $todo.public_flag == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_private" /><label for="public_flag_private">公開しない</label><br>
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})<input type="checkbox" name="is_check" value="1"({if $todo.c_member_id == 0}) checked({/if}) class="no_bg" />だれかがTodo<br>
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_03" align="center" valign="middle" colspan="3">
({* unknown *})
({* unknown *})<div style="text-align:left;" class="padding_w_s">
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* unknown *})
({* unknown *})<div style="text-align:center;">
({* unknown *})<input type="submit" class="submit" value="　編　集　" />
({* unknown *})</div>
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})</table>
({* unknown *})<!-- ここから：主内容＞＞編集入力フォーム -->
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：Todo編集＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
