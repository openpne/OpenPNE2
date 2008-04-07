({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* #1952 *})({t_form_block _enctype=file m=biz a=do_fh_biz_schedule_edit})
({* #1952 *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:526px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})<!-- *ここから：予定を編集する＞詳細* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1952 *})<td style="width:488px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定を修正する</span></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主詳細 -->
({* #1952 *})<!-- ここから：主詳細＞＞予定表示 -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:60px;" class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})繰り返し設定
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:391px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0">
({* #1952 *})<tr>
({* #1952 *})<td class="padding_ss" style="width:100px;">
({* #1952 *})
({* #1952 *})<input type='radio' name='sc_rp' value='0' class="no_bg"({if !$is_rep}) checked({/if}) />繰り返さない
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="padding_ss">
({* #1952 *})
({* #1952 *})<select name='sc_bn'>
({* #1952 *})	({section name=i loop=$bn_num})
({* #1952 *})		<option value="({$bn_num[i]})" ({if $banner == $bn_num[i]})selected({/if})>({$bn_num[i]})日間
({* #1952 *})	({/section})
({* #1952 *})</select>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="padding_ss">
({* #1952 *})
({* #1952 *})<input type='radio' name='sc_rp' value='true'class="no_bg" ({if $is_rep}) checked({/if}) />繰り返す
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="padding_ss">
({* #1952 *})
({* #1952 *})<select name='sc_rcount'>
({* #1952 *})	({section name=i loop=$rp_count})
({* #1952 *})		<option value='({$rp_count[i]})' ({if $repeat_term == $rp_count[i]})selected({/if})>({$rp_count[i]})週間
({* #1952 *})	({/section})
({* #1952 *})</select>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="padding_ss" style="text-align:right;">
({* #1952 *})
({* #1952 *})繰り返す曜日
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="padding_ss">
({* #1952 *})
({* #1952 *})({section name=i loop=$wk})
({* #1952 *})<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' class="no_bg"({if $rep_type[i]}) checked({/if}) />({$wk[i]})
({* #1952 *})({/section})
({* #1952 *})	
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({if $is_rep})
({* #1952 *})<tr>
({* #1952 *})<td class="padding_ss" style="text-align:right;" colspan="2">
({* #1952 *})
({* #1952 *})<input type='checkbox' name="iskeep" value='0' checked />この予定のみを編集する
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({else})
({* #1952 *})<input type='hidden' name='iskeep' value='0' />
({* #1952 *})({/if})
({* #1952 *})</table>
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
({* #1952 *})開始日
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<select name='sc_b_year'>
({* #1952 *})	({$years|smarty:nodefaults})
({* #1952 *})</select>
({* #1952 *})<select name='sc_b_month'>
({* #1952 *})	({$monthes|smarty:nodefaults})
({* #1952 *})</select>
({* #1952 *})<select name='sc_b_date'>
({* #1952 *})	({$days|smarty:nodefaults})
({* #1952 *})</select>
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
({* #1952 *})時　刻
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<select name='sc_b_hour'>
({* #1952 *})	<option value=''({if $begin_hour == null}) selected({/if})>--時
({* #1952 *})	({section name=i loop=$hours})
({* #1952 *})		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $begin_hour})({if $begin_hour != null}) selected({/if})({/if})>({$hours[i]})時
({* #1952 *})	({/section})
({* #1952 *})</select>
({* #1952 *})<select name='sc_b_minute'>
({* #1952 *})	<option value=''({if $begin_min == null}) selected({/if})>--分
({* #1952 *})	({section name=i loop=$mins})
({* #1952 *})		<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $begin_min}) ({if $begin_min != null}) selected({/if})({/if})>({$mins[i]})分
({* #1952 *})	({/section})
({* #1952 *})</select>～
({* #1952 *})
({* #1952 *})<select name='sc_f_hour'>
({* #1952 *})	<option value=''({if $finish_hour == null}) selected({/if})>--時
({* #1952 *})	({section name=i loop=$hours})
({* #1952 *})		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $finish_hour}) ({if $finish_hour != null}) selected({/if})({/if})>({$hours[i]})時
({* #1952 *})	({/section})
({* #1952 *})</select>
({* #1952 *})<select name='sc_f_minute'>
({* #1952 *})	<option value=''({if $finish_min == null}) selected({/if})>--分
({* #1952 *})	({section name=i loop=$mins})
({* #1952 *})		<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $finish_min}) ({if $finish_min != null}) selected({/if})({/if})>({$mins[i]})分
({* #1952 *})	({/section})
({* #1952 *})</select>
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
({* #1952 *})タイトル
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<input class="text" type='text' name='sc_title' value="({$title})" size="60" />
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
({* #1952 *})詳細
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<textarea class="text" name='sc_memo' cols="50" rows="5">({$value})</textarea>
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})<input type="hidden" name="biz_group_id" value="0" />
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="center" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})参加者
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0">
({* #1952 *})<tr>
({* #1952 *})({foreach name=i from=$members item=item})
({* #1952 *})({if $item})
({* #1952 *})<td class="padding_ss" style="width:33%;" valign="top">
({* #1952 *})<input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox' class='no_bg'({if $item.checkflag}) checked="checked"({/if}) />({$item.nickname})
({* #1952 *})</td>
({* #1952 *})({else})
({* #1952 *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({if $smarty.foreach.i.last && ($smarty.foreach.i.iteration%3==1 || $smarty.foreach.i.iteration%3==2)})
({* #1952 *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* #1952 *})({/if})
({* #1952 *})({if $smarty.foreach.i.last && $smarty.foreach.i.iteration%3==1 })
({* #1952 *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* #1952 *})({/if})
({* #1952 *})({if !$smarty.foreach.i.last && $smarty.foreach.i.iteration%3==0})
({* #1952 *})</tr><tr>
({* #1952 *})({/if})
({* #1952 *})({/foreach})
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})({*ここまで：新規予定*})
({* #1952 *})
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
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<input type='radio' name='public_flag' value='public' ({if $public_flag == 'public'})checked({/if}) class="no_bg" />全体に公開<br>
({* #1952 *})<input type='radio' name='public_flag' value='private' ({if $public_flag == 'private'})checked({/if}) class="no_bg" />参加者のみに公開<br>
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
({* #1952 *})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="center" colspan="3">
({* #1952 *})
({* #1952 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* #1952 *})
({* #1952 *})<div style="padding:4px 3px;">
({* #1952 *})
({* #1952 *})<input type='submit' class="submit" name='entry' value='登録する' />
({* #1952 *})
({* #1952 *})</div>
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
({* #1952 *})<!-- ここまで：主詳細＞＞予定表示 -->
({* #1952 *})<!-- ここまで：主詳細 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<!-- *ここまで：予定を編集する＞＞詳細* -->
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})({/t_form_block})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
