({* unknown *})({if $head})<!-- HEADER_BEGIN -->
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})
({* unknown *})<!-- ***************************** -->
({* unknown *})<!-- ******ここから：週間予定****** -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
({* unknown *})<tr>
({* unknown *})<td style="width:5px;"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:7px;" class="dummy" /></td>
({* unknown *})<td style="width:713px;" class="bg_02">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:713px;margin:0px;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:699px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:699px;height:7px;" class="dummy" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_02">
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})
({* unknown *})({if $msg})
({* unknown *})<div class="border_01 bg_02">
({* unknown *})
({* unknown *})<div class="padding_s" align="left">
({* unknown *})<span class="caution">({$msg})</span>
({* unknown *})</div>
({* unknown *})
({* unknown *})</div>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $cmd == "g"})
({* unknown *})({t_form_block m=biz a=do_g_home_add_biz_schedule})
({* unknown *})<input type="hidden" name="target_id" value="({$target_id})" />
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
({* unknown *})<tr>
({* unknown *})<td class="border_01 bg_02" align="right" style="width:130px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:129px;height:10px;" class="dummy" /></td>
({* unknown *})<td class="border_01 bg_02 padding_ss" align="left" style="width:100px;border-right:none;">
({* unknown *})
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;target_biz_group_id=({$target_id})">新規予定登録</a>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="right">
({* unknown *})
({* unknown *})予定：
({* unknown *})<input type="text" class="text" name="title" value="" size="30" />
({* unknown *})<select name="start_date">
({* unknown *})({foreach from=$daylist item=item})
({* unknown *})<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({* unknown *})({/foreach})
({* unknown *})</select>
({* unknown *})<input type="submit" class="submit" value="追加" />
({* unknown *})
({* unknown *})&nbsp;
({* unknown *})<a href="({t_url m=biz a=page_`$cmd`_home})&amp;w=({$w-1})&amp;target_c_commu_id=({$target_id})" title="前の週">＜</a>
({* unknown *})<a href="({t_url m=biz a=page_`$cmd`_home})&amp;target_c_commu_id=({$target_id})" title="今週">■</a>
({* unknown *})<a href="({t_url m=biz a=page_`$cmd`_home})&amp;w=({$w+1})&amp;target_c_commu_id=({$target_id})" title="次の週">＞</a>
({* unknown *})&nbsp;
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})<div>
({* unknown *})({elseif $cmd == "s_list"})
({* unknown *})
({* unknown *})({t_form_block m=biz a=do_s_add_schedule})
({* unknown *})<input type="hidden" name="shisetsu_id" value="({$target_id})" />
({* unknown *})
({* unknown *})<div class="border_01">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:697px;">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:666px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$list.name})</span></td>
({* unknown *})</tr>
({* unknown *})({if $list.info})
({* unknown *})<tr>
({* unknown *})<td class="border_01 bg_02" align="left" style="width:10px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:9px;height:10px;" class="dummy" /></td>
({* unknown *})<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="left">
({* unknown *})({$list.info})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
({* unknown *})<tr>
({* unknown *})<td class="border_01 bg_02" align="right" style="width:130px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:129px;height:10px;" class="dummy" /></td>
({* unknown *})<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="right">
({* unknown *})
({* unknown *})施設予約を入れる:
({* unknown *})
({* unknown *})<select name="start_date">
({* unknown *})({foreach from=$calendar item=item})
({* unknown *})<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({* unknown *})({/foreach})
({* unknown *})</select>
({* unknown *})
({* unknown *})<select name='start_time'>
({* unknown *})	<option value=''>現在時
({* unknown *})	({section name=i loop=$hours})
({* unknown *})		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})">({$hours[i]})時
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})から
({* unknown *})<select name='finish_time'>
({* unknown *})	({section name=i loop=$mins})
({* unknown *})		<option value="({$mins[i]})">({$mins[i]})分後
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})まで
({* unknown *})<input type="submit" class="submit" value="追加" />
({* unknown *})
({* unknown *})&nbsp;
({* unknown *})<a href="({t_url m=biz a=page_s_list})&amp;w=({$w-1})" title="前の週">＜</a>
({* unknown *})<a href="({t_url m=biz a=page_s_list})" title="今週">■</a>
({* unknown *})<a href="({t_url m=biz a=page_s_list})&amp;w=({$w+1})" title="次の週">＞</a>
({* unknown *})&nbsp;
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* unknown *})<div class="border_01" style="border-left:none;border-right:none;border-bottom:none;">
({* unknown *})({/if})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
({* unknown *})({/if})  <!-- END HEAD -->
({* unknown *})
({* unknown *})
({* unknown *})({if $value})  <!-- BEGIN VALUE -->
({* unknown *})({*****})
({* unknown *})<tr>
({* unknown *})<td class="bg_05 border_01" style="width:131px;border-top:none;border-right:none;" align="center" valign="top"><img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy" /></td>
({* unknown *})({foreach from=$calendar item=item name=calendar})
({* unknown *})<td class="({if $item.now})bg_09({else})bg_05({/if}) padding_ss border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if})" align="center">
({* unknown *})
({* unknown *})({if $item.now})<span class="b_b">({/if})
({* unknown *})
({* unknown *})({if $smarty.foreach.calendar.first || $item.day == 1})
({* unknown *})({$item.month_disp})/({/if})({$item.day_disp})(({$item.dayofweek}))
({* unknown *})
({* unknown *})({if $item.now})</span>({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})({/foreach})
({* unknown *})</tr>
({* unknown *})({*****})
({* unknown *})<tr>
({* unknown *})<td class="bg_02 border_01" style="width:131px;border-top:none;border-right:none;" align="center" valign="top" rowspan="2">
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy" />
({* unknown *})
({* unknown *})<a href="({t_url m=pc a=page_f_home})&target_c_member_id=({$member_info.c_member_id})">
({* unknown *})({if $cmd == "s_list"})
({* unknown *})<img src="({t_img_url filename=$list.image_filename w=120 h=120 noimg=no_image})" class="pict" alt="写真" style="margin:2px" /></a>
({* unknown *})({else})
({* unknown *})<img src="({t_img_url filename=$member_info.image_filename w=120 h=120 noimg=no_image})" class="pict" alt="写真" style="margin:2px" /></a>
({* unknown *})({/if})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy" />
({* unknown *})
({* unknown *})({if $cmd == "s_list"})
({* unknown *})({if !$is_closed_shisetsu})
({* unknown *})<input type="button" onClick="location.href='({t_url m=biz a=page_s_edit_shisetsu})&id=({$target_id})'" value="編　集" style="width:112px;" class="submit" />
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:3px;" class="dummy" />
({* unknown *})
({* unknown *})<input type="button" onClick="location.href='({t_url m=biz a=page_s_delete_shisetsu})&target_id=({$target_id})&sessid=({$PHPSESSID})'" value="削　除" style="width:112px;" class="submit" />
({* unknown *})({/if})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* unknown *})({if $cmd != "h"})
({* unknown *})<a href="({t_url m=pc a=page_f_home})&target_c_member_id=({$member_info.c_member_id})" class="border_01 bg_02" style="padding:4px 0;display:block;border-left:none;border-right:none;">({$member_info.nickname})</a>
({* unknown *})最終ログインは<br>({$member_info.last_login})<br>
({* unknown *})({else})
({* unknown *})<div class="border_01 bg_02" style="padding:4px 0;display:block;border-left:none;border-right:none;">
({* unknown *})
({* unknown *})({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $member_info.c_member_id != 1})
({* unknown *})({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({* unknown *})({if $smarty.const.OPENPNE_DISP_RANK && $rank})
({* unknown *})<img src="({t_img_url filename=$rank.image_filename})" class="pict" alt="({$rank.name})" style="margin:2px" /><br>
({* unknown *})({/if})
({* unknown *})({if $smarty.const.OPENPNE_DISP_POINT && $point})
({* unknown *})({$point}) Point<br>
({* unknown *})({/if})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})({/if})
({* unknown *})({/if})
({* unknown *})
({* unknown *})({$stateform|smarty:nodefaults})
({* unknown *})</div>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({/if})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})
({* unknown *})({if $cmd == "h"})
({* unknown *})<input type="button" onClick="location.href='({t_url m=pc a=page_h_config_image})'" value="写真を編集" style="width:112px;" class="submit" />
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})
({* unknown *})<input type="button" onClick="location.href='({t_url m=pc a=page_h_config_prof})'" value="プロフィール変更" style="width:112px;" class="submit" />
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})({foreach from=$calendar item=item name=calendar})
({* unknown *})<td class="({if $item.now})bg_09({else})bg_02({/if}) border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if}) border-bottom:none;" align="left" valign="top">
({* unknown *})
({* unknown *})({* 祝日 *})
({* unknown *})<div class="padding_s">
({* unknown *})({foreach from=$item.holiday item=item_holiday})
({* unknown *})({$item_holiday})<br>
({* unknown *})({/foreach})
({* unknown *})</div>
({* unknown *})
({* unknown *})({* スケジュール(時間有) *})
({* unknown *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* unknown *})	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
({* unknown *})	({elseif $cmd == 's_list'})
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({/if})
({* unknown *})<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})({$item_schedule.c_member_name})
({* unknown *})</div></a>
({* unknown *})	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({/if})
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
({* unknown *}) </div>
({* unknown *})	({else})
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({else})
({* unknown *})({assign var="finish_time_H" value=""})
({* unknown *})({assign var="finish_time_M" value=""})
({* unknown *})({/if})
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
({* unknown *})</div>
({* unknown *})	({/if})
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:80px;height:10px;" class="dummy" />
({* unknown *})
({* unknown *})</td>
({* unknown *})({/foreach})
({* unknown *})</tr>
({* unknown *})({*****})
({* unknown *})
({* unknown *})<tr>
({* unknown *})
({* unknown *})({foreach from=$calendar item=item name=calendar})
({* unknown *})<td class="({if $item.now})bg_09({else})bg_02({/if}) border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if})" align="left" valign="top">
({* unknown *})
({* unknown *})({if $cmd == 'h'})
({* unknown *})({* 誕生日 *})
({* unknown *})({foreach from=$item.birth item=item_birth})
({* unknown *})<div class="padding_s"><img src="({t_img_url_skin filename=icon_birthday})" class="icon" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a></div>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* イベント *})
({* unknown *})({foreach from=$item.event item=item_event})
({* unknown *})<div class="padding_s"><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a></div>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})
({* unknown *})({* Todo *})
({* unknown *})({foreach from=$item.todo item=item_todo})
({* unknown *})<div class="padding_s">
({* unknown *})<img src="./skin/default/img/biz/todo_icon.gif"  class="icon" />
({* unknown *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&target_id=({$member_info.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a></div>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* スケジュール(時間無) *})
({* unknown *})({if $item.schedule})
({* unknown *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* unknown *})	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
({* unknown *})<div class="padding_s">
({* unknown *})({*<img src="({t_img_url_skin filename=icon_pen})" class="icon" />*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
({* unknown *})</div>
({* unknown *})	({else})
({* unknown *})&nbsp;
({* unknown *})	({/if})
({* unknown *})({/foreach})
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})</tr>
({* unknown *})({/if})  <!-- END VALUE -->
({* unknown *})
({* unknown *})({if $foot})  <!-- BEGIN FOOT -->
({* unknown *})<tr>
({* unknown *})<td class="bg_02 border_01" style="border-top:none;border-right:none;" align="center" valign="top"><img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy" /></td>
({* unknown *})<td class="bg_02 border_01" style="border-top:none;" align="right" valign="top" colspan="7">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
({* unknown *})<tr>
({* unknown *})<td class="({if $cmd != "g"})border_01 ({/if})padding_ss" align="left" valign="middle" style="border-left:none;border-top:none;border-bottom:none;border-right:none;">
({* unknown *})
({* unknown *})({if ($cmd == "h") || ($cmd == "f")})
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">月間カレンダー</a>
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss" align="right" valign="middle">
({* unknown *})
({* unknown *})({if ($cmd == "h") || ($cmd == "f")})
({* unknown *})({t_form_block m=biz a=do_`$cmd`_home_add_biz_schedule})
({* unknown *})<input type="hidden" name="target_id" value="({$target_id})" />
({* unknown *})予定：
({* unknown *})<input type="text" class="text" name="title" value="" size="30" />
({* unknown *})<select name="start_date">
({* unknown *})({foreach from=$daylist item=item})
({* unknown *})<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({* unknown *})({/foreach})
({* unknown *})</select>
({* unknown *})<input type="submit" class="submit" value="追加" />
({* unknown *})
({* unknown *})&nbsp;
({* unknown *})<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w-1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="前の週">＜</a>
({* unknown *})<a href="({t_url m=pc a=page_`$cmd`_home})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="今週">■</a>
({* unknown *})<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w+1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="次の週">＞</a>
({* unknown *})&nbsp;
({* unknown *})({/t_form_block})
({* unknown *})({else})
({* unknown *})
({* unknown *})&nbsp;
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ******ここまで：週間予定****** -->
({* unknown *})<!-- ***************************** -->
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})({/if}) <!-- END FOOT -->
