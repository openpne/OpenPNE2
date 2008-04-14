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

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>

    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;padding:0px;" class="border_01">
        <tr>
            <td style="width:190px;padding:2px;" align="center" valign="top" rowspan="9" class="bg_02">
            <span class="padding_s"><img src="./skin/dummy.gif" class="v_spacer_m">
                <a href="({t_img_album_url filename=$album_info.album_cover_image})" target="_blank">
                <img src="({if $album_info.album_cover_image})({t_img_album_url filename=$album_info.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})">
                </a>
            </span>
            </td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
            </td>
            <td class="bg_02" width=65 style="padding:2px;">タイトル</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="width:257px;padding:2px;">
            <div align="left">({$album_info.subject})</div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:2px;">アルバムの説明</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:2px;">
            <div class="lh_120" id="DOM_fh_album_description" style="overflow:visible;">
            ({$album_info.description|t_cmd:'album'})
            </div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:2px;" NOWRAP>公開範囲</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:2px;">
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
            <td style="height:1px;" class="bg_01" align="center" colspan="4">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:2px;">作成日時</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02"><div style="padding:2px;">
            ({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan="4">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
            </td>
            <td colspan="3" align=center class="bg_02"  style="padding:2px;">
            ({if $type=="h"})
            <a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">アルバムを編集</a>
            &nbsp;|&nbsp;
            <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">写真を追加</a>
            ({/if})
            </td>
        </tr>
    </table>


</div> <!-- parts -->
</div> <!-- dparts formTable -->



({*ここから：写真一覧*})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真一覧</h3></div>

({if $target_album_image})
<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({/if})
<p class="number">
({$total_num})件中
({strip})
({$page*$page_size-$page_size+1})件～
({if $page_size > $diary_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
({/strip})
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({/if})
</div> <!-- pagerRelative -->

<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    ({foreach from=$new_album_list key=key item=album_item})
    <tr>
        <td align="center" class="bg_02"  width="50%">
            ({if $album_item.dual.image_filename})
            <img src="./skin/dummy.gif" class="v_spacer_m">
            <div>
            <span class="padding_s">
                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})" >
                <img src="({t_img_album_url filename=$album_item.dual.image_filename w=180 h=180})">
                </a>
            </span>
            </div>
            <img src="./skin/dummy.gif" class="v_spacer_m">
            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.dual.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.dual.c_album_id})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})">写真を編集</a>
            ({/if})
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
        </td>
        <td align="center" class="bg_02" width="50%">
            ({if $album_item.singular.image_filename})
            <img src="./skin/dummy.gif" class="v_spacer_m">
            <div>
            <span class="padding_s">
                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})" >
                <img src="({t_img_album_url filename=$album_item.singular.image_filename w=180 h=180})">
                </a>
                </span>
            </div>
            <img src="./skin/dummy.gif" class="v_spacer_m">
            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.singular.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.singular.c_album_id})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})">写真を編集</a>
            ({/if})
        </td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
        </td>
    </tr>
    ({/foreach})
</table>

<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({/if})
<p class="number">
({$total_num})件中
({strip})
({$page*$page_size-$page_size+1})件～
({if $page_size > $diary_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
({/strip})
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({/if})
</div> <!-- pagerRelative -->
({else})
<!-- アルバムに画像なし -->
<table border="0" cellspacing="0" cellpadding="0" style="width:522px;" class="border_01">
    <tr>
        <td ALIGN="middle" class="bg_02"><div style="padding:4px 3px;">写真なし</div></td>
    </tr>
</table>
({/if})

</div> <!-- parts -->
</div> <!-- dparts formTable -->
({*ここまで：写真一覧*})



</div><!-- Center -->
</div><!-- LayoutB -->

({***********************
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" >
<tr>
<td  align="center" valign="top">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
    <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.recent_Album})</span></td>
    </tr>
</table>
<div align="left" style="padding:3px;" class="bg_02 border_01">
({foreach from=$new_album_subject_list item=item})
<div><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">
<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$item.subject|t_truncate:15})</a></div>
({/foreach})
</div>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>

<img src="./skin/dummy.gif" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
    <tr>
        <td align="center">
            <div id="xsnazzy">
            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
            <div class="xboxcontent">
            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
                <tr>
                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tlm})</span></td>
                </tr>
            </table>
            <div align="left" class="bg_02 border_01 padding_ss">
            <a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_1">({$ltag.voice_mail})({$ltag.list})</a>
            </div>
            </div>
            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
            </div>    
        </td>
    </tr>
</table>

({if $date_list})
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})
*************************})

