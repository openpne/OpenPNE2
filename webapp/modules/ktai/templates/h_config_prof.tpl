({$inc_ktai_header|smarty:nodefaults})({strip})

<center>ﾌﾟﾛﾌｨｰﾙ変更</center>
<hr>
<font color="red">*</font>は必須項目。<br>

({t_form m=ktai a=do_h_config_prof_update_c_member})
<input type="hidden" name="ksid" value="({$PHPSESSID})">

({capture name="nick"})
<font color="red">*</font>ﾆｯｸﾈｰﾑ<br>
<input type="text" name="nickname" value="({$c_member.nickname})"><br>
({/capture})

({capture name="birth"})
<font color="red">*</font>生まれた年<br>
<input type="text" name="birth_year" istyle="4" mode="numeric" value="({$c_member.birth_year})" size="4" maxlength="4"><br>
<select name="public_flag_birth_year">
    ({foreach from=$public_flags key=key item=item})
    <option value="({$key})"({if $c_member.public_flag_birth_year == $key}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>

<font color="red">*</font>誕生日<br>
<select name="birth_month">
    ({foreach from=$month item=item})
    <option value="({$item})"({if $item == $c_member.birth_month}) selected="selected"({/if})>({$item})
    ({/foreach})
</select>
<select name="birth_day">
    ({foreach from=$day item=item})
    <option value="({$item})"({if $item == $c_member.birth_day}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>
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

    ({if $profile.is_required})<font color="red">*</font>({/if})
    ({$profile.caption})<br>

    ({if $profile.form_type == 'text'})
        <input type="text" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
    ({elseif $profile.form_type == 'textarea'})
        <textarea name="profile[({$profile.name})]">({$c_member.profile[$profile.name].value})</textarea>
    ({elseif $profile.form_type == 'select' || $profile.form_type == 'radio'})
        <select name="profile[({$profile.name})]">
            <option value="">選択してください
            ({foreach item=item from=$profile.options})
            <option value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})
            ({/foreach})
        </select>
    ({elseif $profile.form_type == 'checkbox'})
        <input type="hidden" name="profile[({$profile.name})][]" value="0">
        ({foreach item=item from=$profile.options name=check})
        <input type="checkbox" name="profile[({$profile.name})][]" value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value && in_array($item.value|smarty:nodefaults, $c_member.profile[$profile.name].value)}) checked="checked"({/if})>({$item.value|default:"--"})
        ({/foreach})
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
<input type="submit" value="変更する">
</form>

<hr>

({/strip})({$inc_ktai_footer|smarty:nodefaults})
