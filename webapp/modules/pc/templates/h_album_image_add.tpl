<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真を追加する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_image_add_confirm})
<table>
<tr>
<th>アルバム名</th>
<td>
({$album_subject})
</td>
</tr>
<tr>
<th>写真１</th>
<td>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>写真１説明</th>
<td>
<input type="text" class="text" name="image_description1" value="({$form_val.image_description1})" size="40">
</td>
</tr>
<tr>
<th>写真２</th>
<td>
<input type="file" class="input_file" name="upfile_2" size="40" />
</td>
</tr>
<tr>
<th>写真２説明</th>
<td>
<input type="text" class="text" name="image_description2" value="({$form_val.image_description2})" size="40">
</td>
</tr>
<tr>
<th>写真３</th>
<td>
<input type="file" class="input_file" name="upfile_3" size="40" />
</td>
</tr>
<tr>
<th>写真３説明</th>
<td>
<input type="text" class="text" name="image_description3" value="({$form_val.image_description3})" size="40">
</td>
</tr>
<tr>
<th>写真４</th>
<td>
<input type="file" class="input_file" name="upfile_4" size="40" />
</td>
</tr>
<tr>
<th>写真４説明</th>
<td>
<input type="text" class="text" name="image_description4" value="({$form_val.image_description4})" size="40">
</td>
</tr>
<tr>
<th>写真５</th>
<td>
<input type="file" class="input_file" name="upfile_5" size="40" />
</td>
</tr>
<tr>
<th>写真５説明</th>
<td>
<input type="text" class="text" name="image_description5" value="({$form_val.image_description5})" size="40">
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="subject" value="({$album_subject})" />
<input type="submit" class="input_submit" value="確認画面" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_fh_album})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>
</div> <!-- dparts formTable -->
</div> <!-- partsHeading -->


</div><!-- Center -->
</div><!-- LayoutC -->
