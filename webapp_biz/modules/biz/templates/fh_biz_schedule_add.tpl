({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({t_form_block _enctype=file m=biz a=do_fhg_biz_schedule_add})
({* unknown *})<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})" />
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
({* unknown *})<!-- *ここから：予定を編集する＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- ここから：小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:488px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定を登録する</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<!-- ここから：主内容＞＞予定表示 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:100px;" class="bg_05" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})繰り返し設定
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:421px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0">
({* unknown *})<tr>
({* unknown *})<td class="padding_ss" style="width:100px;">
({* unknown *})
({* unknown *})<input type='radio' name='sc_rp' value='0'  class="no_bg" ({if !$sc_rp})checked({/if}) />繰り返さない
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<select name='sc_bn'>
({* unknown *})	({section name=i loop=$bn_num})
({* unknown *})		<option value="({$bn_num[i]})" ({if $bn_num[i]==$sc_bn}) selected({/if})>({$bn_num[i]})日間
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<input type='radio' name='sc_rp' value='true'class="no_bg" ({if $sc_rp})checked({/if}) />繰り返す
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="padding_ss">
({* unknown *})
({* unknown *})<select name='sc_rcount'>
({* unknown *})	({section name=i loop=$rp_count})
({* unknown *})		<option value='({$rp_count[i]})' ({if $rp_count[i]==$sc_rcount}) selected({/if})>({$rp_count[i]})週間
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
({* unknown *})<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' ({if $sc_rwk_chk[i].checkflag}) checked({/if}) class="no_bg" />({$wk[i]})
({* unknown *})({/section})
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
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
({* unknown *})<select name='sc_b_hour'>
({* unknown *})	<option value='' ({if $begin_hour == null})selected({/if})>--時
({* unknown *})	({section name=i loop=$hours})
({* unknown *})		<option value="({$hours[i]|string_format:"%02d"})" ({if $begin_hour})({if ($hours[i]|string_format:"%02d") == $begin_hour})selected({/if})({/if})>({$hours[i]})時
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})<select name='sc_b_minute'>
({* unknown *})	<option value=''>--分
({* unknown *})	({section name=i loop=$mins})
({* unknown *})		<option value="({$mins[i]|string_format:"%02d"})" ({if $begin_min})({if ($mins[i]|string_format:"%02d") == $begin_min})selected({/if})({/if})>({$mins[i]})分
({* unknown *})	({/section})
({* unknown *})</select>～
({* unknown *})
({* unknown *})<select name='sc_f_hour'>
({* unknown *})	<option value=''>--時
({* unknown *})	({section name=i loop=$hours})
({* unknown *})		<option value="({$hours[i]|string_format:"%02d"})" ({if $finish_hour})({if ($hours[i]|string_format:"%02d") == $finish_hour})selected({/if})({/if})>({$hours[i]})時
({* unknown *})	({/section})
({* unknown *})</select>
({* unknown *})<select name='sc_f_minute'>
({* unknown *})	<option value=''>--分
({* unknown *})	({section name=i loop=$mins})
({* unknown *})		<option value="({$mins[i]|string_format:"%02d"})" ({if $finish_min})({if ($mins[i]|string_format:"%02d") == $finish_min})selected({/if})({/if})>({$mins[i]})分
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
({* unknown *})<input class="text" type='text' name='sc_title' size="60" value="({$sc_title})" />
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
({* unknown *})内容
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})
({* unknown *})<textarea class="text" name='sc_memo' cols="50" rows="5">({$sc_memo})</textarea>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:150px;" class="bg_05">
({* unknown *})
({* unknown *})<div class="padding_s" align="center">
({* unknown *})
({* unknown *})参加者<br>※未選択は全員
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:412px;" class="bg_02">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
({* unknown *})<tr>
({* unknown *})({foreach from=$members item=item name=mem})
({* unknown *})({if $item})
({* unknown *})<td class="padding_ss" style="width:33%;" valign="top">
({* unknown *})
({* unknown *})<input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox' class='no_bg'({if $item.checkflag}) checked="checked"({/if}) />({$item.nickname})
({* unknown *})
({* unknown *})</td>
({* unknown *})({else})
({* unknown *})<td class="padding_ss" style="width:33%;">&nbsp;</td>
({* unknown *})({/if})
({* unknown *})
({* unknown *})
({* unknown *})({if $smarty.foreach.mem.last && ($smarty.foreach.mem.iteration%3 == 1 || $smarty.foreach.mem.iteration%3 == 2)})<td>&nbsp;</td>({/if})
({* unknown *})
({* unknown *})({if $smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 1})<td>&nbsp;</td>({/if})
({* unknown *})
({* unknown *})({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</tr><tr>({/if})
({* unknown *})({/foreach})
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<input type="hidden" name="biz_group_id" value="0" />
({* unknown *})
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
({* unknown *})<input type='radio' name='public_flag' value='public' checked class="no_bg" />全体に公開<br>
({* unknown *})<input type='radio' name='public_flag' value='private' class="no_bg" />参加者のみに公開<br>
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
({* unknown *})<input type='submit' name='entry' value='登録する'({if $is_g}) onclick="allSelect(this.form, 'sc_j_mem[]')"({/if}) />
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
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
