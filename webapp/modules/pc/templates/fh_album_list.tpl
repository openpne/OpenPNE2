({* unknown *})<div id="LayoutB">
({* unknown *})
({* unknown *})({if $type == 'h'})
({* unknown *})({* {{{ searchFormLine *})
({* unknown *})<div class="parts searchFormLine">
({* unknown *})({t_form_block _method=get m=pc a=page_fh_album_list})
({* unknown *})<ul>
({* unknown *})<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
({* unknown *})<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
({* unknown *})<li><input type="submit" class="input_submit" value="アルバム検索" /></li>
({* unknown *})</ul>
({* unknown *})({/t_form_block})
({* unknown *})</div>
({* unknown *})({* }}} *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})<div id="Left">
({* unknown *})
({* unknown *})<div class="parts sideNav">
({* unknown *})({*ここから：最新のアルバム*})
({* unknown *})<div class="item listCategory">
({* unknown *})<div class="partsHeading"><h3>最新のアルバム</h3></div>
({* unknown *})<ul class="list">
({* unknown *})({foreach from=$target_album_subject_list item=item})
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
({* unknown *})({*ここから：アルバムを追加*})
({* unknown *})({if $type == "h"})
({* unknown *})({* {{{ infoButtonBox *})
({* unknown *})<div class="dparts infoButtonBox"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>マイアルバム</h3></div>
({* unknown *})<div class="block">
({* unknown *})({t_form_block _method=get m=pc a=page_h_album_add})
({* unknown *})<ul class="moreInfo button">
({* unknown *})<li><input type="submit" class="input_submit" value="アルバムを追加" /></li>
({* unknown *})</ul>
({* unknown *})({/t_form_block})
({* unknown *})</div>
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})({/if})
({* unknown *})({*ここまで：アルバムを追加*})
({* unknown *})
({* unknown *})({*ここから：アルバム一覧*})
({* unknown *})({if $target_album_list})
({* unknown *})<div class="dparts commentList">
({* unknown *})<div class="parts">
({* unknown *})
({* unknown *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
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
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div> <!-- pagerRelative -->
({* unknown *})
({* unknown *})({foreach from=$target_album_list item=item})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td style="width:190px;padding:2px;" valign="top" rowspan="9" align="center" class="bg_02">
({* unknown *})        <span class="padding_s">
({* unknown *})            <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_album_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})"></a>
({* unknown *})        </span>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">タイトル</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.subject})</td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5">
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">アルバムの説明</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.description})</td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5">
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">公開範囲</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan=2 class="bg_02" style="width:240px;padding:2px;">
({* unknown *})        <div style="padding:3px 2px;">
({* unknown *})        ({if $item.public_flag == "public"})
({* unknown *})        （全員に公開）
({* unknown *})        ({elseif $item.public_flag == "friend"})
({* unknown *})        （({$WORD_MY_FRIEND})まで公開）
({* unknown *})        ({elseif $item.public_flag == "private"})
({* unknown *})        （公開しない）
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">作成日時</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" style="padding:2px;">({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
({* unknown *})        <td align="center" class="bg_02"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" /></a></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})({/foreach})
({* unknown *})</table>
({* unknown *})
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
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
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div> <!-- pagerRelative -->
({* unknown *})
({* unknown *})</div> <!-- dparts commentList -->
({* unknown *})</div> <!-- parts -->
({* unknown *})({/if})
({* unknown *})({*ここまで：アルバム一覧*})
({* unknown *})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutB -->
({* unknown *})
({* unknown *})
({* unknown *})({*if $album_subject_list*})
({* unknown *})({***********************************************
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" >
({* unknown *})<tr>
({* unknown *})<td align="center" valign="top">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop">
({* unknown *})    <b class="xb1"></b>
({* unknown *})    <b class="xb2"></b>
({* unknown *})    <b class="xb3"></b>
({* unknown *})    <b class="xb4"></b>
({* unknown *})</b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">アルバム一覧</span></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<div align="left" style="padding:3px;" class="bg_02 border_01">
({* unknown *})({if $album_subject_list[0]})
({* unknown *})({foreach from=$album_subject_list item=item})
({* unknown *})<div><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">
({* unknown *})<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_2">({$item.subject|t_truncate:15})</a></div>
({* unknown *})({/foreach})
({* unknown *})({else})
({* unknown *})・アルバムは存在しません。
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})</div>
({* unknown *})<b class="xbottom">
({* unknown *})    <b class="xb4"></b>
({* unknown *})    <b class="xb3"></b>
({* unknown *})    <b class="xb2"></b>
({* unknown *})    <b class="xb1"></b>
({* unknown *})</b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})*********************************************})
({* unknown *})({*/if*})
({* unknown *})
({* unknown *})({*kazuki アルバムのタグ機能削除のため*})
({* unknown *})({*
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
({* unknown *})<tr>
({* unknown *})    <td align="center">
({* unknown *})        <div id="xsnazzy">
({* unknown *})        <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})        <div class="xboxcontent">
({* unknown *})        <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})            <tr>
({* unknown *})                <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tlm})</span></td>
({* unknown *})            </tr>
({* unknown *})        </table>
({* unknown *})        <div align="left" class="bg_02 border_01 padding_ss">
({* unknown *})        <a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_1">({$ltag.voice_mail})({$ltag.list})</a>
({* unknown *})        </div>
({* unknown *})        </div>
({* unknown *})        <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})        </div>    
({* unknown *})    </td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})*})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({*kazuki diary_listからのコピペのこり？*})
({* unknown *})({*
({* unknown *})({if $date_list})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})*})
({* unknown *})
({* unknown *})({*kazuki アルバムのカテゴリ機能削除*})
({* unknown *})({*
({* unknown *})({if $category_list})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;"  id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.group_blog})({$ltag.list})</span></td>
({* unknown *})                </tr>
({* unknown *})            </table>
({* unknown *})            <div align="left" class="bg_02 border_01 padding_ss">
({* unknown *})            ({foreach from=$category_list item=category_item})
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
({* unknown *})*})
({* unknown *})
({* unknown *})
({* unknown *})
({* unknown *})({*ext_include file="inc_layoutcolumn_middle_165px.tpl"*})
({* unknown *})
({* unknown *})
({* unknown *})
({* unknown *})
({* unknown *})({**********************************************
({* unknown *})({if $type == "h"})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})    <tr>
({* unknown *})        <td>
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})                <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})                    <tr>
({* unknown *})                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* unknown *})                    ({$ltag.my_photo})</span></td>
({* unknown *})                    </tr>
({* unknown *})                </table>
({* unknown *})                <div class="border_01 bg_09" align="center">
({* unknown *})                    <img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})                    
({* unknown *})                    <div style="width:490px;padding:30px 10px;margin:0px auto;" class="border_01 bg_03">
({* unknown *})                        ({t_form _method=get m=pc a=page_h_album_add})
({* unknown *})                        &nbsp;&nbsp;&nbsp;<input type="submit" class="submit" value="アルバムを追加">
({* unknown *})                        </form>
({* unknown *})                    </div>
({* unknown *})                    
({* unknown *})                    <img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})                    <div style="width:490px;padding:5px;margin:0px auto;text-align:right;" class="border_01 bg_03">
({* unknown *})                    ({t_form _method=get m=pc a=page_fh_album_list})
({* unknown *})                    ({$ltag.keywords}):<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
({* unknown *})                    <input type="text" size="15" name="keyword" class="text border_01" value="({$keyword})">
({* unknown *})                    <input type="submit" class="submit_s" value="({$ltag.Retrieval})">
({* unknown *})                    </form>
({* unknown *})                    </div>
({* unknown *})                    <img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})                </div>    
({* unknown *})            </div>
({* unknown *})            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})            </div>    
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})**********************************************})
({* unknown *})
({* unknown *})({********************************************
({* unknown *})({if $target_album_list})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td>
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})    <td style="padding:2px 0px;" class="bg_06">
({* unknown *})    <span class="b_b c_00">
({* unknown *})    ({$target_member.nickname})({$smarty.const.NAME_TAIL})({$ltag.album_of})
({* unknown *})    </span>
({* unknown *})    </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td style="width:524px;" class="bg_02" align="right" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({if $is_prev})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Forward})</a>
({* unknown *})        ({/if})
({* unknown *})        ({$page*$page_size-$page_size+1})-
({* unknown *})        ({if $page_size > $album_list_count})
({* unknown *})        ({$album_list_count+$page*$page_size-$page_size})
({* unknown *})        ({else})
({* unknown *})        ({$page*$page_size})
({* unknown *})        ({/if})
({* unknown *})        ({if $is_next})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.Next})</a>
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})({foreach from=$target_album_list item=item})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td style="width:190px;padding:4px;" valign=top rowspan=13 align="center" class="bg_02">
({* unknown *})        ({if $item.album_cover_image})
({* unknown *})        <div>
({* unknown *})        <span class="padding_s">
({* unknown *})        <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_album_url filename=$item.album_cover_image w=180 h=180})"></a>
({* unknown *})        </span>
({* unknown *})        </div>
({* unknown *})        ({/if})
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.album_Title|t_truncate:40})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">({$item.subject|t_truncate:40})</td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.note_album})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">({$item.description|t_truncate:40|nl2br})</td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.group_blog})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">
({* unknown *})        ({foreach from=$item.category item=category_name})
({* unknown *})        ({$category_name.category_name})
({* unknown *})        ({/foreach})
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.open_range})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan=2 class="bg_02" style="width:240px;padding:4px;">
({* unknown *})        <div style="padding:3px 2px;">
({* unknown *})        ({if $item.public_flag == "public"})
({* unknown *})        ({$ltag.album_public})
({* unknown *})        ({elseif $item.public_flag == "friend"})
({* unknown *})        ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
({* unknown *})        ({elseif $item.public_flag == "private"})
({* unknown *})        ({$ltag.not_open})&nbsp;&nbsp;({$ltag.album_has_pwd})
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    ({if $item.public_flag=="public"})
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.voice_mail})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td colspan="2" class="bg_02" style="width:240px;padding:4px;"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})&amp;comment_count=({$item.num_comment})#write">(({$item.num_comment}))({$ltag.album_message})</a></td>
({* unknown *})    </tr>
({* unknown *})    ({/if})
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan=5>
({* unknown *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td align="left" class="bg_11" style="width:75px;padding:4px;">({$ltag.h_album_create_date})</td>
({* unknown *})        <td style="width:1px;" class="bg_01">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" style="padding:4px; " NOWRAP>({$item.r_datetime|date_format:"%m-%d-%Y %H:%M"})</td>
({* unknown *})        <td align="center" class="bg_01"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" /></a></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table cellspacing="0" cellpadding="0" style="height:6px;width:524px; " class="border_01"><tr><td></td></tr></table>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td style="width:524px;" class="bg_02" align="right" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({if $is_prev})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_forward})</a>
({* unknown *})        ({/if})
({* unknown *})        ({$page*$page_size-$page_size+1})-
({* unknown *})        ({if $page_size > $album_list_count})
({* unknown *})        ({$album_list_count+$page*$page_size-$page_size})
({* unknown *})        ({else})
({* unknown *})        ({$page*$page_size})
({* unknown *})        ({/if})
({* unknown *})        ({if $is_next})
({* unknown *})        <a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">({$ltag.album_backward})</a>
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})
({* unknown *})*})
({* unknown *})
({* unknown *})({*ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"*})
({* unknown *})({*ext_include file="inc_footer.tpl"*})