({************************
({if $category})
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;"  id="main_image_and_name">
    <tr>
        <td align="center">
            <div id="xsnazzy">
            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
            <div class="xboxcontent">
            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
                <tr>
                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.album_category})</span></td>
                </tr>
            </table>
            <div align="left" class="bg_02 border_01 padding_ss">
            ({foreach from=$category item=category_item})
            <div><a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_album_category_id})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$category_item.category_name})</a></div>
            ({/foreach})
            </div>
            </div>
            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
            </div>    
            
        </td>
    </tr>
</table>
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})
*************************})

({**************************

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td>
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
    <tr>
    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$target_member.nickname})({$smarty.const.NAME_TAIL})({if $type == "f"})さん({/if})の日記</span></td>
    </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;padding:0px;" class="border_01">
        <tr>
            <td align=center valign="top" rowspan=11 class="bg_02"  width="200">
            <span class="padding_s"><img src="./skin/dummy.gif" class="v_spacer_m"><a href="({t_img_album_url filename=$album_info.album_cover_image})" target="_blank"><img src="({t_img_album_url filename=$album_info.album_cover_image w=180 h=180})"></a></span><br>({if $member.c_member_id == $target_member.c_member_id})<div style="padding:2px; "><a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.add_photos})</a>&nbsp;({if $new_album_list})|&nbsp;<a href="({t_url m=pc a=page_h_album_edit})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.editor})({$ltag.photo})</a>({/if})</div>({/if})
            </td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
            </td>
            <td class="bg_02" width=65 style="padding:4px;">({$ltag.album_Title})</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="width:257px;padding:4px;">
            <div align="left" style="font-size:100%;overflow:visible;">
            ({$album_info.subject|t_truncate:40})
            </div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">({$ltag.note_album})</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">
            <div class="lh_120" id="DOM_fh_album_description" style="overflow:visible;">
            ({$album_info.description|nl2br|t_url2cmd:'album'|t_cmd:'album'})
            </div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">({$ltag.group_blog})</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">
            <div class="lh_120" id="DOM_fh_album_description" style="overflow: auto;">
            ({foreach from=$category_list item=category})
                ({$category.category_name}) 
            ({/foreach})
            </div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;" NOWRAP>({$ltag.open_range})</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">({if $album_info.public_flag == "public"})
            ({$ltag.album_public})
            ({elseif $album_info.public_flag == "friend"})
            ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
            ({elseif $album_info.public_flag == "private"})
            ({$ltag.not_open})&nbsp;&nbsp;(({$ltag.album_has_pwd}))<br />
            ({if $target_c_member_id == $u})<a href="({t_url m=pc a=page_h_album_invite})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.fh_album_tell_friend})</a>({/if})
            ({/if})</td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" style="padding:4px;">({$ltag.h_album_create_date})</td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02"><div style="padding:4px 3px;">
            ({$album_info.r_datetime|date_format:"%m-%d-%Y %H:%M"})
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=4>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
            </td>
            <td colspan=3 align=center class="bg_02"  style="padding:4px;">
            ({if $member.c_member_id == $target_member.c_member_id})<div><a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.editor})({$ltag.ablum})</a> | ({/if})({if $new_album_list})<a href="#write">({$ltag.voice_mail})（({$comment_num}) ）</a></div>({else})({$ltag.album_content})({/if})
            </td>
        </tr>
    </table>
**************************})

({********************
({if $new_album_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
<tr>
    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.photos_List})</span></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" >
    <tr>
        <td ALIGN=right class="bg_02">
        <div style="padding:4px 3px;">
        ({if $is_prev})
        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Forward})</a>
        ({/if})
        ({$page*$page_size-$page_size+1})-({if $page_size > $album_list_count})
        ({$album_list_count+$page*$page_size-$page_size})
        ({else})
        ({$page*$page_size})
        ({/if})
        ({if $is_next})
        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Next})</a>
        ({/if})
        </div>
        </td>
    </tr>
</table>
({if $new_album_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    ({foreach from=$new_album_list key=key item=album_item})
    <tr>
        <td align="center" class="bg_02"  width="50%">
        ({if $album_item.dual.image_filename})
        <img src="./skin/dummy.gif" class="v_spacer_m">
        <div>
        <span class="padding_s"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})" ><img src="({t_img_album_url filename=$album_item.dual.image_filename w=220 h=220})"></a></span>
        </div>
        <img src="./skin/dummy.gif" class="v_spacer_m">
        <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.dual.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
        ({/if})</td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td align="center" class="bg_02" width="50%">({if $album_item.singular.image_filename})
        <img src="./skin/dummy.gif" class="v_spacer_m">
        <div>
        <span class="padding_s"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})" ><img src="({t_img_album_url filename=$album_item.singular.image_filename w=220 h=220})"></a></span>
        </div>
        <img src="./skin/dummy.gif" class="v_spacer_m">
        <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.singular.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
        ({/if})
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({/foreach})
</table>
({/if})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" >
    <tr>
        <td ALIGN=right class="bg_02">
        <div style="padding:4px 3px;">
        ({if $is_prev})
        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_forward})</a>
        ({/if})
        ({$page*$page_size-$page_size+1})-({if $page_size > $album_list_count})
        ({$album_list_count+$page*$page_size-$page_size})
        ({else})
        ({$page*$page_size})
        ({/if})
        ({if $is_next})
        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_backward})</a>
        ({/if})
        </div>
        </td>
    </tr>
