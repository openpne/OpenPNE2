<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>お気に入り最新({$WORD_DIARY})</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$bookmark_diary_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject}) (({$item.count_comments}))</a>(({$item.c_member.nickname}))({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>お気に入り最新({$WORD_DIARY})</h3></div>
<div class="block">
<p>過去30日分のお気に入りの({$WORD_DIARY})を表示します。</p>
</div>
</div></div>
({* }}} *})
({/if})

({if $bookmark_blog_list})
({* {{{ recentList *})
<div class="dparts recentList" id="blog"><div class="parts">
<div class="partsHeading"><h3>お気に入り最新Blog</h3></div>

({foreach from=$bookmark_blog_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({$item.link})" target="_blank">({$item.subject})</a> (({$item.nickname}))</dd>
</dl>
({/foreach})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
