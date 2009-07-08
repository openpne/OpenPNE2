({$inc_ktai_header|smarty:nodefaults})({strip})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾌﾟﾛﾌｨｰﾙ変更</font><br>
</td></tr></table>

<font color="#({$ktai_color_config.font_09})">*</font>は必須項目。<br>

<hr color="#({$ktai_color_config.border_01})">

({t_form m=ktai a=do_h_config_prof_update_c_member})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_09})">*</font>
<font color="#({$ktai_color_config.font_06})">検索設定：</font><br>
<select name="is_search_result">
    <option value="1"({if $C_MEMBER_CONFIG.IS_SEARCH_RESULT}) selected="selected"({/if})>公開する
    <option value="0"({if !$C_MEMBER_CONFIG.IS_SEARCH_RESULT}) selected="selected"({/if})>公開しない
</select><br>
<br>
({capture name="nick"})
<font color="#({$ktai_color_config.font_09})">*</font>
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
<input type="text" name="nickname" value="({$c_member.nickname})"><br>
<br>
({/capture})
({capture name="birth"})
<font color="#({$ktai_color_config.font_09})">*</font><font color="#({$ktai_color_config.font_06})">生まれた年：</font><br>
<input type="text" name="birth_year" istyle="4" mode="numeric" value="({if $c_member.birth_year})({$c_member.birth_year})({/if})" size="4" maxlength="4"><br>
<select name="public_flag_birth_year">
    ({foreach from=$public_flags key=key item=item})
    <option value="({$key})"({if $c_member.public_flag_birth_year == $key}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>
<br>

<font color="#({$ktai_color_config.font_09})">*</font><font color="#({$ktai_color_config.font_06})">誕生日：</font><br>
<select name="birth_month">
    <option>--
    ({foreach from=$month item=item})
    <option value="({$item})"({if $item == $c_member.birth_month}) selected="selected"({/if})>({$item})
    ({/foreach})
</select>
<select name="birth_day">
    <option>--
    ({foreach from=$day item=item})
    <option value="({$item})"({if $item == $c_member.birth_day}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>
<select name="public_flag_birth_month_day">
    ({foreach from=$public_flags key=key item=item})
    <option value="({$key})"({if $c_member.public_flag_birth_month_day == $key}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>
<br>
({/capture})

({foreach from=$profile_list item=profile})

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

({if $profile.disp_config})

    ({if $profile.is_required})<font color="#({$ktai_color_config.font_09})">*</font>({/if})
    <font color="#({$ktai_color_config.font_06})">({$profile.caption})：</font><br>

    ({if $profile.form_type == 'text'})
        <input type="text" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
    ({elseif $profile.form_type == 'textlong'})
        <input type="text" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
    ({elseif $profile.form_type == 'textarea'})
        <textarea name="profile[({$profile.name})]" rows="6">({$c_member.profile[$profile.name].value})</textarea>
    ({elseif $profile.form_type == 'select' || $profile.form_type == 'radio'})
        <select name="profile[({$profile.name})]">
            <option value="">選択してください
            ({foreach item=item from=$profile.options})
            <option value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})
            ({/foreach})
        </select>
    ({elseif $profile.form_type == 'checkbox'})
        ({foreach item=item from=$profile.options name=check})
        <input type="checkbox" name="profile[({$profile.name})][]" value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value && in_array($item.value|smarty:nodefaults, $c_member.profile[$profile.name].value)}) checked="checked"({/if})>({$item.value|default:"--"})
        ({/foreach})
    ({/if})
    ({if $profile.info})
    <br><font color="#({$ktai_color_config.font_06})">({$profile.info})</font>
    ({/if})
    <br>

    ({if $profile.public_flag_edit})
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
    <br>
    ({/if})
	<br>
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

<br>
<center>
<input type="submit" value="変更する">
</center>
</form>

({/strip})({$inc_ktai_footer|smarty:nodefaults})
