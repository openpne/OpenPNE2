<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>編集：({$album.subject})</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_cover_edit_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<table>
<tr>
<th>タイトル</th>
<td>
<input type="text" class="input_text" name="subject" value="({$album.subject})" size="50" />
</td>
</tr>
<tr>
<th>アルバム説明</th>
<td>
<textarea name="description" rows="6" cols="50">({$album.description})</textarea>
</td>
</tr>
<tr>
<th>表紙</th>
<td>
({if $album.album_cover_image})
<a href="({t_img_album_url filename=$album.album_cover_image})" target="_blank"><img src="({t_img_album_url filename=$album.album_cover_image w=180 h=180})"></a><br>({else})
({/if})
<input type="hidden" name="pre_image_filename" value="({$album.album_cover_image})" />
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_public" value="public"({if $album.public_flag == "public"}) checked="checked"({/if}) /><label for="public_flag_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_friend" value="friend"({if $album.public_flag == "friend"}) checked="checked"({/if}) /><label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_private" value="private"({if $album.public_flag == "private"}) checked="checked"({/if}) /><label for="public_flag_private">公開しない</label></li>
</ul>
</td>
</tr>
</table> 
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div> <!-- parts -->
</div> <!-- dparts formTable -->

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>アルバムを削除する</h3></div>
<div class="partsInfo">
<p>アルバムを削除するとこのアルバムに投稿された画像もすべて削除されます。</p>
</div>
({t_form_block m=pc a=page_h_delete_album})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<table>
<tr><th>日付</th><td>({$album.r_datetime|date_format:"%Y年%m月%d日"})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>


</div><!-- Center -->
</div><!-- LayoutC -->

({* unknown *})({***************************
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" >
({* unknown *})<tr>
({* unknown *})<td align="center" valign="top">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})        <tr>
({* unknown *})            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.recent_Album})</span></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})<div align="left" style="padding:3px;" class="bg_02 border_01">
({* unknown *})({foreach from=$new_album_subject_list item=item})
({* unknown *})<div><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">
({* unknown *})<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_3">({$item.subject|t_truncate:15})</a></div>
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
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
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
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})
({* unknown *})({t_form _enctype=file m=pc a=page_h_album_cover_edit_confirm})
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
({* unknown *})<input type="hidden" name="del_img" value="({$del_img})">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})        <tr>
({* unknown *})            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* unknown *})            ({$ltag.editor})({$ltag.ablum}):({$album.subject|t_truncate:50})</span></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:85px;" class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.album})({$ltag.title})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <input type="text" class="text" size="40" name="subject" value="({$album.subject})">
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.album_cover}) 
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <input type="hidden" name="pre_image_filename" value="({$album.album_cover_image})">
({* unknown *})            <a href="({t_img_album_url filename=$album.album_cover_image})" target="_blank"><img src="({t_img_album_url filename=$album.album_cover_image w=220 h=220})"></a><br>
({* unknown *})            
({* unknown *})            <input type="file" size="40"  name="upfile_1">
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">({$ltag.album})({$ltag.description})</div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <textarea class="text" name="description" rows="3" cols="15" style="width:415px">({$album.description})</textarea> 
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        ({if $use_album_category})
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.group_blog})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <input type="text" name="category" id="category" size="40" value="({foreach from=$category item=item})({$item.category_name}) ({/foreach})">
({* unknown *})            <select onChange="if(selectedIndex){category.value += options[selectedIndex].value + ' '}">
({* unknown *})            <option>({$ltag.h_album_add_confirm_choose_category})
({* unknown *})            ({foreach from=$category_list item=value})
({* unknown *})            <option value="({$value.category_name})">({$value.category_name})
({* unknown *})            ({/foreach})
({* unknown *})            </select>
({* unknown *})            <br>
({* unknown *})            ※({$ltag.h_album_add_confirm_name})<br>
({* unknown *})            ※({$ltag.h_album_add_confirm_login})<br>
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        ({/if})
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.open_range})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <input type="radio" name="public_flag" value="public"({if $album.public_flag == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_public" onClick="showadv();"><label for="public_flag_public">({$ltag.album_public})</label><br>
({* unknown *})            <input type="radio" name="public_flag" value="friend"({if $album.public_flag == "friend"}) checked="checked"({/if}) class="no_bg" id="public_flag_friend" onClick="hideadv();"><label for="public_flag_friend">({$ltag.album_friends})</label><br>
({* unknown *})            <input type="radio" name="public_flag" value="private"({if $album.public_flag == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_private" onClick="hideadv();"><label for="public_flag_private">({$ltag.not_open}) (({$ltag.h_album_add_authorize})) </label><br>
({* unknown *})            <input type="text" name="album_pwd" value="({$album.album_pwd})"> <font color="#999999"> ({$ltag.h_album_add_pwd_describe})</font>
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        
({* unknown *})        <tr id="selective" ({if $album.public_flag != "public"}) style="display:none" ({else}) style="display: " ({/if})>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.h_album_add_commu_choose})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <select name="target_c_commu_id">
({* unknown *})            <option value="">({$ltag.h_album_add_commu_choose_list})</option>
({* unknown *})            ({foreach from=$commu_list item=item})
({* unknown *})            <option value="({$item.c_commu_id})" ({if $album.c_commu_id == $item.c_commu_id}) selected="selected" ({/if})>({$item.name})</option>
({* unknown *})            ({/foreach})
({* unknown *})            </select>
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" colspan="3">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            <input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
({* unknown *})            <input type="submit" class="submit" value="({$ltag.editor})({$ltag.ablum})"></div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</form>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})        <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.album_delete_album})</span></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:95px;" class="bg_02" align="center" valign="middle" rowspan="3">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.h_album_add_confirm_date})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:426px;" class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$album.r_datetime|date_format:"%m-%d-%Y"})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({$ltag.album_delete_album})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td class="bg_02" align="center" colspan="3">
({* unknown *})            <div style="padding:4px 3px;">
({* unknown *})            ({t_form m=pc a=page_h_delete_album})
({* unknown *})            <input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
({* unknown *})            <input type="submit" class="submit" value="({$ltag.delete})">
({* unknown *})            </form>
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})<script type="text/javascript">
({* unknown *})<!--
({* unknown *})function showadv() {
({* unknown *})    var advobj = document.getElementById("selective");
({* unknown *})    advobj.style.display = "";
({* unknown *})    
({* unknown *})    /*var advobj = document.getElementById("selective");    
({* unknown *})    if (document.myform.public_flag_public.checked == false) {
({* unknown *})        advobj.style.display = "none";
({* unknown *})    } else {
({* unknown *})        advobj.style.display = "block";
({* unknown *})    }*/
({* unknown *})}
({* unknown *})
({* unknown *})function hideadv() {
({* unknown *})    var advobj = document.getElementById("selective");
({* unknown *})    advobj.style.display = "none";
({* unknown *})}
({* unknown *})-->
({* unknown *})</script>
({* unknown *})***************************})
