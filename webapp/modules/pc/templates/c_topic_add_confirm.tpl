<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>トピックを作成する</h3></div>
<div class="partsInfo">
<p>以下の内容でよろしいですか？</p>
</div>
<table>
<tr><th>タイトル</th><td>({$c_topic.title})</td></tr>
<tr><th>本文</th><td>({$c_topic.body|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
({if $c_topic.image_filename1})
<tr><th>写真1</th><td>({$c_topic.image_filename1})</td></tr>
({/if})
({if $c_topic.image_filename2})
<tr><th>写真2</th><td>({$c_topic.image_filename2})</td></tr>
({/if})
({if $c_topic.image_filename3})
<tr><th>写真3</th><td>({$c_topic.image_filename3})</td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $c_topic.filename4_original_filename})
<tr><th>ファイル</th><td>({$c_topic.filename4_original_filename})</td></tr>
({/if})
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_topic_add_insert_c_commu_topic})
({foreach from=$c_topic key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　作　成　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_c_topic_add})
<input type="hidden" name="target_c_commu_id" value="({$c_topic.c_commu_id})" />
({foreach from=$c_topic key=key item=item})
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
