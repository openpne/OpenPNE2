<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>トピックにコメントを書き込む</h3></div>
<div class="partsInfo">
<p>以下の内容でよろしいですか？</p>
</div>
<table>
<tr><th>本文</th><td>({$topic_write.body|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
({if $topic_write.image_filename1})
<tr><th>写真1</th><td>({$topic_write.image_filename1})</td></tr>
({/if})
({if $topic_write.image_filename2})
<tr><th>写真2</th><td>({$topic_write.image_filename2})</td></tr>
({/if})
({if $topic_write.image_filename3})
<tr><th>写真3</th><td>({$topic_write.image_filename3})</td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $topic_write.filename4_original_filename})
<tr><th>ファイル</th><td>({$topic_write.filename4_original_filename})</td></tr>
({/if})
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_topic_write_insert_c_commu_topic_comment})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　決　定　" />
({/t_form_block})
</li>
<li>
({t_form_block _form_action=#commentForm m=pc a=page_c_topic_detail})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
