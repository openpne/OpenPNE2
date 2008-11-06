<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})にコメントを書く</h3></div>
<div class="partsInfo">
<p>下記のコメントを書き込みますか？</p>
</div>
<table>
<tr><th>本文</th><td>({$form_val.body|nl2br|t_url2cmd:'diary':$u|t_cmd:'diary'})</td></tr>
({if $form_val.upfile_1.name})
<tr><th>写真1</th><td>({$form_val.upfile_1.name})</td></tr>
({/if})
({if $form_val.upfile_2.name})
<tr><th>写真2</th><td>({$form_val.upfile_2.name})</td></tr>
({/if})
({if $form_val.upfile_3.name})
<tr><th>写真3</th><td>({$form_val.upfile_3.name})</td></tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_diary_insert_c_diary_comment})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})" />
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})" />
<input type="submit" class="input_submit" value="　決　定　" />
({/t_form_block})
</li>
<li>
({t_form_block _form_action=#commentForm _enctype=file m=pc a=page_fh_diary})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
