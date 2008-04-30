<div id="LayoutC">
<div id="Center">

({if $new_comment_list})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>最近のコメント一覧</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$new_comment_list item=new_comment })
<dl>
<dt>({$new_comment.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$new_comment.c_diary_id})">({$new_comment.body|t_truncate:"36"})</a> ({if $new_comment.nickname})(({$new_comment.nickname}))({/if})</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>最近のコメント一覧</h3></div>
<div class="block">
<p>まだコメントがありません。
</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
