({$inc_ktai_header|smarty:nodefaults})({strip})

<center>({$SNS_NAME})登録</center>
<hr>
以下の項目を入力してください。<br>
<br>

({t_form m=ktai a=do_h_regist_prof})
<input type="hidden" name="ksid" value="({$PHPSESSID})">

({capture name="nick"})
<font color="red">*</font>ニックネーム<br>
<input type="text" name="nickname"><br>
({/capture})
({capture name="birth"})
<font color="red">*</font>生まれた年<br>
<input type="text" name="birth_year" size="4" maxlength="4" istyle="4" mode="numeric">年<br>
<select name="public_flag_birth_year">
    ({foreach from=$public_flags key=key item=item})
    <option value="({$key})"({if $c_member.public_flag_birth_year == $key}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>

<font color="red">*</font>誕生日<br>
<select name="birth_month">
    <option value="" selected="selected">--
    ({foreach from=$month_list item=item})
    <option value="({$item})">({$item})
    ({/foreach})
</select>月<br>
<select name="birth_day">
    <option value="" selected="selected">--
    ({foreach from=$day_list item=item})
    <option value="({$item})">({$item})
    ({/foreach})
</select>日<br>
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

({if $profile.disp_regist})

    ({if $profile.is_required})<font color="red">*</font>({/if})
    ({$profile.caption})<br>

    ({if $profile.form_type == 'text'})
        <input type="text" name="profile[({$profile.name})]" value="({$c_member.profile[$profile.name].value})">
    ({elseif $profile.form_type == 'textlong'})
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
        ({foreach item=item from=$profile.options name=check})
        <input type="checkbox" name="profile[({$profile.name})][]" value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value && in_array($item.value|smarty:nodefaults, $c_member.profile[$profile.name].value)}) checked="checked"({/if})>({$item.value|default:"--"})
        ({/foreach})
    ({/if})
    <br>

    ({if $profile.public_flag_edit})
    <select name="public_flag[({$profile.name})]">
        ({foreach from=$public_flags key=key item=item})
        <option value="({$key})"({if $profile.public_flag_default==$key}) selected="selected"({/if})>({$item})
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
<input type="submit" value=" 登録 ">
</form>

({/strip})({$inc_ktai_footer|smarty:nodefaults})
