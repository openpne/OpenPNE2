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

({*************************
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" class="bg_02" id="main_image_and_name">
    <tr>
        <td align="center">
            <div id="xsnazzy">
            <b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
            <div class="xboxcontent">
            <table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="bg_11">
                <tr>
                    <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
                    <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.recent_messages})</span></td>
                </tr>
            </table>
            <div align="left" class="bg_02 border_01 padding_ss">
            <a href="({t_url m=pc a=page_fh_album_comment_list})"><img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_1">({$ltag.voice_mail})({$ltag.list})</a>
            </div>
            </div>
            <b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
            </div>    
        </td>
    </tr>
</table>

<img src="./skin/dummy.gif" class="v_spacer_l">

({if $date_list})
<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})

({if $category_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" id="main_image_and_name">
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

({ext_include file="inc_layoutcolumn_middle_165px.tpl"})

({t_form _enctype=file m=pc a=page_h_album_image_add_confirm})
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td align="center">

<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">

<table border="0" cellspacing="0" cellpadding="0" style="width:524px;"class="bg_11">
    <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.apa})</span></td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
        ({if $inc_entry_point[3]})
    
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        ({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    ({/if})
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        ({$ltag.pca})
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <select name="target_c_album_id">
        <option value="({$album_subject.c_album_id})">({$album_subject.subject})
        </select>
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        &nbsp;&nbsp;&nbsp;&nbsp;({$ltag.pup})</div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_1})
        </div>
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input type="file" name="upfile_1">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_1})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input size="40" type="text" name="image_description1" class="text" value="({$form_val.image_description1})">
        </div>
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_2})
        </div>
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input type="file" name="upfile_2">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_2})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input size="40" type="text" name="image_description2" class="text" value="({$form_val.image_description2})">
        </div>
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_3})
        </div>
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input type="file" name="upfile_3">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_3})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input size="40" type="text" name="image_description3" class="text" value="({$form_val.image_description3})">
        </div>
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_4})
        </div>
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input type="file" name="upfile_4">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_4})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input size="40" type="text" name="image_description4" class="text" value="({$form_val.image_description4})">
        </div>
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_5})
        </div>
        </td>
        <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input type="file" name="upfile_5">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:80px;" class="bg_02" align="center" valign="middle">
        <div style="padding:4px 3px;">
        ({$ltag.photo_5})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td style="width:439px;" class="bg_02" align="left" valign="middle">
        <div style="padding:4px 3px;">
        <input size="40" type="text" name="image_description5" class="text" value="({$form_val.image_description5})">
        </div>
        </td>
        <td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
    </tr>
    <tr>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        <td class="bg_02" align="center" colspan="3">
        <div style="padding:4px 3px;">
        <input type="hidden" name="subject" value="({$album_subject.subject})" >
        <input type="submit" class="submit" value="　({$ltag.confirmed})　">
        </div>
        </td>
        <td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- delete by openkaku team on 080313
({ext_include file="inc_layoutcolumn_middle_780px.tpl"})
-->
*******************************})

({*ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"*})
({*ext_include file="inc_footer.tpl"*})
