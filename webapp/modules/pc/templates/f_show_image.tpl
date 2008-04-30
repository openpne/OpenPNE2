<div id="LayoutC">
<div id="Center">

({* {{{ photoUploadFormBox *})
<div class="dparts photoUploadFormBox"><div class="parts">
<div class="partsHeading"><h3>({if $target_member.c_member_id != $u})({$target_member.nickname}) さんの({/if})写真一覧</h3></div>
<table>
<tr>
<td>
<img src="({t_img_url filename=$target_member.image_filename_1 w=180 h=180 noimg=no_image})" alt="" />
</td>
<td>
<img src="({t_img_url filename=$target_member.image_filename_2 w=180 h=180 noimg=no_image})" alt="" />
</td>
<td>
<img src="({t_img_url filename=$target_member.image_filename_3 w=180 h=180 noimg=no_image})" alt="" />
</td>
</tr>
</table>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({if $target_member.c_member_id != $u})このメンバーの({/if})トップページに戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
