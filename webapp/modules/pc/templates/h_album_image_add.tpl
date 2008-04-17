<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真を追加する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_image_add_confirm})
<table>
<tr>
<th>アルバム名</th>
<td>
({$album_subject})
</td>
</tr>
<tr>
<th>写真１</th>
<td>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>写真１説明</th>
<td>
<input type="text" class="text" name="image_description1" value="({$form_val.image_description1})" size="40">
</td>
</tr>
<tr>
<th>写真２</th>
<td>
<input type="file" class="input_file" name="upfile_2" size="40" />
</td>
</tr>
<tr>
<th>写真２説明</th>
<td>
<input type="text" class="text" name="image_description2" value="({$form_val.image_description2})" size="40">
</td>
</tr>
<tr>
<th>写真３</th>
<td>
<input type="file" class="input_file" name="upfile_3" size="40" />
</td>
</tr>
<tr>
<th>写真３説明</th>
<td>
<input type="text" class="text" name="image_description3" value="({$form_val.image_description3})" size="40">
</td>
</tr>
<tr>
<th>写真４</th>
<td>
<input type="file" class="input_file" name="upfile_4" size="40" />
</td>
</tr>
<tr>
<th>写真４説明</th>
<td>
<input type="text" class="text" name="image_description4" value="({$form_val.image_description4})" size="40">
</td>
</tr>
<tr>
<th>写真５</th>
<td>
<input type="file" class="input_file" name="upfile_5" size="40" />
</td>
</tr>
<tr>
<th>写真５説明</th>
<td>
<input type="text" class="text" name="image_description5" value="({$form_val.image_description5})" size="40">
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="subject" value="({$album_subject})" />
<input type="submit" class="input_submit" value="確認画面" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_fh_album})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>
</div> <!-- dparts formTable -->
</div> <!-- partsHeading -->


</div><!-- Center -->
</div><!-- LayoutC -->

({* unknown *})({*************************
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
({* unknown *})    <tr>
({* unknown *})        <td align="center">
({* unknown *})            <div id="xsnazzy">
({* unknown *})            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})            <div class="xboxcontent">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
({* unknown *})                <tr>
({* unknown *})                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.recent_messages})</span></td>
({* unknown *})                </tr>
({* unknown *})            </table>
({* unknown *})            <div align="left" class="bg_02 border_01 padding_ss">
({* unknown *})            <a href="({t_url m=pc a=page_fh_album_comment_list})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_1">({$ltag.voice_mail})({$ltag.list})</a>
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
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" id="main_image_and_name">
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
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})({ext_include file="inc_layoutcolumn_middle_165px.tpl"})
({* unknown *})
({* unknown *})({t_form _enctype=file m=pc a=page_h_album_image_add_confirm})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;"class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.apa})</span></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* unknown *})        ({if $inc_entry_point[3]})
({* unknown *})    
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        ({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    ({/if})
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        ({$ltag.pca})
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <select name="target_c_album_id">
({* unknown *})        <option value="({$album_subject.c_album_id})">({$album_subject.subject})
({* unknown *})        </select>
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        &nbsp;&nbsp;&nbsp;&nbsp;({$ltag.pup})</div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_1})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="file" name="upfile_1">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_1})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input size="40" type="text" name="image_description1" class="text" value="({$form_val.image_description1})">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_2})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="file" name="upfile_2">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_2})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input size="40" type="text" name="image_description2" class="text" value="({$form_val.image_description2})">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_3})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="file" name="upfile_3">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_3})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input size="40" type="text" name="image_description3" class="text" value="({$form_val.image_description3})">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_4})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="file" name="upfile_4">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_4})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input size="40" type="text" name="image_description4" class="text" value="({$form_val.image_description4})">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_5})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="file" name="upfile_5">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:80px;" class="bg_02" align="center" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        ({$ltag.photo_5})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td style="width:439px;" class="bg_02" align="left" valign="middle">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input size="40" type="text" name="image_description5" class="text" value="({$form_val.image_description5})">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        <td class="bg_02" align="center" colspan="3">
({* unknown *})        <div style="padding:4px 3px;">
({* unknown *})        <input type="hidden" name="subject" value="({$album_subject.subject})" >
({* unknown *})        <input type="submit" class="submit" value="　({$ltag.confirmed})　">
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</form>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_780px.tpl"})
({* unknown *})-->
({* unknown *})*******************************})
({* unknown *})
({* unknown *})({*ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"*})
({* unknown *})({*ext_include file="inc_footer.tpl"*})
