<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>アルバムを編集する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_cover_edit_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<table>
<tr>
<th>タイトル</th>
<td>
<input type="text" class="input_text" name="subject" value="({$album.subject})" size="50" />
</td>
</tr>
<tr>
<th>説明文</th>
<td>
<textarea name="description" rows="6" cols="50">({$album.description})</textarea>
</td>
</tr>
<tr>
<th>表紙</th>
<td>
({if $album.album_cover_image})
<a href="({t_img_url filename=$album.album_cover_image})" target="_blank"><img src="({t_img_url filename=$album.album_cover_image w=180 h=180})" alt="" /></a><br />({else})
({/if})
<input type="hidden" name="pre_image_filename" value="({$album.album_cover_image})" />
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_public" value="public"({if $album.public_flag == "public"}) checked="checked"({/if}) /><label for="public_flag_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_friend" value="friend"({if $album.public_flag == "friend"}) checked="checked"({/if}) /><label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_private" value="private"({if $album.public_flag == "private"}) checked="checked"({/if}) /><label for="public_flag_private">公開しない</label></li>
</ul>
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

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>アルバムを削除する</h3></div>
<div class="partsInfo">
<p>アルバムを削除するとこのアルバムに投稿された写真もすべて削除されます。</p>
</div>
({t_form_block m=pc a=page_h_delete_album})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<table>
<tr><th>日付</th><td>({$album.r_datetime|date_format:"%Y年%m月%d日"})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
