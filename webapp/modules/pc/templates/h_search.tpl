<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>メンバー検索</h3></div>
({t_form_block _method=get m=pc a=page_h_search_result})
<table>
<tr>
<th>({$WORD_NICKNAME})</th>
<td>
<input type="text" class="input_text" name="nickname" size="30" />
</td>
</tr>
<tr>
<th>生年月日</th>
<td>
<input type="text" class="input_text" name="birth_year" size="4" maxlength="4" /> 年
<input type="text" class="input_text" name="birth_month" size="2" maxlength="2" /> 月
<input type="text" class="input_text" name="birth_day" size="2" maxlength="2" /> 日
</td>
</tr>
({foreach from=$profile_list item=profile})
({if $profile.disp_search})
({if $profile.public_flag_edit || $profile.public_flag_default == 'public'})
<tr>
<th>({$profile.caption})</th>
<td>
({strip})
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
({* 単一選択パターン *})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input type="text" class="input_text" name="profile[({$profile.name})]" size="30" />
({/if})
({/strip})
</td>
</tr>
({/if})
({/if})
({/foreach})
<tr>
<th>写真の有無</th>
<td>
<input type="checkbox" class="input_checkbox" name="image" id="image" value="1" /><label for="image">有のみ</label>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　検　索　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>検索項目の一覧</h3></div>
<div class="block">
<p>検索項目の一覧と各項目のメンバー数を表示します。</p>
({t_form_block _method=get m=pc a=page_h_search_list})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="一覧を見る" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
