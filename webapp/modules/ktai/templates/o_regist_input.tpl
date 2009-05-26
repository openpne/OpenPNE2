({$inc_ktai_header|smarty:nodefaults})({strip})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({$SNS_NAME})新規登録</a></font><br>
</td></tr></table>

以下の項目を入力して、登録を完了してください。<font color="#({$ktai_color_config.font_09})">*</font>の項目は必須です。<br>
<br>

({t_form _attr='utn' m=ktai a=do_o_insert_c_member})
<input type="hidden" name="ses" value="({$ses})">
({if $aff_id})
<input type="hidden" name="aff_id" value="({$aff_id})">
({/if})

({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<font color="#({$ktai_color_config.font_06})">ﾛｸﾞｲﾝID：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<input type="text" name="login_id"><br>
<font color="#({$ktai_color_config.font_09})">
※4-30文字の半角英数字、記号(ｱﾝﾀﾞｰﾊﾞｰ｢_｣、ﾊｲﾌﾝ｢-｣)で入力してください<br>
※最初と最後の文字は半角英数字で入力してください<br>
※ｱﾙﾌｧﾍﾞｯﾄの大文字と小文字は区別されません<br>
</font>
<br>
({/if})

({capture name="nick"})
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<input type="text" name="nickname"><br>
<br>
({/capture})
({capture name="birth"})
<font color="#({$ktai_color_config.font_06})">生まれた年：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<input type="text" name="birth_year" size="4" maxlength="4" istyle="4" mode="numeric">年<br>
<select name="public_flag_birth_year">
    ({foreach from=$public_flags key=key item=item})
    <option value="({$key})"({if $c_member.public_flag_birth_year == $key}) selected="selected"({/if})>({$item})
    ({/foreach})
</select><br>
<br>

<font color="#({$ktai_color_config.font_06})">誕生日：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
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

({if $profile.disp_regist})
    <font color="#({$ktai_color_config.font_06})">({$profile.caption})：</font>
    ({if $profile.is_required})<font color="#({$ktai_color_config.font_09})">*</font>({/if})<br>

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
    <br><font color="#({$ktai_color_config.font_09})">({$profile.info})</font>
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
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<input type="text" name="password" maxlength="12" istyle="3" mode="alphabet"><br>
<font color="#({$ktai_color_config.font_09})">※ﾊﾟｽﾜｰﾄﾞは6-12文字の半角英数で入力してください</font><br>
<br>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<font color="#({$ktai_color_config.font_06})">秘密の質問：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<select name="c_password_query_id">
    <option value="">選択してください
    ({foreach from=$password_query_list key=key item=item})
    <option value="({$key})">({$item})
    ({/foreach})
</select><br>
<br>
<font color="#({$ktai_color_config.font_06})">秘密の質問の答え：</font><font color="#({$ktai_color_config.font_09})">*</font><br>
<input type="text" name="password_query_answer" value=""><br>
<font color="#({$ktai_color_config.font_09})">※ﾊﾟｽﾜｰﾄﾞを忘れた場合の確認に使用します。</font>
({/if})
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="この内容で登録する">
</center>
</form>

({/strip})({$inc_ktai_footer|smarty:nodefaults})
