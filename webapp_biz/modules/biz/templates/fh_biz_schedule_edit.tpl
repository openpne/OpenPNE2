({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({t_form_block _enctype=file m=biz a=do_fh_biz_schedule_edit})
({* unknown *})<input type="hidden" name="schedule_id" value="({$schedule_id})" />
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:526px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：予定を編集する＞詳細* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- ここから：小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:488px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定を修正する</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主詳細 -->
({* unknown *})<!-- ここから：主詳細＞＞予定表示 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:60px;" class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})繰り返し設定
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:391px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0">
({* unknown *})<tr>
({* unknown *})<td class="padding_ss" style="width:100px;">
({* unknown *})
({* unknown *})<input type='radio' name='sc_rp' value='0' class="no_bg"({if !$is_rep}) checked({/if}) />繰り返さない
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<select name='sc_bn'>
({* unknown *})	({section name=i loop=$bn_num})
({* unknown *})		<option value="({$bn_num[i]})" ({if $banner == $bn_num[i]})selected({/if})>({$bn_num[i]})日間
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<input type='radio' name='sc_rp' value='true'class="no_bg" ({if $is_rep}) checked({/if}) />繰り返す
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<select name='sc_rcount'>
({* unknown *})	({section name=i loop=$rp_count})
({* unknown *})		<option value='({$rp_count[i]})' ({if $repeat_term == $rp_count[i]})selected({/if})>({$rp_count[i]})週間
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="padding_ss" style="text-align:right;">
({* unknown *})
({* unknown *})繰り返す曜日
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})({section name=i loop=$wk})
({* unknown *})<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' class="no_bg"({if $rep_type[i]}) checked({/if}) />({$wk[i]})
({* unknown *})({/section})
({* unknown *})	
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({if $is_rep})
({* unknown *})<tr>
({* unknown *})<td class="padding_ss" style="text-align:right;" colspan="2">
({* unknown *})
({* unknown *})<input type='checkbox' name="iskeep" value='0' checked />この予定のみを編集する
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({else})
({* unknown *})<input type='hidden' name='iskeep' value='0' />
({* unknown *})({/if})
({* unknown *})</table>
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
({* unknown *})開始日
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<select name='sc_b_year'>
({* unknown *})	({$years|smarty:nodefaults})
({* unknown *})</select>
({* unknown *})<select name='sc_b_month'>
({* unknown *})	({$monthes|smarty:nodefaults})
({* unknown *})</select>
({* unknown *})<select name='sc_b_date'>
({* unknown *})	({$days|smarty:nodefaults})
({* unknown *})</select>
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
({* unknown *})時　刻
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<select name='sc_b_hour'>
({* unknown *})	<option value=''({if $begin_hour == null}) selected({/if})>--時
({* unknown *})	({section name=i loop=$hours})
({* unknown *})		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $begin_hour})({if $begin_hour != null}) selected({/if})({/if})>({$hours[i]})時
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})<select name='sc_b_minute'>
({* unknown *})	<option value=''({if $begin_min == null}) selected({/if})>--分
({* unknown *})	({section name=i loop=$mins})
({* unknown *})		<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $begin_min}) ({if $begin_min != null}) selected({/if})({/if})>({$mins[i]})分
({* unknown *})	({/section})
({* unknown *})</select>～
({* unknown *})
({* unknown *})<select name='sc_f_hour'>
({* unknown *})	<option value=''({if $finish_hour == null}) selected({/if})>--時
({* unknown *})	({section name=i loop=$hours})
({* unknown *})		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $finish_hour}) ({if $finish_hour != null}) selected({/if})({/if})>({$hours[i]})時
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})<select name='sc_f_minute'>
({* unknown *})	<option value=''({if $finish_min == null}) selected({/if})>--分
({* unknown *})	({section name=i loop=$mins})
({* unknown *})		<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $finish_min}) ({if $finish_min != null}) selected({/if})({/if})>({$mins[i]})分
({* unknown *})	({/section})
({* unknown *})</select>
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
({* unknown *})タイトル
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<input class="text" type='text' name='sc_title' value="({$title})" size="60" />
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
({* unknown *})詳細
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<textarea class="text" name='sc_memo' cols="50" rows="5">({$value})</textarea>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})<input type="hidden" name="biz_group_id" value="0" />
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})参加者
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0">
({* unknown *})<tr>
({* unknown *})({foreach name=i from=$members item=item})
({* unknown *})({if $item})
({* unknown *})<td class="padding_ss" style="width:33%;" valign="top">
({* unknown *})<input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox' class='no_bg'({if $item.checkflag}) checked="checked"({/if}) />({$item.nickname})
({* unknown *})</td>
({* unknown *})({else})
({* unknown *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $smarty.foreach.i.last && ($smarty.foreach.i.iteration%3==1 || $smarty.foreach.i.iteration%3==2)})
({* unknown *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* unknown *})({/if})
({* unknown *})({if $smarty.foreach.i.last && $smarty.foreach.i.iteration%3==1 })
({* unknown *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* unknown *})({/if})
({* unknown *})({if !$smarty.foreach.i.last && $smarty.foreach.i.iteration%3==0})
({* unknown *})</tr><tr>
({* unknown *})({/if})
({* unknown *})({/foreach})
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})({*ここまで：新規予定*})
({* unknown *})
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
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<input type='radio' name='public_flag' value='public' ({if $public_flag == 'public'})checked({/if}) class="no_bg" />全体に公開<br>
({* unknown *})<input type='radio' name='public_flag' value='private' ({if $public_flag == 'private'})checked({/if}) class="no_bg" />参加者のみに公開<br>
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
({* unknown *})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="center" colspan="3">
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* unknown *})
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<input type='submit' class="submit" name='entry' value='登録する' />
({* unknown *})
({* unknown *})</div>
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
({* unknown *})<!-- ここまで：主詳細＞＞予定表示 -->
({* unknown *})<!-- ここまで：主詳細 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：予定を編集する＞＞詳細* -->
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
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
