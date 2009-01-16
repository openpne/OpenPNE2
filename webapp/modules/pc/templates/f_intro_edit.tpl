<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>紹介文を作成する</h3></div>
({t_form_block m=pc a=do_f_intro_edit_update_c_friend})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<table>
<tr>
<th>写真</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a><br />
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a>
</td>
</tr>
<tr>
<th>紹介文</th>
<td>
<textarea name="body" rows="8" cols="50">({$intro_body})</textarea>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　作　成　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
