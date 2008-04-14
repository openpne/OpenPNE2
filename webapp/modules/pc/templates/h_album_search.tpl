
<div id="LayoutC">
<div id="Center">

({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_h_album_search})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
<li><input type="submit" class="input_submit" value="アルバム検索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})


<div class="dparts searchResultList"><div class="parts">
({if $keyword})
<div class="partsHeading"><h3>アルバム検索結果一覧</h3><p>*** ({$album_list_count})件が該当しました。</p></div>
({else})
<div class="partsHeading"><h3>最新アルバム一覧</h3></div>
({/if})

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next">&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_album_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=1">次を表示</a></p>({/if})
</div>


<div class="block">
({foreach from=$target_album_list item=album})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$album.c_album_id})"><img src="({t_img_album_url filename=$album.album_cover_image w=180 h=180 noimg=no_image})" alt="" /></a></td>
<th>ニックネーム</th><td>({$album.c_member.nickname})</td>
</tr><tr>
<th>タイトル</th><td>({$album.subject})</td>
</tr><tr>
<th>説明</th><td>({$album.description|t_truncate:300:"":3})</td>
</tr><tr>
<th>作成日時</th><td class="operation"><span class="text">({$album.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$album.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div><!-- block -->




<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next">&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_album_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=1">次を表示</a></p>({/if})
</div>

</div><!-- parts -->
</div><!-- dparts searchResultList -->


</div><!-- Center -->
</div><!-- LayoutC -->
