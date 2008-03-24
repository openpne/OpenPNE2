<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>トピックを作成する</h3></div>
({t_form_block _enctype=file m=pc a=page_c_topic_add_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>タイトル</th><td><input type="text" class="input_text" name="title" value="({$title})" size="50" /></td></tr>
<tr><th>本文</th><td><textarea name="body" rows="10" cols="50">({$body})</textarea></td></tr>
<tr><th>写真1</th><td><input type="file" class="input_file" name="image_filename1" size="40" /></td></tr>
<tr><th>写真2</th><td><input type="file" class="input_file" name="image_filename2" size="40" /></td></tr>
<tr><th>写真3</th><td><input type="file" class="input_file" name="image_filename3" size="40" /></td></tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>ファイル</th>
<td>
<input type="file" class="input_file" name="uploadfile" size="40" />
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</td>
</tr>
({/if})
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
