<div id="LayoutC">
<div id="Center">

({* {{{ photoUploadFormBox *})
<div class="dparts photoUploadFormBox"><div class="parts">
<div class="partsHeading"><h3>写真を編集する</h3></div>
<table>
<tr>
<td>
({if $c_member.image_filename_1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_1==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
<td>
({if $c_member.image_filename_2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_2==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
<td>
({if $c_member.image_filename_3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_3==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
</tr>
</table>

<div class="block">
({t_form_block _enctype=file m=pc a=do_h_config_image})
<p><input name="upfile" type="file" value=" 参 照 " /></p>
<p><input type="submit" class="input_submit" name="submit" value="写真をアップロードする" /></p>
({/t_form_block})
<ul>
<li>写真は最大3枚までアップロードできます。</li>
<li>({$smarty.const.IMAGE_MAX_FILESIZE})KB以内のGIF・JPEG・PNGにしてください。</li>
<li>著作権や肖像権の侵害にあたる写真、暴力的・卑猥な写真、他のメンバーが見て不快に感じる写真の掲載は禁止しております。掲載はご自身の責任でお願いいたします。</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_home})">ホームに戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
