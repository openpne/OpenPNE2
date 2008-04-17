<div id="LayoutC">
<div id="Center">

<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>以下の内容でよろしいですか？</h3></div>

<table>
<tr>
<th>画像</th>
<td>
({if $form_val.tmpfile_1})
({$form_val.upfile_1.name})
({else})
画像変更なし
({/if})
</td>
</tr>
<tr>
<th>写真説明</th>
<td>({$form_val.image_description})</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_image_edit_insert_c_album_image})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　決　定　">
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_image_edit})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　修 　正　" />
({/t_form_block})
</li>
</ul>
</div> <!-- operation -->


</div> <!-- parts -->
</div> <!-- dparts formTable -->

</div><!-- Center -->
</div><!-- LayoutC -->



({* unknown *})({****************************
({* unknown *})({ext_include file="inc_header.tpl"})
({* unknown *})({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- ******************************** -->
({* unknown *})<!-- ******ここから：日記編集確認****** -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})<td style="width:566px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})<td style="width:7px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：日記編集確認＞内容* -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.h_album_confirm_content})。</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* unknown *})<tr>
({* unknown *})<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:150px;" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.album})({$ltag.title})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:411px" class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.subject})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.album})({$ltag.description})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.description|nl2br})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_1})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.upfile_1.name})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_2})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.upfile_2.name})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_3})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.upfile_3.name})
({* unknown *})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})({if $form_val.category})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$ltag.open_range})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.category})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$ltag.album_open})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({if $form_val.public_flag == "public"})
({* unknown *})({$ltag.album_public})
({* unknown *})({elseif $form_val.public_flag == "friend"})
({* unknown *})({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
({* unknown *})({elseif $form_val.public_flag == "private"})
({* unknown *})({$ltag.not_open})
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle" colspan="3">
({* unknown *})<div class="padding_w_s">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
({* unknown *})<tr>
({* unknown *})({t_form m=pc a=do_h_album_edit_insert_c_album})
({* unknown *})<input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
({* unknown *})<input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})<input type="hidden" name="body" value="({$form_val.body})">
({* unknown *})<input type="hidden" name="public_flag" value="({$form_val.public_flag})">
({* unknown *})<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
({* unknown *})<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})">
({* unknown *})<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})">
({* unknown *})<input type="hidden" name="category" value="({$form_val.category})">
({* unknown *})<td><input type="submit" class="submit" value="　({$ltag.released_2})　"></td>
({* unknown *})</form>
({* unknown *})
({* unknown *})({t_form m=pc a=page_h_album_edit})
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
({* unknown *})<input type="hidden" name="del_img" value="({$form_val.del_img})">
({* unknown *})<input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})<input type="hidden" name="description" value="({$form_val.description})">
({* unknown *})<input type="hidden" name="category" value="({$form_val.category})">
({* unknown *})<td><input type="submit" class="submit" value="　({$ltag.Changes})　"></td>
({* unknown *})</form>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})<!-- 無し -->
({* unknown *})<!-- *ここまで：日記編集確認＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ******ここまで：日記編集確認****** -->
({* unknown *})<!-- ******************************** -->
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({* unknown *})({ext_include file="inc_footer.tpl"})
({* unknown *})*****************************})