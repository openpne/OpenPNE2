<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
({* #1932 *})<div class="dparts searchFormBox"><div class="parts">
({* #1932 *})<div class="partsHeading"><h3>日記検索</h3></div>
({* #1932 *})<table>
({* #1932 *})<tr>
({* #1932 *})<td style="width:560px;" class="bg_02" align="left" valign="middle">
({* #1932 *})<div style="padding:6px;">
({* #1932 *})({t_form_block _method=get m=pc a=page_h_diary_list_all})
({* #1932 *})キーワード <img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" alt="" />
({* #1932 *})<input type="text" class="text" name="keyword" size="15" value="({$keyword})" />
({* #1932 *})<input type="submit" class="input_submit" value=" 検 索 " />
({* #1932 *})　<a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})">コミュニティ検索</a>
({* #1932 *})({if $smarty.const.USE_EXTRA_SERVICE})
({* #1932 *})|
({* #1932 *})<a href="http://www.google.com/search?hl=ja&amp;lr=lang_ja&amp;q=({$keyword|escape:url|smarty:nodefaults})" target="_blank">ウェブ検索</a>
({* #1932 *})({/if})
({* #1932 *})<p>※タイトル、本文より検索をおこないます。スペースで区切ると複数キーワードでの検索ができます。</p>
({* #1932 *})({/t_form_block})
({* #1932 *})</div>
({* #1932 *})</td>
({* #1932 *})</tr>
({* #1932 *})</table>
({* #1932 *})</div></div>
({* }}} *})

({if $c_diary_search_list_count})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
({if $keyword})
<div class="partsHeading"><h3>日記検索結果一覧</h3><p>*** ({$c_diary_search_list_count})件が該当しました。</p></div>
({else})
<div class="partsHeading"><h3>最新日記一覧</h3></div>
({/if})

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next">&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=1">次を表示</a></p>({/if})
</div>

<div class="block">
({foreach from=$new_diary_list item=diary})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url filename=$diary.c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>ニックネーム</th><td>({$diary.c_member.nickname})({if $diary.c_member.profile.sex.value}) (({$diary.c_member.profile.sex.value}))({/if})</td>
</tr><tr>
<th>タイトル</th><td>({$diary.subject}) (({$diary.num_comment}))({if $diary.image_filename_1 || $diary.image_filename_2 || $diary.image_filename_3}) <img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</td>
</tr><tr>
<th>本文</th><td>({$diary.body|t_truncate:36:"":3})</td>
</tr><tr>
<th>作成日時</th><td class="operation"><span class="text">({$diary.r_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=-1">前を表示</a></p>({/if})
<p class="number">({$pager.start})件～({$pager.end})件を表示</p>
({if $is_next})<p class="next">&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=1">次を表示</a></p>({/if})
</div>

</div></div>
({* }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>最新Blog一覧</h3></div>
({foreach from=$c_rss_cache_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({$item.link})" target="_blank">({$item.subject})</a> (({$item.c_member.nickname}))</dd>
</dl>
({/foreach})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
