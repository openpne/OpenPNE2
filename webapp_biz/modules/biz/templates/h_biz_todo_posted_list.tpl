<div id="LayoutC">
<div id="Center">

({if $posted_list})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>Todo投稿履歴</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$total_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$posted_list item=item})
<dl>
<dt>({if $item.r_datetime})({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})({else})投稿日時記録以前のTodo({/if})</dt>
<dd><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})&amp;target_id=({$item.c_member_id})">({$item.memo})</a>（({if $item.member_name})({$item.member_name})({else})共有Todo({/if})）</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>Todo投稿履歴</h3></div>
<div class="block">
<p>投稿済みのTodoはありません。</p>
</div>
</div></div>
({* }}} *})

({/if})
</div><!-- Center -->
</div><!-- LayoutC -->
