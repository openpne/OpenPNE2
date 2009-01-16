<div id="LayoutC">
<div id="Center">

({* {{{ commentList *})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>下記のコメントを削除しますか？</h3></div>

({foreach from=$target_diary_comment_list item=target_diary_comment})
<dl>
<dt>({$target_diary_comment.r_datetime|date_format:"%Y年%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading"><strong>({$target_diary_comment.number})</strong>: <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_diary_comment.c_member_id})">({$target_diary_comment.nickname|default:""})</a></p>
</div>
<div class="body">
<p class="text">
({$target_diary_comment.body|nl2br|default:"&nbsp;"|t_url2cmd:'diary':$target_diary_comment.c_member_id|t_cmd:'diary'})
</p>
</div>
</dd>
</dl>
({/foreach})

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_diary_delete_c_diary_comment})
<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})" />
({foreach from=$target_diary_comment_list item=target_diary_comment})
<input type="hidden" name="target_c_diary_comment_id[]" value="({$target_diary_comment.c_diary_comment_id})" />
({/foreach})
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_fh_diary})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
