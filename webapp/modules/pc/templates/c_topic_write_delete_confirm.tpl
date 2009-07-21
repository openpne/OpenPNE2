<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>下記の書き込みを削除しますか？</h3></div>

<table>
<tr><th></th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a><br />
({if $c_commu_topic_comment.image_filename1 || $c_commu_topic_comment.image_filename2 || $c_commu_topic_comment.image_filename3 })<br />
({if $c_commu_topic_comment.image_filename1})<img src="({t_img_url filename=$c_commu_topic_comment.image_filename1 w=120 h=120})" alt="" />({/if})
({if $c_commu_topic_comment.image_filename2})<img src="({t_img_url filename=$c_commu_topic_comment.image_filename2 w=120 h=120})" alt="" />({/if})
({if $c_commu_topic_comment.image_filename3})<img src="({t_img_url filename=$c_commu_topic_comment.image_filename3 w=120 h=120})" alt="" />({/if})
<br />({/if})<br />
({$c_commu_topic_comment.body|nl2br|t_url2cmd:'community':$c_member.c_member_id|t_cmd:'community'})
</td></tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $c_commu_topic_comment.filename})
<tr><th>ファイル</th><td><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_comment_id=({$c_commu_topic_comment.c_commu_topic_comment_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">({$c_commu_topic_comment.original_filename})</a></td></tr>
({/if})
({/if})
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic_comment})
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_topic_detail})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
