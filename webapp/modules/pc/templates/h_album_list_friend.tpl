
<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})最新アルバム</h3></div>

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>
({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a></p>
({/if})
</div>

({foreach from=$h_album_list_friend item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a> (({$item.c_member.nickname}))({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</dd>
</dl>
({/foreach})

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>
({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a></p>
({/if})
</div>
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})最新アルバム</h3></div>
<div class="block">
<p>({$WORD_MY_FRIEND})のアルバムがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
