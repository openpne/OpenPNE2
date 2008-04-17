
<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真を編集する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_image_edit_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image_id})" />
<input type="hidden" name="pre_image_filename" value="({$c_album_image.image_filename})" />
<table>
<tr>
<th>画像</th>
<td>
<a href="({t_img_url filename=$c_album_image.image_filename})" target="_blank">
<img src="({t_img_url filename=$c_album_image.image_filename w=180 h=180})"></a><br>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>写真説明</th>
<td>
<input type="text" class="input_text" name="image_description" value="({$c_album_image.image_description})" size="50" />
</td>
</tr>
</table> 
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div> <!-- parts -->
</div> <!-- dparts formTable -->



<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>画像を削除する</h3></div>
({t_form_block m=pc a=page_h_album_image_delete_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image_id})" />
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>


</div><!-- Center -->
</div><!-- LayoutC -->
