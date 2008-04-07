({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:626px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})<!-- *ここから：予定を編集する＞内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1952 *})<td style="width:588px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定の詳細</span></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})<!-- ここから：主内容＞＞予定表示 -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:120px;" class="bg_05" align="center" valign="middle">
({* #1952 *})
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})タイトル
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:501px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({$schedule.title})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})日時
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({strip})
({* #1952 *})({if $schedule.rep_type_loc})
({* #1952 *})	毎週 ({$schedule.rep_type_loc})曜日
({* #1952 *})({else})
({* #1952 *})	({$schedule.begin_date})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({if $schedule.begin_date != $schedule.finish_date})
({* #1952 *})	～({$schedule.finish_date})
({* #1952 *})({/if})
({* #1952 *})({/strip})
({* #1952 *})
({* #1952 *})({strip})
({* #1952 *})({$schedule.begin_time})
({* #1952 *})({if $schedule.begin_time || $schedule.finish_time})～({/if})
({* #1952 *})({$schedule.finish_time}) 
({* #1952 *})({/strip})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({if $schedule.rep_first})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})開始日
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({$repeat_begin_date|date_format:"%Y年%m月%d日"})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})期間
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({$repeat_term})週間
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({/if})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})内容
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({$schedule.value|nl2br})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({if $is_h})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})登録者
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})">({$schedule.writer_name})</a>	<br>
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({/if})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})参加者
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({foreach item=name key=id from=$jmembers})
({* #1952 *})	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$id})">({$name})</a>	<br>
({* #1952 *})({/foreach})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})公開範囲
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})({if $schedule.public_flag == 'private'})
({* #1952 *})参加者のみに公開
({* #1952 *})({else})
({* #1952 *})全体に公開
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="center" colspan="3">
({* #1952 *})
({* #1952 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0">
({* #1952 *})<tr>
({* #1952 *})
({* #1952 *})<td class="padding_ss" align="left">
({* #1952 *})
({* #1952 *})({t_form_block _method=get m=biz a=page_fh_biz_schedule_calendar})
({* #1952 *})<input type="hidden" name="target_id" value="({$target_c_member_id})" />
({* #1952 *})<input type="hidden" name="year" value="({$schedule.begin_date|date_format:'%Y'})" />
({* #1952 *})<input type="hidden" name="month" value="({$schedule.begin_date|date_format:'%m'})" />
({* #1952 *})<input value="月間カレンダーを表示する" type="submit" class="submit" />
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})
({* #1952 *})<td class="padding_ss" align="center">
({* #1952 *})
({* #1952 *})({t_form_block m=biz a=page_fh_biz_schedule_edit})
({* #1952 *})<input type="hidden" name="rep_type" value="({$schedule.rep_type})" />
({* #1952 *})<input type="hidden" name="begin_date" value="({$schedule.begin_date})" />
({* #1952 *})<input type="hidden" name="begin_time" value="({$schedule.begin_time})" />
({* #1952 *})<input type="hidden" name="finish_date" value="({$schedule.finish_date})" />
({* #1952 *})<input type="hidden" name="finish_time" value="({$schedule.finish_time})" />
({* #1952 *})<input type="hidden" name="title" value="({$schedule.title})" />
({* #1952 *})<input type="hidden" name="value" value="({$schedule.value})" />
({* #1952 *})<input type="hidden" name="members" value="({$jmembers_enc})" />
({* #1952 *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* #1952 *})<input type="hidden" name="target_id" value="({$target_c_member_id})" />
({* #1952 *})<input type="hidden" name="sc_bn" value="({$sc_bn})" />
({* #1952 *})
({* #1952 *})<input value="修正する" type="submit" class="submit" />
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})
({* #1952 *})<td class="padding_ss" align="left">
({* #1952 *})
({* #1952 *})({t_form_block m=biz a=page_h_biz_schedule_delete})
({* #1952 *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* #1952 *})<input value="削除する" type="submit" class="submit" />
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})
({* #1952 *})({if $schedule.rep_first})
({* #1952 *})<tr>
({* #1952 *})<td class="padding_ss" align="center" colspan="2">
({* #1952 *})
({* #1952 *})<input value="1" type="checkbox" name="is_rep" checked class="no_bg" />ほかの繰り返し予定も一緒に削除する
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({/if})
({* #1952 *})({/t_form_block})
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：主内容＞＞予定表示 -->
({* #1952 *})<!-- ここまで：主内容 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<!-- *ここまで：予定を編集する＞＞内容* -->
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
