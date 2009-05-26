<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>トピックを編集する</h3></div>
({t_form_block _enctype=file m=pc a=do_c_topic_edit_update_c_commu_topic})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<table>
<tr><th>タイトル</th><td><input type="text" class="input_text" name="title" value="({$c_topic.name})" size="50" /></td></tr>
<tr><th>本文</th><td><textarea name="body" rows="10" cols="50">({$c_topic.body})</textarea></td></tr>
<tr>
<th>写真1</th>
<td>
({if $c_topic.image_filename1})
<p>
<img src="({t_img_url filename=$c_topic.image_filename1 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=1&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename1" size="40" />
</td>
</tr>
<tr>
<th>写真2</th>
<td>
({if $c_topic.image_filename2})
<p>
<img src="({t_img_url filename=$c_topic.image_filename2 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=2&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename2" size="40" />
</td>
</tr>
<tr>
<th>写真3</th>
<td>
({if $c_topic.image_filename3})
<p>
<img src="({t_img_url filename=$c_topic.image_filename3 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=3&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename3" size="40" />
</td>
</tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>ファイル</th>
<td>
({if $c_topic.filename})
<p>
({$c_topic.original_filename})<br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_file})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="filename4" size="40" />
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　編　集　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>上記のトピックと書き込みを削除する</h3></div>
({t_form_block m=pc a=page_c_topic_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<div class="block">
<p><input type="submit" class="input_submit" value="　削　除　" /></p>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
