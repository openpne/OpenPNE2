<div id="LayoutC">
<div id="Center">

<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>以下の写真を削除しますか？</h3></div>

<table>
<tr>
<td>
<img SRC="({t_img_album_url filename=$target_c_album_image.image_filename w=180 h=180})" ALT="photo" VSPACE="4">
<br>
({$target_c_album_image.image_description|nl2br|default:"&nbsp;"})<br>
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_edit_delete_image})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value=" は い ">
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_image_edit})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="いいえ" />
({/t_form_block})
</li>
</ul>
</div> <!-- operation -->


</div> <!-- parts -->
</div> <!-- dparts formTable -->

</div><!-- Center -->
</div><!-- LayoutC -->
({* unknown *})({**************************
({* unknown *})
({* unknown *})({ext_include file="inc_header.tpl"})
({* unknown *})({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="bg_11">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})<td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.dtfp})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:508px;" class="bg_02" align="center" valign="middle">
({* unknown *})<div style="padding:10px;" class="lh_120">
({* unknown *})({if $target_c_album_image.image_filename})
({* unknown *})<a href="({t_img_album_url filename=$target_c_album_image.image_filename})&amp;target_c_member_id=({$target_album_comment.c_member_id})"><img SRC="({t_img_album_url filename=$target_c_album_image.image_filename w=180 h=180})" ALT="photo" VSPACE=4></a>
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})<br>
({* unknown *})({$target_c_album_image.image_description|nl2br|default:"&nbsp;"})<br>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:634px;" class="bg_02" align="center" valign="middle" >
({* unknown *})<div style="text-align:center;" align="center" class="padding_w_s">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:2em;">
({* unknown *})    <tr>
({* unknown *})    <td style="width:50%;text-align:right;">
({* unknown *})    ({t_form m=pc a=do_h_album_edit_delete_image})
({* unknown *})    <input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})    <input type="hidden" name="target_c_album_id" value="({$target_c_album_image.c_album_id})">
({* unknown *})    <input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image.c_album_image_id})">
({* unknown *})    <input type="submit" class="submit" value=" ({$ltag.yes}) ">&nbsp;
({* unknown *})    </form>
({* unknown *})    </td>
({* unknown *})    <td style="width:50%;text-align:left;">
({* unknown *})    ({t_form _method=get m=pc a=page_h_album_edit})
({* unknown *})    <input type="hidden" name="target_c_album_id" value="({$target_c_album_image.c_album_id})">
({* unknown *})    &nbsp;<input type="submit" class="submit" value=" ({$ltag.no}) ">
({* unknown *})    </form>
({* unknown *})    </td>
({* unknown *})    </tr>
({* unknown *})    </table>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</div>    
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</form>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
({* unknown *})-->
({* unknown *})({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({* unknown *})({ext_include file="inc_footer.tpl"})
({* unknown *})*****************************})