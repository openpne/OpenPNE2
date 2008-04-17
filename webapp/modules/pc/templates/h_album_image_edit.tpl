
<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真を編集する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_image_edit_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image_id})" />
<input type="hidden" name="pre_image_filename" value="({$c_album_image.image_filename})" />
<table>
<tr>
<th>画像</th>
<td>
<a href="({t_img_album_url filename=$c_album_image.image_filename})" target="_blank">
<img src="({t_img_album_url filename=$c_album_image.image_filename w=180 h=180})"></a><br>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>写真説明</th>
<td>
<input type="text" class="input_text" name="image_description" value="({$c_album_image.image_description})" size="50" />
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
<div class="partsHeading"><h3>画像を削除する</h3></div>
({t_form_block m=pc a=page_h_album_image_delete_confirm})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image_id})" />
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>


</div><!-- Center -->
</div><!-- LayoutC -->

({* unknown *})({*************************
({* unknown *})({ext_include file="inc_header.tpl"})
({* unknown *})({ext_include file="inc_layoutcolumn_top_165px.tpl"})
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tlm})</span></td>
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
({* unknown *})({if $date_list})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $category_list})
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;"  id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.group_blog})({$ltag.list})</span></td>
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
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})({ext_include file="inc_layoutcolumn_middle_165px.tpl"})
({* unknown *})({t_form _enctype=file m=pc a=do_h_album_image_edit_insert_c_album_image})
({* unknown *})<input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$c_album_id})">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})<td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.editor})({$ltag.photo})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})※({$ltag.album_notice})：</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})({$ltag.album_one})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">({$ltag.album_cover})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})<input type="hidden" name="pre_image_filename" value="({$album_cover.album_cover_image})">
({* unknown *})<a href="({t_img_album_url filename=$album_cover.album_cover_image})"><img src="({t_img_album_url filename=$album_cover.album_cover_image w=120 h=120})"></a><br>
({* unknown *})<a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album.0.c_album_id})&amp;del_img=1&amp;sessid=({$PHPSESSID})">({$ltag.editor})</a><br>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})({foreach from=$album key=key item=album_item})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({$ltag.photo})<br />
({* unknown *})<a href="({t_url m=pc a=page_h_delete_album_image_confirm})&amp;target_c_album_id=({$album_item.c_album_id})&amp;target_c_album_image_id=({$album_item.c_album_image_id})&amp;del_img=1&amp;sessid=({$PHPSESSID})">({$ltag.delete})</a>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({if $album_item.image_filename && !($del_img & 0x01)})
({* unknown *})<input type="hidden" name="pre_image_filename" value="({$album_item.image_filename})">
({* unknown *})<input type="hidden" name="target_c_album_image_id[]" value="({$album_item.c_album_image_id})">
({* unknown *})<span style="padding:4px; "><a href="({t_img_album_url filename=$album_item.image_filename})" target="_blank"><img src="({t_img_album_url filename=$album_item.image_filename w=120 h=120})"></a></span><br>
({* unknown *})<input type="file" size="40"  name="upfile_({$key})">
({* unknown *})<br>
({* unknown *})({/if})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({$ltag.album})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})<input type="text" size="43" name="image_description[]" value="({$album_item.image_description})">
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<input type="hidden" name="key" value="({$key})">
({* unknown *})({/foreach})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle" colspan="3" style="padding:4px; ">
({* unknown *})<input type="submit" class="submit" value="({$ltag.editor})({$ltag.ablum})">
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
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
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})<td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.album_delete_album})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:95px;" class="bg_02" align="center" valign="middle" rowspan="3">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({$ltag.h_album_add_confirm_date})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:424px;" class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({$album.r_datetime|date_format:"%m-%d-%Y"})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({$ltag.h_album_add_confirm_delete_album})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" colspan="3">
({* unknown *})<div style="padding:4px 3px;">
({* unknown *})({t_form m=pc a=page_h_delete_album})
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$album.0.c_album_id})">
({* unknown *})<input type="submit" class="submit" value="({$ltag.delete})">
({* unknown *})</form>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_780px.tpl"})
({* unknown *})-->
({* unknown *})({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({* unknown *})({ext_include file="inc_footer.tpl"})
({* unknown *})*************************})