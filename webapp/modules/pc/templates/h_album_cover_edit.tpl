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

({***************************
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;" >
<tr>
<td align="center" valign="top">
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
<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_3">({$item.subject|t_truncate:15})</a></div>
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

<img src="./skin/dummy.gif" class="v_spacer_l">

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


({t_form _enctype=file m=pc a=page_h_album_cover_edit_confirm})
<input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
<input type="hidden" name="del_img" value="({$del_img})">
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td align="center">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
        <tr>
            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">
            ({$ltag.editor})({$ltag.ablum}):({$album.subject|t_truncate:50})</span></td>
        </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
        <tr>
            <td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:85px;" class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.album})({$ltag.title})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:439px;" class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <input type="text" class="text" size="40" name="subject" value="({$album.subject})">
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.album_cover}) 
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <input type="hidden" name="pre_image_filename" value="({$album.album_cover_image})">
            <a href="({t_img_album_url filename=$album.album_cover_image})" target="_blank"><img src="({t_img_album_url filename=$album.album_cover_image w=220 h=220})"></a><br>
            
            <input type="file" size="40"  name="upfile_1">
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:80px;" class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">({$ltag.album})({$ltag.description})</div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:439px;" class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <textarea class="text" name="description" rows="3" cols="15" style="width:415px">({$album.description})</textarea> 
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        ({if $use_album_category})
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.group_blog})
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <input type="text" name="category" id="category" size="40" value="({foreach from=$category item=item})({$item.category_name}) ({/foreach})">
            <select onChange="if(selectedIndex){category.value += options[selectedIndex].value + ' '}">
            <option>({$ltag.h_album_add_confirm_choose_category})
            ({foreach from=$category_list item=value})
            <option value="({$value.category_name})">({$value.category_name})
            ({/foreach})
            </select>
            <br>
            ※({$ltag.h_album_add_confirm_name})<br>
            ※({$ltag.h_album_add_confirm_login})<br>
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        ({/if})
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.open_range})
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <input type="radio" name="public_flag" value="public"({if $album.public_flag == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_public" onClick="showadv();"><label for="public_flag_public">({$ltag.album_public})</label><br>
            <input type="radio" name="public_flag" value="friend"({if $album.public_flag == "friend"}) checked="checked"({/if}) class="no_bg" id="public_flag_friend" onClick="hideadv();"><label for="public_flag_friend">({$ltag.album_friends})</label><br>
            <input type="radio" name="public_flag" value="private"({if $album.public_flag == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_private" onClick="hideadv();"><label for="public_flag_private">({$ltag.not_open}) (({$ltag.h_album_add_authorize})) </label><br>
            <input type="text" name="album_pwd" value="({$album.album_pwd})"> <font color="#999999"> ({$ltag.h_album_add_pwd_describe})</font>
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        
        <tr id="selective" ({if $album.public_flag != "public"}) style="display:none" ({else}) style="display: " ({/if})>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="center" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.h_album_add_commu_choose})
            </div>
            </td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            <select name="target_c_commu_id">
            <option value="">({$ltag.h_album_add_commu_choose_list})</option>
            ({foreach from=$commu_list item=item})
            <option value="({$item.c_commu_id})" ({if $album.c_commu_id == $item.c_commu_id}) selected="selected" ({/if})>({$item.name})</option>
            ({/foreach})
            </select>
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
            <input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
            <input type="submit" class="submit" value="({$ltag.editor})({$ltag.ablum})"></div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;">
<tr>
<td align="center">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
    
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="bg_11">
        <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.album_delete_album})</span></td>
        </tr>
    </table>
    
    <table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
        <tr>
            <td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:95px;" class="bg_02" align="center" valign="middle" rowspan="3">
            <div style="padding:4px 3px;">
            ({$ltag.h_album_add_confirm_date})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="width:426px;" class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            ({$album.r_datetime|date_format:"%m-%d-%Y"})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="left" valign="middle">
            <div style="padding:4px 3px;">
            ({$ltag.album_delete_album})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
        </tr>
        <tr>
            <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
            <td class="bg_02" align="center" colspan="3">
            <div style="padding:4px 3px;">
            ({t_form m=pc a=page_h_delete_album})
            <input type="hidden" name="target_c_album_id" value="({$album.c_album_id})">
            <input type="submit" class="submit" value="({$ltag.delete})">
            </form>
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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

<img src="./skin/dummy.gif" class="v_spacer_l">
<script type="text/javascript">
<!--
function showadv() {
    var advobj = document.getElementById("selective");
    advobj.style.display = "";
    
    /*var advobj = document.getElementById("selective");    
    if (document.myform.public_flag_public.checked == false) {
        advobj.style.display = "none";
    } else {
        advobj.style.display = "block";
    }*/
}

function hideadv() {
    var advobj = document.getElementById("selective");
    advobj.style.display = "none";
}
-->
</script>
***************************})
