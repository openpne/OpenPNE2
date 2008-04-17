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

({* unknown *})<div class="dparts"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* unknown *})<table>
({* unknown *})<tr>
({* unknown *})<td class="photo" rowspan="({if $type == "h"})5({else})4({/if})" style="width: 180px; padding: 5px;">
({* unknown *})({if $album_info.album_cover_image})
({* unknown *})<a href="({t_img_url filename=$album_info.album_cover_image})" target="_blank"><img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" /></a>
({* unknown *})({else})
({* unknown *})<img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" />
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})<th style="width: 75px; padding: 5px;">タイトル</th>
({* unknown *})<td style="padding: 5px;">({$album_info.subject})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">アルバムの説明</th>
({* unknown *})<td style="padding: 5px;">({$album_info.description|t_cmd:'album'})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">公開範囲</th>
({* unknown *})<td style="padding: 5px;">
({* unknown *})({if $album_info.public_flag == "public"})
({* unknown *})全員に公開
({* unknown *})({elseif $album_info.public_flag == "friend"})
({* unknown *})({$WORD_MY_FRIEND})まで公開
({* unknown *})({elseif $album_info.public_flag == "private"})
({* unknown *})公開しない
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">作成日時</th>
({* unknown *})<td style="padding: 5px;">({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
({* unknown *})</tr>
({* unknown *})({if $type == "h"})
({* unknown *})<tr>
({* unknown *})<td colspan="2" style="border-left-width: 1px; padding: 5px;">
({* unknown *})<a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">アルバムを編集</a>
({* unknown *}) | <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">写真を追加</a>
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})</div></div>

({if $target_album_image})

({* unknown *})<div class="dparts"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>写真一覧</h3></div>
({* unknown *})
({* unknown *})({capture name=pager})({strip})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;page=({$page-1})&amp;target_c_album_id=({$target_c_album_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $diary_list_count})
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
({* unknown *})({foreach from=$new_album_list key=key item=album_item})
({* unknown *})<tr>
({* unknown *})<td style="width: 50%; padding: 5px; text-align: center;">
({* unknown *})({if $album_item.dual.image_filename})
({* unknown *})<a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})"><img src="({t_img_url filename=$album_item.dual.image_filename w=180 h=180})" alt="" /></a><br />
({* unknown *})({if $type == "h"})<a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.dual.c_album_id})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})">写真を編集</a>({/if})
({* unknown *})<p>({$album_item.dual.image_description})</p>
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})<td style="width: 50%; padding: 5px; text-align: center;">
({* unknown *})({if $album_item.singular.image_filename})
({* unknown *})<a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})"><img src="({t_img_url filename=$album_item.singular.image_filename w=180 h=180})" alt="" /></a><br />
({* unknown *})({if $type == "h"})<a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.singular.c_album_id})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})">写真を編集</a>({/if})
({* unknown *})<p>({$album_item.singular.image_description})</p>
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})({/foreach})
({* unknown *})</table>
({* unknown *})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})</div></div>
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
