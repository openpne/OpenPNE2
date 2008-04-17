({* unknown *})<div id="LayoutB">
({* unknown *})<div id="Left">
({* unknown *})
({* unknown *})<div class="parts sideNav">
({* unknown *})({*ここから：最新のアルバム*})
({* unknown *})<div class="item listCategory">
({* unknown *})<div class="partsHeading"><h3>最新のアルバム</h3></div>
({* unknown *})<ul class="list">
({* unknown *})({foreach from=$target_album_list item=item})
({* unknown *})<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({* unknown *})({/foreach})
({* unknown *})</ul>
({* unknown *})</div>
({* unknown *})({*ここまで：最新のアルバム*})
({* unknown *})</div> <!--parts sideNav-->
({* unknown *})
({* unknown *})</div><!-- Left -->
({* unknown *})
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})<div class="dparts formTable"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* unknown *})
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;padding:0px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td style="width:190px;padding:2px;" align="center" valign="top" rowspan="9" class="bg_02">
({* unknown *})            <span class="padding_s"><img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})                <a href="({t_img_album_url filename=$album_info.album_cover_image})" target="_blank">
({* unknown *})                <img src="({if $album_info.album_cover_image})({t_img_album_url filename=$album_info.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})">
({* unknown *})                </a>
({* unknown *})            </span>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" width=65 style="padding:2px;">タイトル</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="width:257px;padding:2px;">
({* unknown *})            <div align="left">({$album_info.subject})</div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:2px;">アルバムの説明</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:2px;">
({* unknown *})            <div class="lh_120" id="DOM_fh_album_description" style="overflow:visible;">
({* unknown *})            ({$album_info.description|t_cmd:'album'})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:2px;" NOWRAP>公開範囲</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:2px;">
({* unknown *})            ({if $album_info.public_flag == "public"})
({* unknown *})            全員に公開
({* unknown *})            ({elseif $album_info.public_flag == "friend"})
({* unknown *})            ({$WORD_MY_FRIEND})まで公開
({* unknown *})            ({elseif $album_info.public_flag == "private"})
({* unknown *})            公開しない
({* unknown *})            ({/if})
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan="4">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:2px;">作成日時</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02"><div style="padding:2px;">
({* unknown *})            ({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan="4">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td colspan="3" align=center class="bg_02"  style="padding:2px;">
({* unknown *})            ({if $type=="h"})
({* unknown *})            <a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">アルバムを編集</a>
({* unknown *})            &nbsp;|&nbsp;
({* unknown *})            <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">写真を追加</a>
({* unknown *})            ({/if})
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})
({* unknown *})
({* unknown *})</div> <!-- parts -->
({* unknown *})</div> <!-- dparts formTable -->
({* unknown *})
({* unknown *})
({* unknown *})
({* unknown *})({*ここから：写真一覧*})
({* unknown *})<div class="dparts formTable"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>写真一覧</h3></div>
({* unknown *})
({* unknown *})({if $target_album_image})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({* unknown *})({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中
({* unknown *})({strip})
({* unknown *})({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $diary_list_count})
({* unknown *})({$album_list_count+$page*$page_size-$page_size})
({* unknown *})({else})
({* unknown *})({$page*$page_size})
({* unknown *})({/if})
({* unknown *})件を表示
({* unknown *})({/strip})
({* unknown *})</p>
({* unknown *})({if $is_next})
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div> <!-- pagerRelative -->
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    ({foreach from=$new_album_list key=key item=album_item})
({* unknown *})    <tr>
({* unknown *})        <td align="center" class="bg_02"  width="50%">
({* unknown *})            ({if $album_item.dual.image_filename})
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})            <div>
({* unknown *})            <span class="padding_s">
({* unknown *})                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})" >
({* unknown *})                <img src="({t_img_album_url filename=$album_item.dual.image_filename w=180 h=180})">
({* unknown *})                </a>
({* unknown *})            </span>
({* unknown *})            </div>
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.dual.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* unknown *})            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.dual.c_album_id})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})">写真を編集</a>
({* unknown *})            ({/if})
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="center" class="bg_02" width="50%">
({* unknown *})            ({if $album_item.singular.image_filename})
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})            <div>
({* unknown *})            <span class="padding_s">
({* unknown *})                <a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})" >
({* unknown *})                <img src="({t_img_album_url filename=$album_item.singular.image_filename w=180 h=180})">
({* unknown *})                </a>
({* unknown *})                </span>
({* unknown *})            </div>
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})            <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.singular.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* unknown *})            <a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$album_item.singular.c_album_id})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})">写真を編集</a>
({* unknown *})            ({/if})
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    ({/foreach})
({* unknown *})</table>
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">前を表示</a></p>
({* unknown *})({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中
({* unknown *})({strip})
({* unknown *})({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $diary_list_count})
({* unknown *})({$album_list_count+$page*$page_size-$page_size})
({* unknown *})({else})
({* unknown *})({$page*$page_size})
({* unknown *})({/if})
({* unknown *})件を表示
({* unknown *})({/strip})
({* unknown *})</p>
({* unknown *})({if $is_next})
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div> <!-- pagerRelative -->
({* unknown *})({else})
({* unknown *})<!-- アルバムに画像なし -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:522px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td ALIGN="middle" class="bg_02"><div style="padding:4px 3px;">写真なし</div></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div> <!-- parts -->
({* unknown *})</div> <!-- dparts formTable -->
({* unknown *})({*ここまで：写真一覧*})
({* unknown *})
({* unknown *})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutB -->
({* unknown *})
({* unknown *})({***********************
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" >
({* unknown *})<tr>
({* unknown *})<td  align="center" valign="top">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.recent_Album})</span></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<div align="left" style="padding:3px;" class="bg_02 border_01">
({* unknown *})({foreach from=$new_album_subject_list item=item})
({* unknown *})<div><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">
({* unknown *})<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$item.subject|t_truncate:15})</a></div>
({* unknown *})({/foreach})
({* unknown *})</div>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tlm})</span></td>
({* unknown *})                </tr>
({* unknown *})            </table>
({* unknown *})            <div align="left" class="bg_02 border_01 padding_ss">
({* unknown *})            <a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_1">({$ltag.voice_mail})({$ltag.list})</a>
({* unknown *})            </div>
({* unknown *})            </div>
({* unknown *})            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})            </div>    
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})({if $date_list})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})*************************})
({* unknown *})
({* unknown *})({************************
({* unknown *})({if $category})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;"  id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.album_category})</span></td>
({* unknown *})                </tr>
({* unknown *})            </table>
({* unknown *})            <div align="left" class="bg_02 border_01 padding_ss">
({* unknown *})            ({foreach from=$category item=category_item})
({* unknown *})            <div><a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_album_category_id})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$category_item.category_name})</a></div>
({* unknown *})            ({/foreach})
({* unknown *})            </div>
({* unknown *})            </div>
({* unknown *})            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})            </div>    
({* unknown *})            
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})*************************})
({* unknown *})
({* unknown *})({**************************
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td>
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$target_member.nickname})({$smarty.const.NAME_TAIL})({if $type == "f"})さん({/if})の日記</span></td>
({* unknown *})    </tr>
({* unknown *})    </table>
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;padding:0px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td align=center valign="top" rowspan=11 class="bg_02"  width="200">
({* unknown *})            <span class="padding_s"><img src="./skin/dummy.gif" class="v_spacer_m"><a href="({t_img_album_url filename=$album_info.album_cover_image})" target="_blank"><img src="({t_img_album_url filename=$album_info.album_cover_image w=180 h=180})"></a></span><br>({if $member.c_member_id == $target_member.c_member_id})<div style="padding:2px; "><a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.add_photos})</a>&nbsp;({if $new_album_list})|&nbsp;<a href="({t_url m=pc a=page_h_album_edit})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.editor})({$ltag.photo})</a>({/if})</div>({/if})
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" width=65 style="padding:4px;">({$ltag.album_Title})</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="width:257px;padding:4px;">
({* unknown *})            <div align="left" style="font-size:100%;overflow:visible;">
({* unknown *})            ({$album_info.subject|t_truncate:40})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">({$ltag.note_album})</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">
({* unknown *})            <div class="lh_120" id="DOM_fh_album_description" style="overflow:visible;">
({* unknown *})            ({$album_info.description|nl2br|t_url2cmd:'album'|t_cmd:'album'})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">({$ltag.group_blog})</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">
({* unknown *})            <div class="lh_120" id="DOM_fh_album_description" style="overflow: auto;">
({* unknown *})            ({foreach from=$category_list item=category})
({* unknown *})                ({$category.category_name}) 
({* unknown *})            ({/foreach})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;" NOWRAP>({$ltag.open_range})</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">({if $album_info.public_flag == "public"})
({* unknown *})            ({$ltag.album_public})
({* unknown *})            ({elseif $album_info.public_flag == "friend"})
({* unknown *})            ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
({* unknown *})            ({elseif $album_info.public_flag == "private"})
({* unknown *})            ({$ltag.not_open})&nbsp;&nbsp;(({$ltag.album_has_pwd}))<br />
({* unknown *})            ({if $target_c_member_id == $u})<a href="({t_url m=pc a=page_h_album_invite})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.fh_album_tell_friend})</a>({/if})
({* unknown *})            ({/if})</td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" style="padding:4px;">({$ltag.h_album_create_date})</td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02"><div style="padding:4px 3px;">
({* unknown *})            ({$album_info.r_datetime|date_format:"%m-%d-%Y %H:%M"})
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=4>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td colspan=3 align=center class="bg_02"  style="padding:4px;">
({* unknown *})            ({if $member.c_member_id == $target_member.c_member_id})<div><a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">({$ltag.editor})({$ltag.ablum})</a> | ({/if})({if $new_album_list})<a href="#write">({$ltag.voice_mail})（({$comment_num}) ）</a></div>({else})({$ltag.album_content})({/if})
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})**************************})
({* unknown *})
({* unknown *})({********************
({* unknown *})({if $new_album_list})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})<tr>
({* unknown *})    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.photos_List})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" >
({* unknown *})    <tr>
({* unknown *})        <td ALIGN=right class="bg_02">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({if $is_prev})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Forward})</a>
({* unknown *})        ({/if})
({* unknown *})        ({$page*$page_size-$page_size+1})-({if $page_size > $album_list_count})
({* unknown *})        ({$album_list_count+$page*$page_size-$page_size})
({* unknown *})        ({else})
({* unknown *})        ({$page*$page_size})
({* unknown *})        ({/if})
({* unknown *})        ({if $is_next})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Next})</a>
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})({if $new_album_list})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    ({foreach from=$new_album_list key=key item=album_item})
({* unknown *})    <tr>
({* unknown *})        <td align="center" class="bg_02"  width="50%">
({* unknown *})        ({if $album_item.dual.image_filename})
({* unknown *})        <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})        <div>
({* unknown *})        <span class="padding_s"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.dual.c_album_image_id})&amp;target_c_member_id=({$album_item.dual.c_member_id})&amp;target_c_album_id=({$album_item.dual.c_album_id})" ><img src="({t_img_album_url filename=$album_item.dual.image_filename w=220 h=220})"></a></span>
({* unknown *})        </div>
({* unknown *})        <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})        <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.dual.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* unknown *})        ({/if})</td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td align="center" class="bg_02" width="50%">({if $album_item.singular.image_filename})
({* unknown *})        <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})        <div>
({* unknown *})        <span class="padding_s"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$album_item.singular.c_album_image_id})&amp;target_c_member_id=({$album_item.singular.c_member_id})&amp;target_c_album_id=({$album_item.singular.c_album_id})" ><img src="({t_img_album_url filename=$album_item.singular.image_filename w=220 h=220})"></a></span>
({* unknown *})        </div>
({* unknown *})        <img src="./skin/dummy.gif" class="v_spacer_m">
({* unknown *})        <div><img src="./skin/dummy.gif" class="v_spacer_m">({$album_item.singular.image_description})<img src="./skin/dummy.gif" class="v_spacer_m"></div>
({* unknown *})        ({/if})
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({/foreach})
({* unknown *})</table>
({* unknown *})({/if})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" >
({* unknown *})    <tr>
({* unknown *})        <td ALIGN=right class="bg_02">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({if $is_prev})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_forward})</a>
({* unknown *})        ({/if})
({* unknown *})        ({$page*$page_size-$page_size+1})-({if $page_size > $album_list_count})
({* unknown *})        ({$album_list_count+$page*$page_size-$page_size})
({* unknown *})        ({else})
({* unknown *})        ({$page*$page_size})
({* unknown *})        ({/if})
({* unknown *})        ({if $is_next})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_album.0.c_album_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_backward})</a>
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})({else})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.photos_List})</span></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td ALIGN=middle class="bg_02"><div style="padding:4px 3px;">({$ltag.album_no_photos})</div></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({if $target_album_comment_list})
({* unknown *})({t_form m=pc a=page_fh_delete_album_comment})
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$album_info.c_album_id})">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;" id="DOM_fh_album_comments">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})        <tr>
({* unknown *})            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* unknown *})            <a name="comment" id="comment">({$ltag.album_list})</a>
({* unknown *})            </span>
({* unknown *})        </td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td style="width:522px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        ({foreach from=$target_album_comment_list item=item})
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:95px;" class="bg_02" align="center" valign="top" rowspan="3">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$item.r_datetime|date_format:"%m-%d-%Y<br>%H:%M"})<br>
({* unknown *})            ({if $type == "h"})
({* unknown *})            <input type="checkbox" name="target_c_album_comment_id[]" value="({$item.c_album_comment_id})" class="no_bg">
({* unknown *})            ({/if})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:421px;" class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({if $item.nickname})
({* unknown *})            <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><span class="DOM_fh_album_comment_writer">({$item.nickname|default:"&nbsp;"})({$smarty.const.NAME_TAIL})</span></a>
({* unknown *})            ({else})
({* unknown *})            &nbsp;
({* unknown *})            ({/if})
({* unknown *})            ({if $type == "f" && $item.c_member_id == $member.c_member_id})
({* unknown *})            |&nbsp;<a href="({t_url m=pc a=page_fh_delete_album_comment})&amp;target_c_album_id=({$item.c_album_id})&amp;target_c_album_comment_id=({$item.c_album_comment_id})">({$ltag.delete})</a>
({* unknown *})            ({/if})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:421px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;" class="lh_120 DOM_fh_album_comment_body">
({* unknown *})            ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
({* unknown *})            ({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
({* unknown *})            ({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
({* unknown *})            ({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_album_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_album_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
({* unknown *})            <br>
({* unknown *})            ({/if})
({* unknown *})            ({$item.body|nl2br|t_url2cmd:'album'|t_cmd:'album'})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        ({/foreach})
({* unknown *})    </table>
({* unknown *})    ({if $type == "h"})
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:522px;" class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;" class="lh_120">
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})            <div style="text-align:center;">
({* unknown *})            <input type="submit" class="submit_b" value="({$ltag.delete})">
({* unknown *})            </div>
({* unknown *})            <img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    ({/if})
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</form>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})*******************})
({* unknown *})
({* unknown *})({**************************
({* unknown *})({if $new_album_list})
({* unknown *})({t_form _enctype=file m=pc a=page_fh_album_comment_confirm})
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$target_album.0.c_album_id})">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00"><a name="write">({$ltag.voice_mail})</a></span></td>
({* unknown *})    </tr>
({* unknown *})    </table>
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:width:524px;;" class="border_01">
({* unknown *})    <tr>
({* unknown *})    <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td style="width:522px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td style="width:95px;" class="bg_02" align="center" valign="middle">
({* unknown *})    <div style="padding:4px 4px;" class="lh_120">
({* unknown *})    ({$ltag.content})
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="left" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    <textarea class="text" name="body" rows="8" cols="40" style="width:419px">({$requests.body})</textarea>
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td style="width:1px" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="center" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    ({$ltag.photo_1})
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="left" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    <input type="file" name="upfile_1" size="40">
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="center" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    ({$ltag.photo_2})
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="left" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    <input type="file" name="upfile_2" size="40">
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="center" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    ({$ltag.photo_3})
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="left" valign="middle">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    <input type="file" name="upfile_3" size="40">
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02" align="center" colspan="3">
({* unknown *})    <div style="padding:4px 3px;">
({* unknown *})    <input type="submit" class="submit" value="　({$ltag.determined})　">
({* unknown *})    </div>
({* unknown *})    </td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})    <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    </table>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</form>
({* unknown *})({/if})
({* unknown *})****************************})
