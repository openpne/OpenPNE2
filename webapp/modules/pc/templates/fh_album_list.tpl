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

<div class="parts sideNav">
({*ここから：最新のアルバム*})
<div class="item listCategory">
<div class="partsHeading"><h3>最新のアルバム</h3></div>
<ul class="list">
({foreach from=$target_album_subject_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
({*ここまで：最新のアルバム*})
</div> <!--parts sideNav-->

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

({*ここから：アルバム一覧*})
({if $target_album_list})
<div class="dparts commentList">
<div class="parts">

<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
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
<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({/if})
</div> <!-- pagerRelative -->

({foreach from=$target_album_list item=item})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    <tr>
        <td style="width:190px;padding:2px;" valign="top" rowspan="9" align="center" class="bg_02">
        <span class="padding_s">
            <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_album_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})"></a>
        </span>
        </td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_02" style="width:75px;padding:2px;">タイトル</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.subject})</td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5">
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_02" style="width:75px;padding:2px;">アルバムの説明</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.description})</td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5">
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_02" style="width:75px;padding:2px;">公開範囲</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan=2 class="bg_02" style="width:240px;padding:2px;">
        <div style="padding:3px 2px;">
        ({if $item.public_flag == "public"})
        （全員に公開）
        ({elseif $item.public_flag == "friend"})
        （({$WORD_MY_FRIEND})まで公開）
        ({elseif $item.public_flag == "private"})
        （公開しない）
        ({/if})
        </div>
        </td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>

    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_02" style="width:75px;padding:2px;">作成日時</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td class="bg_02" style="padding:2px;">({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
        <td align="center" class="bg_02"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" /></a></td>
    </tr>
</table>
({/foreach})
</table>


<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
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
<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({/if})
</div> <!-- pagerRelative -->

</div> <!-- dparts commentList -->
</div> <!-- parts -->
({/if})
({*ここまで：アルバム一覧*})


</div><!-- Center -->
</div><!-- LayoutB -->


({*if $album_subject_list*})
({***********************************************
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" >
<tr>
<td align="center" valign="top">
<div id="xsnazzy">
<b class="xtop">
    <b class="xb1"></b>
    <b class="xb2"></b>
    <b class="xb3"></b>
    <b class="xb4"></b>
</b>
<div class="xboxcontent">
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
    <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">アルバム一覧</span></td>
    </tr>
</table>
<div align="left" style="padding:3px;" class="bg_02 border_01">
({if $album_subject_list[0]})
({foreach from=$album_subject_list item=item})
<div><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">
<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$item.subject|t_truncate:15})</a></div>
({/foreach})
({else})
・アルバムは存在しません。
({/if})
</div>
</div>
<b class="xbottom">
    <b class="xb4"></b>
    <b class="xb3"></b>
    <b class="xb2"></b>
    <b class="xb1"></b>
</b>
</div>    
</td>
</tr>
</table>
<img src="./skin/dummy.gif" class="v_spacer_l">
*********************************************})
({*/if*})

({*kazuki アルバムのタグ機能削除のため*})
({*
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
*})
<img src="./skin/dummy.gif" class="v_spacer_l">

({*kazuki diary_listからのコピペのこり？*})
({*
({if $date_list})
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})
*})

({*kazuki アルバムのカテゴリ機能削除*})
({*
({if $category_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;"  id="main_image_and_name">
    <tr>
        <td align="center">
            <div id="xsnazzy">
            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
            <div class="xboxcontent">
            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
                <tr>
                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.group_blog})({$ltag.list})</span></td>
                </tr>
            </table>
            <div align="left" class="bg_02 border_01 padding_ss">
            ({foreach from=$category_list item=category_item})
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
*})



({*ext_include file="inc_layoutcolumn_middle_165px.tpl"*})




