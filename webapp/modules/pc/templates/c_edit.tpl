<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})設定変更</h3></div>
({t_form_block _enctype=file m=pc a=do_c_edit_update_c_commu})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<table>
<tr><th>({$WORD_COMMUNITY})名</th><td><input type="text" class="input_text" name="name" value="({$c_commu.name})" size="40" /></td></tr>
<tr><th>カテゴリ</th><td>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $c_commu.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select>
</td></tr>
<tr><th>参加条件と公開範囲</th><td>
<ul>
({foreach from=$public_flag_list key=key item=item})
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_({$key})" value="({$key})"({if $key == $c_commu.public_flag}) checked="checked"({/if}) /><label for="public_flag_({$key})">({$item})</label></li>
({/foreach})
</ul>
</td></tr>
<tr><th>トピック作成権限</th><td>
<ul>
({foreach from=$topic_authority_list key=key item=item})
<li><input type="radio" class="input_radio" name="topic_authority" id="topic_authority_({$key})" value="({$key})"({if $key == $c_commu.topic_authority}) checked="checked"({/if}) /><label for="topic_authority_({$key})">({$item})</label></li>
({/foreach})
</ul>
</td></tr>
<tr><th>({$WORD_COMMUNITY})説明文</th><td><textarea name="info" rows="6" cols="50">({$c_commu.info})</textarea></td></tr>
<tr><th>写真</th><td>
({if $c_commu.image_filename})
<p>
<img src="({t_img_url filename=$c_commu.image_filename w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_edit_image_delete_c_commu_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" size="40" name="image_filename" />
</td></tr>
({if !$is_unused_join_commu})
<tr><th>参加お知らせメール受信設定</th><td>
<ul>
<li><input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_1" value="1"({if $c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_1">受信する</label></li>
<li><input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_0" value="0"({if !$c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_0">受信しない</label></li>
</ul>
<p>※({$WORD_COMMUNITY})に新しく参加者が加わった時に、管理者(あなた)にメールを送ります。</p>
</td></tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="変更を確定" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $c_commu.c_member_id_sub_admin != $u && $c_commu.c_member_id_admin == $u})
({if $is_topic})

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})を削除する</h3></div>
<div class="block">
<p>({$WORD_COMMUNITY})を削除するには、トピックをすべて削除する必要があります。<br />
トピックがある場合は、それらを削除した後、このページに再度アクセスしてください。<br />
(削除ボタンが表示されます)<br />
<br />
削除の際はトラブル等を避けるため、あらかじめ参加者へ削除を告知してください。</p>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})を削除する</h3></div>
<div class="block">
<p>({$WORD_COMMUNITY})を削除します。削除の際はトラブル等を避けるため、あらかじめ参加者へ削除を告知してください。</p>
({t_form_block m=pc a=page_c_edit_delete_c_commu_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

({/if})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
