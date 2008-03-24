<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：個人情報入力****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_01" align="center">
({* #1931 *})<!-- *ここから：個人情報入力＞内容* -->
({* #1931 *})({*ここから：header*})
({* #1931 *})<!-- ここから：小タイトル -->
({* #1931 *})<div class="border_01">
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* #1931 *})<tr>
({* #1931 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1931 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">プロフィール確認</span>&nbsp;&nbsp;<span class="c_00">(以下の内容で登録します。確認のうえ、登録ボタンをクリックしてください。)</span></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})</div>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- ここから：主内容 -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:566px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})({capture name="nick"})
({* #1931 *})<tr>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:150px;" class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})ニックネーム <span class="caution">※</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:413px;" class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$prof.nickname|default:"&nbsp;"})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})({/capture})
({* #1931 *})({capture name="birth"})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})生まれた年 <span class="caution">※</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$prof.birth_year|default:"&nbsp;"})年
({* #1931 *})
({* #1931 *})({if $prof.public_flag_birth_year == 'friend'})
({* #1931 *})（({$WORD_MY_FRIEND})まで公開）
({* #1931 *})({elseif $prof.public_flag_birth_year == 'private'})
({* #1931 *})（公開しない）
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})誕生日 <span class="caution">※</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$prof.birth_month|default:"&nbsp;"})月({$prof.birth_day|default:"&nbsp;"})日
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})({/capture})
({* #1931 *})
({* #1931 *})({foreach from=$profile_list item=profile})
({* #1931 *})({strip})
({* #1931 *})
({* #1931 *})({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({* #1931 *})({counter assign="_cnt_nick"})
({* #1931 *})({counter assign="_cnt_birth"})
({* #1931 *})({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({* #1931 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1931 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1931 *})({else})
({* #1931 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1931 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1931 *})({/if})
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({* #1931 *})({counter assign="_cnt_nick"})
({* #1931 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({* #1931 *})({counter assign="_cnt_birth"})
({* #1931 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})({/strip})
({* #1931 *})({if $profile.disp_regist})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$profile.caption})
({* #1931 *})({if $profile.is_required})
({* #1931 *})<span class="caution">※</span>
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({if $prof.profile[$profile.name].value})
({* #1931 *})
({* #1931 *})({if $profile.form_type == 'textarea'})
({* #1931 *})    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({* #1931 *})({elseif $profile.form_type == 'checkbox'})
({* #1931 *})    ({$prof.profile[$profile.name].value|@t_implode:", "})
({* #1931 *})({else})
({* #1931 *})    ({$prof.profile[$profile.name].value})
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})({if $prof.profile[$profile.name].public_flag == 'friend'})
({* #1931 *})（({$WORD_MY_FRIEND})まで公開）
({* #1931 *})({elseif $prof.profile[$profile.name].public_flag == 'private'})
({* #1931 *})（公開しない）
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})({/if})
({* #1931 *})({/foreach})
({* #1931 *})
({* #1931 *})({if !$_cnt_nick && !$_cnt_birth})
({* #1931 *})({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({* #1931 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1931 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1931 *})({else})
({* #1931 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1931 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1931 *})({/if})
({* #1931 *})({else})
({* #1931 *})({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({* #1931 *})({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({* #1931 *})({/if})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})秘密の質問 <span class="caution">※</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$password_query_name|default:"&nbsp;"})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})質問の答え <span class="caution">※</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$prof.c_password_query_answer|default:"&nbsp;"})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_03" align="center" valign="middle" colspan="3">
({* #1931 *})
({* #1931 *})<div class="padding_w_m">
({* #1931 *})
({* #1931 *})<table border="0" style="width:240px;">
({* #1931 *})<tr>
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_h_regist_prof})
({* #1931 *})
({* #1931 *})<input type="hidden" name="mode" value="register">
({* #1931 *})<input type="hidden" name="sid" value="({$sid})">
({* #1931 *})<td><input type="submit" class="input_submit" value="　登　録　"></td>
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_h_regist_prof})
({* #1931 *})
({* #1931 *})<input type="hidden" name="mode" value="input">
({* #1931 *})<input type="hidden" name="sid" value="({$sid})">
({* #1931 *})<td><input type="submit" class="input_submit" value="　修　正　"></td>
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：主内容 -->
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- 無し -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})<!-- *ここまで：個人情報入力＞＞内容* -->
({* #1931 *})</td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：個人情報入力****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
