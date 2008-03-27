<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：個人情報入力****** -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})<!-- *ここから：個人情報入力＞内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<div class="border_01">
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1952 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">プロフィール確認</span>&nbsp;&nbsp;<span class="c_00">(以下の内容で登録します。確認のうえ、登録ボタンをクリックしてください。)</span></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})</div>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:566px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({capture name="nick"})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:150px;" class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})ニックネーム <span class="caution">※</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:413px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$prof.nickname|default:"&nbsp;"})
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
({* #1952 *})({/capture})
({* #1952 *})({capture name="birth"})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})生まれた年 <span class="caution">※</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$prof.birth_year|default:"&nbsp;"})年
({* #1952 *})
({* #1952 *})({if $prof.public_flag_birth_year == 'friend'})
({* #1952 *})（({$WORD_MY_FRIEND})まで公開）
({* #1952 *})({elseif $prof.public_flag_birth_year == 'private'})
({* #1952 *})（公開しない）
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
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
({* #1952 *})<td class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})誕生日 <span class="caution">※</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$prof.birth_month|default:"&nbsp;"})月({$prof.birth_day|default:"&nbsp;"})日
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({/capture})
({* #1952 *})
({* #1952 *})({foreach from=$profile_list item=profile})
({* #1952 *})({strip})
({* #1952 *})
({* #1952 *})({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({* #1952 *})({counter assign="_cnt_nick"})
({* #1952 *})({counter assign="_cnt_birth"})
({* #1952 *})({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({* #1952 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1952 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1952 *})({else})
({* #1952 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1952 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1952 *})({/if})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({* #1952 *})({counter assign="_cnt_nick"})
({* #1952 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({* #1952 *})({counter assign="_cnt_birth"})
({* #1952 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({/strip})
({* #1952 *})({if $profile.disp_regist})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$profile.caption})
({* #1952 *})({if $profile.is_required})
({* #1952 *})<span class="caution">※</span>
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({if $prof.profile[$profile.name].value})
({* #1952 *})
({* #1952 *})({if $profile.form_type == 'textarea'})
({* #1952 *})    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({* #1952 *})({elseif $profile.form_type == 'checkbox'})
({* #1952 *})    ({$prof.profile[$profile.name].value|@t_implode:", "})
({* #1952 *})({else})
({* #1952 *})    ({$prof.profile[$profile.name].value})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({if $prof.profile[$profile.name].public_flag == 'friend'})
({* #1952 *})（({$WORD_MY_FRIEND})まで公開）
({* #1952 *})({elseif $prof.profile[$profile.name].public_flag == 'private'})
({* #1952 *})（公開しない）
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({/if})
({* #1952 *})({/foreach})
({* #1952 *})
({* #1952 *})({if !$_cnt_nick && !$_cnt_birth})
({* #1952 *})({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({* #1952 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1952 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1952 *})({else})
({* #1952 *})({$smarty.capture.nick|smarty:nodefaults})
({* #1952 *})({$smarty.capture.birth|smarty:nodefaults})
({* #1952 *})({/if})
({* #1952 *})({else})
({* #1952 *})({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({* #1952 *})({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({* #1952 *})({/if})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})秘密の質問 <span class="caution">※</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$password_query_name|default:"&nbsp;"})
({* #1952 *})
({* #1952 *})</div>
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
({* #1952 *})<td class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})質問の答え <span class="caution">※</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$prof.c_password_query_answer|default:"&nbsp;"})
({* #1952 *})
({* #1952 *})</div>
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
({* #1952 *})<td class="bg_03" align="center" valign="middle" colspan="3">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})
({* #1952 *})<table border="0" style="width:240px;">
({* #1952 *})<tr>
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=do_h_regist_prof})
({* #1952 *})
({* #1952 *})<input type="hidden" name="mode" value="register" />
({* #1952 *})<input type="hidden" name="sid" value="({$sid})" />
({* #1952 *})<td><input type="submit" class="input_submit" value="　登　録　" /></td>
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=do_h_regist_prof})
({* #1952 *})
({* #1952 *})<input type="hidden" name="mode" value="input" />
({* #1952 *})<input type="hidden" name="sid" value="({$sid})" />
({* #1952 *})<td><input type="submit" class="input_submit" value="　修　正　" /></td>
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})</div>
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
({* #1952 *})<!-- ここまで：主内容 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<!-- *ここまで：個人情報入力＞＞内容* -->
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：個人情報入力****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
