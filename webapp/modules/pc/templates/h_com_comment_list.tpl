<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})最新書き込み</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_comment_list})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_comment_list})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$h_com_comment_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.number})">({$item.c_commu_topic_name}) (({$item.number}))</a> (({$item.c_commu_name}))({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})最新書き込み</h3></div>
<div class="block">
<p>まだ({$WORD_COMMUNITY})書き込みがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