</table>

({else})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
    <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.photos_List})</span></td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
<tr>
<td ALIGN=middle class="bg_02"><div style="padding:4px 3px;">({$ltag.album_no_photos})</div></td>
</tr>
</table>
({/if})
</div>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>

<img src="./skin/dummy.gif" class="v_spacer_l">

({if $target_album_comment_list})
({t_form m=pc a=page_fh_delete_album_comment})
<input type="hidden" name="target_c_album_id" value="({$album_info.c_album_id})">
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;" id="DOM_fh_album_comments">
<tr>
<td align="center">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
        <tr>
            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
            <a name="comment" id="comment">({$ltag.album_list})</a>
            </span>
        </td>
        </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
        <tr>
            <td style="width:522px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        ({foreach from=$target_album_comment_list item=item})
        <tr>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:95px;" class="bg_02" align="center" valign="top" rowspan="3">
            <div style="padding:4px 3px;">
            ({$item.r_datetime|date_format:"%m-%d-%Y<br>%H:%M"})<br>
            ({if $type == "h"})
            <input type="checkbox" name="target_c_album_comment_id[]" value="({$item.c_album_comment_id})" class="no_bg">
            ({/if})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:421px;" class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            ({if $item.nickname})
            <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><span class="DOM_fh_album_comment_writer">({$item.nickname|default:"&nbsp;"})({$smarty.const.NAME_TAIL})</span></a>
            ({else})
            &nbsp;
            ({/if})
            ({if $type == "f" && $item.c_member_id == $member.c_member_id})
            |&nbsp;<a href="({t_url m=pc a=page_fh_delete_album_comment})&amp;target_c_album_id=({$item.c_album_id})&amp;target_c_album_comment_id=({$item.c_album_comment_id})">({$ltag.delete})</a>
            ({/if})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:421px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;" class="lh_120 DOM_fh_album_comment_body">
            ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
            ({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
            ({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
            ({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
            <br>
            ({/if})
            ({$item.body|nl2br|t_url2cmd:'album'|t_cmd:'album'})
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        ({/foreach})
    </table>
    ({if $type == "h"})
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:522px;" class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;" class="lh_120">
            <img src="./skin/dummy.gif" class="v_spacer_l">
            <div style="text-align:center;">
            <input type="submit" class="submit_b" value="({$ltag.delete})">
            </div>
            <img src="./skin/dummy.gif" class="v_spacer_l">
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
    </table>
    ({/if})
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>

</form>
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})
*******************})

({**************************
({if $new_album_list})
({t_form _enctype=file m=pc a=page_fh_album_comment_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_album.0.c_album_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td align="center">

<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
    <tr>
    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00"><a name="write">({$ltag.voice_mail})</a></span></td>
    </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" style="width:width:524px;;" class="border_01">
    <tr>
    <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td style="width:522px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td style="width:95px;" class="bg_02" align="center" valign="middle">
    <div style="padding:4px 4px;" class="lh_120">
    ({$ltag.content})
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="left" valign="middle">
    <div style="padding:4px 3px;">
    <textarea class="text" name="body" rows="8" cols="40" style="width:419px">({$requests.body})</textarea>
    </div>
    </td>
    <td style="width:1px" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="center" valign="middle">
    <div style="padding:4px 3px;">
    ({$ltag.photo_1})
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="left" valign="middle">
    <div style="padding:4px 3px;">
    <input type="file" name="upfile_1" size="40">
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="center" valign="middle">
    <div style="padding:4px 3px;">
    ({$ltag.photo_2})
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="left" valign="middle">
    <div style="padding:4px 3px;">
    <input type="file" name="upfile_2" size="40">
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="center" valign="middle">
    <div style="padding:4px 3px;">
    ({$ltag.photo_3})
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="left" valign="middle">
    <div style="padding:4px 3px;">
    <input type="file" name="upfile_3" size="40">
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    <td class="bg_02" align="center" colspan="3">
    <div style="padding:4px 3px;">
    <input type="submit" class="submit" value="　({$ltag.determined})　">
    </div>
    </td>
    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    </table>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>
</form>
({/if})
****************************})