({**********************************************
({if $type == "h"})
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
    <tr>
        <td>
            <div id="xsnazzy">
            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
            <div class="xboxcontent">
                <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
                    <tr>
                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
                    ({$ltag.my_photo})</span></td>
                    </tr>
                </table>
                <div class="border_01 bg_09" align="center">
                    <img src="./skin/dummy.gif" class="v_spacer_l">
                    
                    <div style="width:490px;padding:30px 10px;margin:0px auto;" class="border_01 bg_03">
                        ({t_form _method=get m=pc a=page_h_album_add})
                        &nbsp;&nbsp;&nbsp;<input type="submit" class="submit" value="アルバムを追加">
                        </form>
                    </div>
                    
                    <img src="./skin/dummy.gif" class="v_spacer_l">
                    <div style="width:490px;padding:5px;margin:0px auto;text-align:right;" class="border_01 bg_03">
                    ({t_form _method=get m=pc a=page_fh_album_list})
                    ({$ltag.keywords}):<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
                    <input type="text" size="15" name="keyword" class="text border_01" value="({$keyword})">
                    <input type="submit" class="submit_s" value="({$ltag.Retrieval})">
                    </form>
                    </div>
                    <img src="./skin/dummy.gif" class="v_spacer_l">
                </div>    
            </div>
            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
            </div>    
        </td>
    </tr>
</table>
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})
**********************************************})

({********************************************
({if $target_album_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td>
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">

<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
    <tr>
    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
    <td style="padding:2px 0px;" class="bg_06">
    <span class="b_b c_00">
    ({$target_member.nickname})({$smarty.const.NAME_TAIL})({$ltag.album_of})
    </span>
    </td>
    </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    <tr>
        <td style="width:524px;" class="bg_02" align="right" valign="middle">
        <div style="padding:4px 3px;">
        ({if $is_prev})
        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Forward})</a>
        ({/if})
        ({$page*$page_size-$page_size+1})-
        ({if $page_size > $album_list_count})
        ({$album_list_count+$page*$page_size-$page_size})
        ({else})
        ({$page*$page_size})
        ({/if})
        ({if $is_next})
        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Next})</a>
        ({/if})
        </div>
        </td>
    </tr>
</table>
({foreach from=$target_album_list item=item})
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    <tr>
        <td style="width:190px;padding:4px;" valign=top rowspan=13 align="center" class="bg_02">
        ({if $item.album_cover_image})
        <div>
        <span class="padding_s">
        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_album_url filename=$item.album_cover_image w=180 h=180})"></a>
        </span>
        </div>
        ({/if})
        </td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.album_Title|t_truncate:40})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">({$item.subject|t_truncate:40})</td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.note_album})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">({$item.description|t_truncate:40|nl2br})</td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.group_blog})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">
        ({foreach from=$item.category item=category_name})
        ({$category_name.category_name})
        ({/foreach})
        </td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.open_range})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">
        <div style="padding:3px 2px;">
        ({if $item.public_flag == "public"})
        ({$ltag.album_public})
        ({elseif $item.public_flag == "friend"})
        ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
        ({elseif $item.public_flag == "private"})
        ({$ltag.not_open})&nbsp;&nbsp;({$ltag.album_has_pwd})
        ({/if})
        </div>
        </td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    ({if $item.public_flag=="public"})
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.voice_mail})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td colspan="2" class="bg_02" style="width:240px;padding:4px;"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})&amp;comment_count=({$item.num_comment})#write">(({$item.num_comment}))({$ltag.album_message})</a></td>
    </tr>
    ({/if})
    <tr>
        <td style="height:1px;" class="bg_01" colspan=5>
        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
        </td>
    </tr>
    
    <tr>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.h_album_create_date})</td>
        <td style="width:1px;" class="bg_01">
        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
        </td>
        <td class="bg_02" style="padding:4px; " NOWRAP>({$item.r_datetime|date_format:"%m-%d-%Y %H:%M"})</td>
        <td align="center" class="bg_01"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" /></a></td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" style="height:6px;width:524px; " class="border_01"><tr><td></td></tr></table>
({/foreach})


<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
    <tr>
        <td style="width:524px;" class="bg_02" align="right" valign="middle">
        <div style="padding:4px 3px;">
        ({if $is_prev})
        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_forward})</a>
        ({/if})
        ({$page*$page_size-$page_size+1})-
        ({if $page_size > $album_list_count})
        ({$album_list_count+$page*$page_size-$page_size})
        ({else})
        ({$page*$page_size})
        ({/if})
        ({if $is_next})
        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_backward})</a>
        ({/if})
        </div>
        </td>
    </tr>
</table>

</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})

*})

({*ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"*})
({*ext_include file="inc_footer.tpl"*})
