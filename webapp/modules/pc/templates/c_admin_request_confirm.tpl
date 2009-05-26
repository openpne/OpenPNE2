<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>管理者交代依頼</h3></div>
<div class="partsInfo">
<p>({$target_c_member.nickname})さんに管理者交代依頼メッセージを送信します。よろしいですか？</p>
</div>
<table>
<tr><th>写真</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})"><img src="({t_img_url filename=$target_c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>送信先</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})">({$target_c_member.nickname})</a></td></tr>
<tr><th>メッセージ (任意)</th><td>({$body|nl2br})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_admin_request_insert_c_commu_admin_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_c_admin_request})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
