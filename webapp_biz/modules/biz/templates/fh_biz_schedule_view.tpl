({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:626px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：予定を編集する＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- ここから：小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:588px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定の詳細</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<!-- ここから：主内容＞＞予定表示 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:120px;" class="bg_05" align="center" valign="middle">
({* unknown *})
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})タイトル
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:501px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({$schedule.title})
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
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})日時
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({strip})
({* unknown *})({if $schedule.rep_type_loc})
({* unknown *})	毎週 ({$schedule.rep_type_loc})曜日
({* unknown *})({else})
({* unknown *})	({$schedule.begin_date})
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $schedule.begin_date != $schedule.finish_date})
({* unknown *})	～({$schedule.finish_date})
({* unknown *})({/if})
({* unknown *})({/strip})
({* unknown *})
({* unknown *})({strip})
({* unknown *})({$schedule.begin_time})
({* unknown *})({if $schedule.begin_time || $schedule.finish_time})～({/if})
({* unknown *})({$schedule.finish_time}) 
({* unknown *})({/strip})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({if $schedule.rep_first})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})開始日
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({$repeat_begin_date|date_format:"%Y年%m月%d日"})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})期間
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({$repeat_term})週間
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({/if})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})内容
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({$schedule.value|nl2br})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({if $is_h})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})登録者
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})">({$schedule.writer_name})</a>	<br>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({/if})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})参加者
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({foreach item=name key=id from=$jmembers})
({* unknown *})	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$id})">({$name})</a>	<br>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})公開範囲
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})({if $schedule.public_flag == 'private'})
({* unknown *})参加者のみに公開
({* unknown *})({else})
({* unknown *})全体に公開
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="center" colspan="3">
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0">
({* unknown *})<tr>
({* unknown *})
({* unknown *})<td class="padding_ss" align="left">
({* unknown *})
({* unknown *})({t_form_block _method=get m=biz a=page_fh_biz_schedule_calendar})
({* unknown *})<input type="hidden" name="target_id" value="({$target_c_member_id})" />
({* unknown *})<input type="hidden" name="year" value="({$schedule.begin_date|date_format:'%Y'})" />
({* unknown *})<input type="hidden" name="month" value="({$schedule.begin_date|date_format:'%m'})" />
({* unknown *})<input value="月間カレンダーを表示する" type="submit" class="submit" />
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</td>
({* unknown *})
({* unknown *})<td class="padding_ss" align="center">
({* unknown *})
({* unknown *})({t_form_block m=biz a=page_fh_biz_schedule_edit})
({* unknown *})<input type="hidden" name="rep_type" value="({$schedule.rep_type})" />
({* unknown *})<input type="hidden" name="begin_date" value="({$schedule.begin_date})" />
({* unknown *})<input type="hidden" name="begin_time" value="({$schedule.begin_time})" />
({* unknown *})<input type="hidden" name="finish_date" value="({$schedule.finish_date})" />
({* unknown *})<input type="hidden" name="finish_time" value="({$schedule.finish_time})" />
({* unknown *})<input type="hidden" name="title" value="({$schedule.title})" />
({* unknown *})<input type="hidden" name="value" value="({$schedule.value})" />
({* unknown *})<input type="hidden" name="members" value="({$jmembers_enc})" />
({* unknown *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* unknown *})<input type="hidden" name="target_id" value="({$target_c_member_id})" />
({* unknown *})<input type="hidden" name="sc_bn" value="({$sc_bn})" />
({* unknown *})
({* unknown *})<input value="修正する" type="submit" class="submit" />
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</td>
({* unknown *})
({* unknown *})<td class="padding_ss" align="left">
({* unknown *})
({* unknown *})({t_form_block m=biz a=page_h_biz_schedule_delete})
({* unknown *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* unknown *})<input value="削除する" type="submit" class="submit" />
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})
({* unknown *})({if $schedule.rep_first})
({* unknown *})<tr>
({* unknown *})<td class="padding_ss" align="center" colspan="2">
({* unknown *})
({* unknown *})<input value="1" type="checkbox" name="is_rep" checked class="no_bg" />ほかの繰り返し予定も一緒に削除する
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})({/t_form_block})
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
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
({* unknown *})<!-- ここまで：主内容＞＞予定表示 -->
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：予定を編集する＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
