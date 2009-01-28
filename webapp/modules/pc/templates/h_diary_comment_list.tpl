<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})コメント記入履歴</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_diary_comment_list})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_diary_comment_list})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$h_diary_comment_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">({$item.subject}) (({$item.num_comment}))</a> (({$item.nickname})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})コメント記入履歴</h3></div>
<div class="block">
<p>まだ記入した({$WORD_DIARY})コメントはありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
