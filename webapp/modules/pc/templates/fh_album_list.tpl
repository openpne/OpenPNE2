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
</div>
({* }}} *})

</div><!-- Left -->

<div id="Center">

({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>アルバムを作成する</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_album_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="アルバムを作成する" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

({if $target_album_list})
({* {{{ albumList *})
<div class="dparts albumList"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page-1})&amp;target_c_member_id=({$target_member.c_member_id})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
({/if})
<p class="number">
({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({if $page_size > $album_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page+1})&amp;target_c_member_id=({$target_member.c_member_id})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_album_list item=item})
<table>
<tr>
<td class="photo" rowspan="4">
<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})" alt="" /></a>
</td>
<th>タイトル</th>
<td colspan="2">({$item.subject})</td>
</tr>
<tr>
<th>説明文</th>
<td colspan="2">({$item.description|t_truncate:36:"":3})</td>
</tr>
<tr>
<th>公開範囲</th>
<td colspan="2">
({if $item.public_flag == "public"})
全員に公開
({elseif $item.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $item.public_flag == "private"})
公開しない
({/if})
</td>
</tr>
<tr>
<th>作成日時</th>
<td>({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</td>
<td class="operation"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></td>
</tr>
</table>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
