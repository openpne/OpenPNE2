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
({**************************

({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

<img src="./skin/dummy.gif" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;">
<tr>
<td align="center">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="bg_11">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.dtfp})</span></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:508px;" class="bg_02" align="center" valign="middle">
<div style="padding:10px;" class="lh_120">
({if $target_c_album_image.image_filename})
<a href="({t_img_album_url filename=$target_c_album_image.image_filename})&amp;target_c_member_id=({$target_album_comment.c_member_id})"><img SRC="({t_img_album_url filename=$target_c_album_image.image_filename w=180 h=180})" ALT="photo" VSPACE=4></a>
({else})
&nbsp;
({/if})
<br>
({$target_c_album_image.image_description|nl2br|default:"&nbsp;"})<br>
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:634px;" class="bg_02" align="center" valign="middle" >
<div style="text-align:center;" align="center" class="padding_w_s">
    <table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:2em;">
    <tr>
    <td style="width:50%;text-align:right;">
    ({t_form m=pc a=do_h_album_edit_delete_image})
    <input type="hidden" name="sessid" value="({$PHPSESSID})">
    <input type="hidden" name="target_c_album_id" value="({$target_c_album_image.c_album_id})">
    <input type="hidden" name="target_c_album_image_id" value="({$target_c_album_image.c_album_image_id})">
    <input type="submit" class="submit" value=" ({$ltag.yes}) ">&nbsp;
    </form>
    </td>
    <td style="width:50%;text-align:left;">
    ({t_form _method=get m=pc a=page_h_album_edit})
    <input type="hidden" name="target_c_album_id" value="({$target_c_album_image.c_album_id})">
    &nbsp;<input type="submit" class="submit" value=" ({$ltag.no}) ">
    </form>
    </td>
    </tr>
    </table>
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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
({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
-->
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
*****************************})