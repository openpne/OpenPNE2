<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>管理者交代依頼</h3></div>
<div class="partsInfo">
<p>({$member.nickname})さんに管理者交代依頼メッセージを送信します。</p>
</div>
({t_form_block m=pc a=page_c_admin_request_confirm})
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>写真</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})"><img src="({t_img_url filename=$member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>送信先</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})">({$member.nickname})</a></td></tr>
<tr><th>メッセージ (任意)</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
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
