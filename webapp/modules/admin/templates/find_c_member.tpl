({$inc_header|smarty:nodefaults})

({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メンバー検索"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">メンバー検索</h2>
<div class="contents">

<div class="find_item">
({t_form_block _method=get m=$module_name})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member','page')})" />

<table class="basicType2">
<tr>
<th>ID（完全一致）</th>
<td>
<input type="text" class="input_text" name="id" value="({$cond_list.id})" size="10" />
</td>
</tr>
({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
<tr>
<th>ログインID（完全一致）</th>
<td>
<input type="text" class="input_text" name="username" value="({$cond_list.username})" size="50" />
</td>
</tr>
({/if})
<tr>
<th>({$WORD_NICKNAME})</th>
<td>
<input type="text" class="input_text" name="nickname" value="({$cond_list.nickname})" size="50" />
</td>

</tr>
<tr>
<th>最終ログイン</th>
<td>
<select class="basic" name="last_login">
<option value="">指定しない</option>
({foreach from=$select_last_login item=item key=key})
<option ({if $cond_list.last_login==$key})selected({/if}) value="({$key})">({$item})</option>
({/foreach})
</select>
</td>
</tr>

<tr>
<th>生年月日</th>
<td>
<select class="basic" name="s_year">
<option value="">指定しない</option>
({foreach from=$years item=item})
<option ({if $cond_list.s_year==$item})selected({/if}) value="({$item})">({$item})</option>
({/foreach})
</select>
年～
<select class="basic" name="e_year">
<option value="">指定しない</option>
({foreach from=$years item=item})
<option ({if $cond_list.e_year==$item})selected({/if}) value="({$item})">({$item})</option>
({/foreach})
</select>
年
</td>
</tr>

({foreach from=$profile_list item=profile})
<tr>
<th>({$profile.caption})</th>
<td>
({strip})
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]")>
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})" ({if $cond_list.profile[$profile.name] == $item.c_profile_option_id})selected="selected"({/if})>({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
        <div class="checkList">
        ({foreach item=item from=$profile.options name=check})
            ({counter name=$profile.name assign=_cnt})
            ({if $_cnt % 3 == 1})<ul>({/if})
            <li><input type="checkbox" class="input_checkbox" name="profile[({$profile.name})][]" id="profile-({$profile.name})-({$item.c_profile_option_id})" value="({$item.c_profile_option_id})" ({if in_array($item.c_profile_option_id, (array)$cond_list.profile[$profile.name])})checked="checked"({/if}) /><label for="profile-({$profile.name})-({$item.c_profile_option_id})">({$item.value|default:"--"})</label></li>
            ({if $_cnt % 3 == 0})</ul>({/if})
        ({/foreach})
        </div>
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input type="text" class="input_text" name="profile[({$profile.name})]" value="({$cond_list.profile[$profile.name]})" size="50" />
({/if})
({/strip})
</td>
</tr>
({/foreach})

<tr>
<th>メールアドレス（完全一致）</th>
<td>
<input type="text" class="input_text" name="mail_address" value="({$cond_list.mail_address})" size="50" />
</td>
</tr>

<tr>
<th>PCメールアドレス</th>
<td>
<select class="basic" name="is_pc_address">
<option value="">指定しない</option>
<option value="1"({if $cond_list.is_pc_address == 1}) selected="selected"({/if})>登録している</option>
<option value="2"({if $cond_list.is_pc_address == 2}) selected="selected"({/if})>登録していない</option>
</select>
</td>
</tr>

<tr>
<th>携帯メールアドレス</th>
<td>
<select class="basic" name="is_ktai_address">
<option value="">指定しない</option>
<option value="1"({if $cond_list.is_ktai_address == 1}) selected="selected"({/if})>登録している</option>
<option value="2"({if $cond_list.is_ktai_address == 2}) selected="selected"({/if})>登録していない</option>
</select>
</td>
</tr>

({if $smarty.const.OPENPNE_USE_POINT_RANK})
<tr>
<th>ポイントランク</th>
<td>
<select class="basic" name="s_rank">
<option value="">指定しない</option>
({foreach from=$rank_data item=item})
<option({if $cond_list.s_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
({/foreach})
</select>
～
<select class="basic" name="e_rank">
<option value="">指定しない</option>
({foreach from=$rank_data item=item})
<option({if $cond_list.e_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
({/foreach})
</select>
</td>
</tr>
({/if})

</table>

<p class="textBtn">
<input type="submit" class="input_submit" value="検索" style="width: 100px" />
</p>

({/t_form_block})
</div>

({$inc_footer|smarty:nodefaults})
