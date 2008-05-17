<div id="LayoutB">
<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新のアルバム</h3></div>
<ul class="list">
({foreach from=$target_album_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
</div>
({* }}} *})

</div><!-- Left -->

<div id="Center">

({* {{{ albumDetailBox *})
<div class="dparts albumDetailBox"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
<table>
<tr>
<td class="photo" rowspan="({if $type == "h"})5({else})4({/if})">
({if $album_info.album_cover_image})
<a href="({t_img_url filename=$album_info.album_cover_image})" target="_blank"><img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" /></a>
({else})
<img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" />
({/if})
</td>
<th>タイトル</th>
<td>({$album_info.subject})</td>
</tr>
<tr>
<th>説明文</th>
<td>({$album_info.description|nl2br|t_url2a})</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
({if $album_info.public_flag == "public"})
全員に公開
({elseif $album_info.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $album_info.public_flag == "private"})
公開しない
({/if})
</td>
</tr>
<tr>
<th>作成日時</th>
<td>({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr>
({if $type == "h"})
<tr>
<td class="operation" colspan="2">
<a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">アルバムを編集</a>
 | <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">写真を追加</a>
</td>
</tr>
({/if})
</table>
</div></div>
({* }}} *})

({if $album_image_list})

({* unknown *})<div class="dparts"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>写真一覧</h3></div>
({* unknown *})
({* unknown *})({capture name=pager})({strip})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;page=({$page-1})&amp;target_c_album_id=({$target_c_album_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $album_list_count})
({* unknown *})({$album_list_count+$page*$page_size-$page_size})
({* unknown *})({else})
({* unknown *})({$page*$page_size})
({* unknown *})({/if})
({* unknown *})件を表示
({* unknown *})</p>
({* unknown *})({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;page=({$page+1})&amp;target_c_album_id=({$target_c_album_id})">次を表示</a></p>({/if})
({* unknown *})</div>
({* unknown *})({/strip})({/capture})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})<table>
({* unknown *})({foreach from=$album_image_list item=item})
({* unknown *})({counter assign=_cnt})
({* unknown *})({if $_cnt % 2 == 1})<tr>({/if})
({* unknown *})<td style="width: 50%; padding: 5px; text-align: center;">
({* unknown *})({if $item.image_filename})
({* unknown *})<a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$item.c_album_image_id})"><img src="({t_img_url filename=$item.image_filename w=180 h=180})" alt="" /></a><br />
({* unknown *})({if $type == "h"})<a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$item.c_album_id})&amp;target_c_album_image_id=({$item.c_album_image_id})">写真を編集</a>({/if})
({* unknown *})<p>({$item.image_description})</p>
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})({if $_cnt % 2 == 0})</tr>({/if})
({* unknown *})({/foreach})
({* unknown *})({if $_cnt % 2 == 1})<td></td></tr>({/if})
({* unknown *})</table>
({* unknown *})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})</div></div>

({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
