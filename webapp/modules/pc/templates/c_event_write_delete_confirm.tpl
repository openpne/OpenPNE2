<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>下記の書き込みを削除しますか？</h3></div>

<table>
<tr><th></th><td>({$c_commu_topic_comment.body|nl2br|t_url2cmd:'community':$c_commu_topic_comment.c_member_id|t_cmd:'community'})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic_comment})
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_event_detail})
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
