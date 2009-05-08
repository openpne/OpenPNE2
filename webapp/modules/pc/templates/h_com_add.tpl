<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})新規作成</h3></div>
({t_form_block _enctype=file m=pc a=page_h_com_add_confirm})
<table>
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<input type="text" class="input_text" name="name" value="({$form_val.name})" size="50" />
</td>
</tr>
<tr>
<th>カテゴリ</th>
<td>
<select name="c_commu_category_id">
<option value="">選択してください</option>
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $form_val.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select>
</td>
</tr>
<tr>
<th>参加条件</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_admit" id="is_admit_public" value="public"({if $form_val.is_admit=="public" || !$form_val.is_admit}) checked="checked"({/if}) /><label for="is_admit_public">誰でも参加可能</label></li>
<li><input type="radio" class="input_radio" name="is_admit" id="is_admit_auth" value="auth"({if $form_val.is_admit=="auth"}) checked="checked"({/if}) /><label for="is_admit_auth">管理者の承認が必要</label></li>
</ul>
</td>
</tr>
<th>公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_open" id="is_open_public" value="public"({if $form_val.is_open=="public" || !$form_val.is_open}) checked="checked"({/if}) /><label for="is_open_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="is_open" id="is_open_member" value="member"({if $form_val.is_open=="member"}) checked="checked"({/if}) /><label for="is_open_member">({$WORD_COMMUNITY})参加者にのみ公開</label></li>
</ul>
</td>
</tr>
<tr>
<th>({$WORD_COMMUNITY})説明文</th>
<td>
<textarea name="info" rows="6" cols="50">({$form_val.info})</textarea>
</td>
</tr>
<tr>
<th>写真</th>
<td>
<input type="file" class="input_file" name="image_filename" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
