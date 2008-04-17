<div id="LayoutB">
<div id="Left">

<div class="parts sideNav">
({*ここから：最新のアルバム*})
<div class="item listCategory">
<div class="partsHeading"><h3>最新のアルバム</h3></div>
<ul class="list">
({foreach from=$target_album_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
({*ここまで：最新のアルバム*})
</div> <!--parts sideNav-->

</div><!-- Left -->

<div id="Center">

({* #1952 *})<div class="dparts formTable"><div class="parts">
({* #1952 *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* #1952 *})
({* #1952 *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;padding:0px;" class="border_01">
({* #1952 *})        <tr>
({* #1952 *})            <td style="width:190px;padding:2px;" align="center" valign="top" rowspan="9" class="bg_02">
({* #1952 *})            <span class="padding_s"><img src="./skin/dummy.gif" class="v_spacer_m">
({* #1952 *})                <a href="({t_img_album_url filename=$album_info.album_cover_image})" target="_blank">
({* #1952 *})                <img src="({if $album_info.album_cover_image})({t_img_album_url filename=$album_info.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})">
({* #1952 *})                </a>
({* #1952 *})            </span>
({* #1952 *})            </td>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" width=65 style="padding:2px;">タイトル</td>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="width:257px;padding:2px;">
({* #1952 *})            <div align="left">({$album_info.subject})</div>
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="padding:2px;">アルバムの説明</td>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="padding:2px;">
({* #1952 *})            <div class="lh_120" id="DOM_fh_album_description" style="overflow:visible;">
({* #1952 *})            ({$album_info.description|t_cmd:'album'})
({* #1952 *})            </div>
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="padding:2px;" NOWRAP>公開範囲</td>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="padding:2px;">
({* #1952 *})            ({if $album_info.public_flag == "public"})
({* #1952 *})            全員に公開
({* #1952 *})            ({elseif $album_info.public_flag == "friend"})
({* #1952 *})            ({$WORD_MY_FRIEND})まで公開
({* #1952 *})            ({elseif $album_info.public_flag == "private"})
({* #1952 *})            公開しない
({* #1952 *})            ({/if})
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="height:1px;" class="bg_01" align="center" colspan="4">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02" style="padding:2px;">作成日時</td>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td class="bg_02"><div style="padding:2px;">
({* #1952 *})            ({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="height:1px;" class="bg_01" align="center" colspan="4">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})        <tr>
({* #1952 *})            <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1952 *})            </td>
({* #1952 *})            <td colspan="3" align=center class="bg_02"  style="padding:2px;">
({* #1952 *})            ({if $type=="h"})
({* #1952 *})            <a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">アルバムを編集</a>
({* #1952 *})            &nbsp;|&nbsp;
({* #1952 *})            <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">写真を追加</a>
({* #1952 *})            ({/if})
({* #1952 *})            </td>
({* #1952 *})        </tr>
({* #1952 *})    </table>
({* #1952 *})
({* #1952 *})
({* #1952 *})</div> <!-- parts -->
({* #1952 *})</div> <!-- dparts formTable -->
({* unknown *})
({* unknown *})
({* unknown *})
({* #1952 *})({*ここから：写真一覧*})
({* #1952 *})<div class="dparts formTable"><div class="parts">
({* #1952 *})<div class="partsHeading"><h3>写真一覧</h3></div>
({* #1952 *})
({* #1952 *})({if $target_album_image})
({* #1952 *})<div class="pagerRelative">
({* #1952 *})({if $is_prev})
({* #1952 *})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({* #1952 *})({/if})
({* #1952 *})<p class="number">
({* #1952 *})({$total_num})件中
({* #1952 *})({strip})
({* #1952 *})({$page*$page_size-$page_size+1})件～
({* #1952 *})({if $page_size > $diary_list_count})
({* #1952 *})({$album_list_count+$page*$page_size-$page_size})
({* #1952 *})({else})
({* #1952 *})({$page*$page_size})
({* #1952 *})({/if})
({* #1952 *})件を表示
({* #1952 *})({/strip})
({* #1952 *})</p>
({* #1952 *})({if $is_next})
({* #1952 *})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({* #1952 *})({/if})
({* #1952 *})</div> <!-- pagerRelative -->
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* #1952 *})    ({foreach from=$new_album_list key=key item=album_item})
({* #1952 *})    <tr>
({* #1952 *})        <td align="center" class="bg_02"  width="50%">
({* #1952 *})            ({if $album_item.dual.image_filename})
({* #1952 *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* #1952 *})            <div>
({* #1952 *})            <span class="padding_s">
({* #1952 *})                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})" >
({* #1952 *})                <img src="({t_img_album_url filename=$album_item.dual.image_filename w=180 h=180})">
({* #1952 *})                </a>
({* #1952 *})            </span>
({* #1952 *})            </div>
({* #1952 *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* #1952 *})            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.dual.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* #1952 *})            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.dual.c_album_id})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})">写真を編集</a>
({* #1952 *})            ({/if})
({* #1952 *})        </td>
({* #1952 *})        <td style="width:1px;" class="bg_01" align="center">
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})        </td>
({* #1952 *})        <td align="center" class="bg_02" width="50%">
({* #1952 *})            ({if $album_item.singular.image_filename})
({* #1952 *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* #1952 *})            <div>
({* #1952 *})            <span class="padding_s">
({* #1952 *})                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})" >
({* #1952 *})                <img src="({t_img_album_url filename=$album_item.singular.image_filename w=180 h=180})">
({* #1952 *})                </a>
({* #1952 *})                </span>
({* #1952 *})            </div>
({* #1952 *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* #1952 *})            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.singular.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* #1952 *})            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.singular.c_album_id})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})">写真を編集</a>
({* #1952 *})            ({/if})
({* #1952 *})        </td>
({* #1952 *})    </tr>
({* #1952 *})    <tr>
({* #1952 *})        <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* #1952 *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* #1952 *})        </td>
({* #1952 *})    </tr>
({* #1952 *})    ({/foreach})
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})<div class="pagerRelative">
({* #1952 *})({if $is_prev})
({* #1952 *})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({* #1952 *})({/if})
({* #1952 *})<p class="number">
({* #1952 *})({$total_num})件中
({* #1952 *})({strip})
({* #1952 *})({$page*$page_size-$page_size+1})件～
({* #1952 *})({if $page_size > $diary_list_count})
({* #1952 *})({$album_list_count+$page*$page_size-$page_size})
({* #1952 *})({else})
({* #1952 *})({$page*$page_size})
({* #1952 *})({/if})
({* #1952 *})件を表示
({* #1952 *})({/strip})
({* #1952 *})</p>
({* #1952 *})({if $is_next})
({* #1952 *})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({* #1952 *})({/if})
({* #1952 *})</div> <!-- pagerRelative -->
({* #1952 *})({else})
({* #1952 *})<!-- アルバムに画像なし -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:522px;" class="border_01">
({* #1952 *})    <tr>
({* #1952 *})        <td ALIGN="middle" class="bg_02"><div style="padding:4px 3px;">写真なし</div></td>
({* #1952 *})    </tr>
({* #1952 *})</table>
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div> <!-- parts -->
({* #1952 *})</div> <!-- dparts formTable -->
({* #1952 *})({*ここまで：写真一覧*})
({* #1952 *})
({* #1952 *})
({* #1952 *})
({* #1952 *})</div><!-- Center -->
({* #1952 *})</div><!-- LayoutB -->

