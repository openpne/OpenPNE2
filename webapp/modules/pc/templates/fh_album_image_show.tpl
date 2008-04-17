
<div id="LayoutC">
<div id="Center">

<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>画像の表示</h3></div>

({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
<div class="pagerRelative">
({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の画像</a></p>({/if})
({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の画像»</a></p>({/if})
</div>
({/if})

<table>
<tr>
<td colspan="2">
<img src="({t_img_album_url filename=$c_album_image.image_filename w=600 h=600})" alt="photo" vspace="4">
</td>
</tr>
<tr>
<td>写真説明</td>
<td>({$c_album_image.image_description})</td>
</tr>
</table>


({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
<div class="pagerRelative">
({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の画像</a></p>({/if})
({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の画像»</a></p>({/if})
</div>
({/if})

<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$c_album_image.c_album_id})">アルバムに戻る</a>

</div> <!-- parts -->
</div> <!-- dparts formTable -->

</div><!-- Center -->
</div><!-- LayoutC -->

({* unknown *})({*************************
({* unknown *})({ext_include file="inc_header.tpl"})
({* unknown *})({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({* unknown *})  
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:640px;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06">
({* unknown *})        <img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td class="bg_06" ><b>({$member.nickname})({$smarty.const.NAME_TAIL})({$ltag.photo})({$ltag.details})</b>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02 padding_ss" align="center" valign="middle">
({* unknown *})        ({if $image_key > 0})<a href="({t_url m=pc a=page_fh_album_image_show})&amp;image_key=({$image_key+$fore})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})&amp;pass_num=-1">({$ltag.fh_album_image_show_previous_photo})</a>&nbsp;|({/if})&nbsp;<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})#write">({$ltag.voice_mail})</a>&nbsp;({if $image_key < $count-1})|&nbsp;<a href="({t_url m=pc a=page_fh_album_image_show})&amp;image_key=({$image_key+$next})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})&amp;pass_num=1">({$ltag.fh_album_image_show_next_photo})</a>({/if})
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
({* unknown *})
({* unknown *})<tr>
({* unknown *})    <td ALIGN=center COLSPAN=3 class="bg_02" ><img SRC="({t_img_album_url filename=$c_album_image.image_filename w=600 h=600})" ALT="photo" VSPACE=4></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})    <td ALIGN=center class="bg_02 padding_ss" width="120"><div style="padding:4px 3px;">({$ltag.photo})({$ltag.Note})</div></td>
({* unknown *})    <td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})    <td class="bg_02 padding_ss" width=563 align="left">({$c_album_image.image_description})<br>
({* unknown *})    </td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02 padding_ss" align="center" valign="middle">
({* unknown *})        ({if $image_key > 0})<a href="({t_url m=pc a=page_fh_album_image_show})&amp;image_key=({$image_key+$fore})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})&amp;pass_num=-1">({$ltag.fh_album_image_show_previous_photo})</a>&nbsp;|({/if})&nbsp;<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})#write">({$ltag.voice_mail})</a>&nbsp;({if $image_key < $count-1})|&nbsp;<a href="({t_url m=pc a=page_fh_album_image_show})&amp;image_key=({$image_key+$next})&amp;target_c_album_id=({$target_c_album_id})&amp;target_c_member_id=({$target_c_member_id})&amp;pass_num=1">({$ltag.fh_album_image_show_next_photo})</a>({/if})
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})        
({* unknown *})<tr>
({* unknown *})    <td style="text-align:center;" colspan="2" class="padding_s">
({* unknown *})    <img src="./skin/icon_arrow_1.gif" name="backtop" width="14" height="14" align="absmiddle">
({* unknown *})    &nbsp;
({* unknown *})    <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$c_album_image.c_album_id})">
({* unknown *})    ({$ltag.entry})    
({* unknown *})    </a>
({* unknown *})    </td>
({* unknown *})</tr>
({* unknown *})    
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l"> 
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
({* unknown *})-->
({* unknown *})({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({* unknown *})({ext_include file="inc_footer.tpl"}) </p>
({* unknown *})**************************})