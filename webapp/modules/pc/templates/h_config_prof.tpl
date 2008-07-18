({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：プロフィール変更****** -->
({t_form m=pc a=do_h_config_prof})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

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
<td style="width:458px;padding:2px 0px;" class="bg_06">
<span class="b_b c_00">プロフィール変更</span>&nbsp;&nbsp;(<span class="caution">※</span>の項目は必須です)
</td>
<td style="width:140px;padding:2px 10px;" align="right" class="bg_06">&nbsp;
({if $SSL_SELECT_URL})
<a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({/if})
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

<input type="text" class="text" name="nickname" value="({$c_member.nickname})" size="30"><br>

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

<table style="width:100%;border-collapse:collapse;padding:0">
<tr>
<td style="padding:0">

<div class="padding_s">

<input type="text" class="text" name="birth_year" value="({if $c_member.birth_year})({$c_member.birth_year})({/if})" size="10" maxlength="4">年

</div>

</td>
<td align="right">

<div class="padding_s">

<select name="public_flag_birth_year">
({html_options options=$public_flags selected=$c_member.public_flag_birth_year})
</select>

</div>

</td>
</tr>
</table>

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

<select name="birth_month">
<option value="0">--
({foreach from=$month item=item})
<option value="({$item})"({if $c_member.birth_month==$item}) selected="selected"({/if})>({$item})
({/foreach})
</select>
月&nbsp;<select name="birth_day"><option value="0">--
({foreach from=$day item=item})
<option value="({$item})"({if $c_member.birth_day==$item}) selected="selected"({/if})>({$item})
({/foreach})
</select>日

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

({$profile.caption}) ({if $profile.is_required})<span class="caution">※</span>({/if})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<table style="width:100%;border-collapse:collapse;padding:0">
<tr>
<td style="padding:0;">

<div class="padding_s">

({strip})
({if $profile.form_type == 'text'})
    <input type="text" class="text" size="30" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
({elseif $profile.form_type == 'textlong'})
    <input type="text" class="text" size="60" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
({elseif $profile.form_type == 'textarea'})
    <textarea class="text" name="profile[({$profile.name})]" rows="6" cols="50" style="width:({if $profile.public_flag_edit})310({else})470({/if})px;">({$c_member.profile[$profile.name].value})</textarea>
({elseif $profile.form_type == 'select'})
    <select name="profile[({$profile.name})]">
    <option value="">選択してください</option>
    ({foreach item=item from=$profile.options})
    <option value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'radio'})
    <table>
    ({foreach item=item from=$profile.options})
    ({counter name=$profile.name assign=_cnt})
    ({if $_cnt % 3 == 1})<tr>({/if})
        <td><input type="radio" name="profile[({$profile.name})]" value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) checked="checked"({/if}) class="no_bg"></td>
        <td>({$item.value|default:"--"})</td>
    ({if $_cnt % 3 == 0})</tr>({/if})
    ({/foreach})
    ({if $_cnt % 3 != 0})</tr>({/if})
    </table>
({elseif $profile.form_type == 'checkbox'})
    <table>
    ({foreach item=item from=$profile.options name=check})
    ({counter name=$profile.name assign=_cnt})
    ({if $_cnt % 3 == 1})<tr>({/if})
        <td><input type="checkbox" name="profile[({$profile.name})][]" value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value && in_array($item.value|smarty:nodefaults, $c_member.profile[$profile.name].value)}) checked="checked"({/if}) class="no_bg"></td>
        <td>({$item.value|default:"--"})</td>
    ({if $_cnt % 3 == 0})</tr>({/if})
    ({/foreach})
    ({if $_cnt % 3 != 0})</tr>({/if})
    </table>
({/if})
({if $profile.info})
<br><span class="caution">({$profile.info})</span>
({/if})
({/strip})

</div>

</td>
({if $profile.public_flag_edit})
<td align="right">

<div class="padding_s">

({if $c_member.profile[$profile.name].public_flag})
({assign var=pflag value=$c_member.profile[$profile.name].public_flag})
({else})
({assign var=pflag value=$profile.public_flag_default})
({/if})
<select name="public_flag[({$profile.name})]">
({foreach from=$public_flags key=key item=item})
<option value="({$key})"({if $pflag==$key}) selected="selected"({/if})>({$item})
({/foreach})
</select>

</div>

</td>
({/if})
</tr>
</table>

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

<div style="padding:10px 60px;">

<div style="text-align:center;">

<input type="submit" class="submit" value="　変　更　">

</div>

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
</form>
<!-- ******ここまで：プロフィール変更****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
