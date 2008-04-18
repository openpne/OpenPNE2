<div id="LayoutB">

({if $type == 'h'})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_fh_album_list})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
<li><input type="submit" class="input_submit" value="アルバム検索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新のアルバム</h3></div>
<ul class="list">
({foreach from=$target_album_subject_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
</div> <!--parts sideNav-->
({* }}} *})

</div><!-- Left -->

<div id="Center">

({*ここから：アルバムを追加*})
({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>マイアルバム</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_album_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="アルバムを追加" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})
({*ここまで：アルバムを追加*})

({if $target_album_list})
({* unknown *})<div class="dparts"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* unknown *})
({* unknown *})({capture name=pager})({strip})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page-1})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
({* unknown *})({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $album_list_count})
({* unknown *})({$album_list_count+$page*$page_size-$page_size})
({* unknown *})({else})
({* unknown *})({$page*$page_size})
({* unknown *})({/if})
({* unknown *})件を表示
({* unknown *})</p>
({* unknown *})({if $is_next})
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page+1})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})({/strip})({/capture})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})({foreach from=$target_album_list item=item})
({* unknown *})<table>
({* unknown *})<tr>
({* unknown *})<td rowspan="4" align="center" style="width: 180px; padding: 5px;">
({* unknown *})<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})" alt="" /></a>
({* unknown *})</td>
({* unknown *})<th style="width:75px; padding: 5px;">タイトル</th>
({* unknown *})<td style="padding: 5px;" colspan="2">({$item.subject})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">アルバムの説明</th>
({* unknown *})<td style="padding: 5px;" colspan="2">({$item.description|nl2br})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">公開範囲</th>
({* unknown *})<td style="padding: 5px;" colspan="2">
({* unknown *})({if $item.public_flag == "public"})
({* unknown *})全員に公開
({* unknown *})({elseif $item.public_flag == "friend"})
({* unknown *})({$WORD_MY_FRIEND})まで公開
({* unknown *})({elseif $item.public_flag == "private"})
({* unknown *})公開しない
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">作成日時</th>
({* unknown *})<td style="padding: 5px;">({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</td>
({* unknown *})<td style="padding: 5px; text-align: center;"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})</div></div>
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
