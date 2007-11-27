({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：プロフィール変更****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：プロフィール変更＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06">
<span class="b_b c_00">プロフィール変更</span>&nbsp;&nbsp;(<span class="caution">※</span>の項目は必須です)
</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({capture name="nick"})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">

ニックネーム <span class="caution">※</span>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:483px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$prof.nickname})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/capture})
({capture name="birth"})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

生まれた年 <span class="caution">※</span>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$prof.birth_year})年

({if $prof.public_flag_birth_year == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.public_flag_birth_year == 'private'})
（公開しない）
({/if})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

誕生日 <span class="caution">※</span>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$prof.birth_month})月({$prof.birth_day})日

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/capture})

({foreach from=$profile_list item=profile})
({strip})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
({if $profile.disp_config})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

({$profile.caption})
({if $profile.is_required})
<span class="caution">※</span>
({/if})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({if $prof.profile[$profile.name].value})

({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|t_url2a|nl2br})
({elseif $profile.form_type == 'checkbox'})
    ({$prof.profile[$profile.name].value|@t_implode:", "})
({else})
    ({$prof.profile[$profile.name].value})
({/if})

({if $prof.profile[$profile.name].public_flag == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.profile[$profile.name].public_flag == 'private'})
（公開しない）
({/if})

({/if})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({/foreach})

({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="center" valign="middle" colspan="3">

<div class="padding_w_m">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:3em;margin:0px auto;">
<tr>
<td style="width:45%;" align="center">

({t_form m=pc a=do_h_config_prof})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="mode" value="register">
<input type="hidden" name="nickname" value="({$prof.nickname})">
<input type="hidden" name="birth_year" value="({$prof.birth_year})">
<input type="hidden" name="birth_month" value="({$prof.birth_month})">
<input type="hidden" name="birth_day" value="({$prof.birth_day})">
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})">
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})">
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})">
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})">
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})">
({/foreach})
({/strip})
<input type="submit" class="submit" value="　更　新　">
</form>

</td>
<td style="width:10%;"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:45%;" align="center">

({t_form m=pc a=do_h_config_prof})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="mode" value="input">
<input type="hidden" name="nickname" value="({$prof.nickname})">
<input type="hidden" name="birth_year" value="({$prof.birth_year})">
<input type="hidden" name="birth_month" value="({$prof.birth_month})">
<input type="hidden" name="birth_day" value="({$prof.birth_day})">
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})">
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})">
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})">
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})">
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})">
({/foreach})
({/strip})
<input type="submit" class="submit" value="　戻　る　">
</form>

</td>
</tr>
</table>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：プロフィール変更＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：プロフィール変更****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
