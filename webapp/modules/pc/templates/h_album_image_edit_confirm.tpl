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



({****************************
({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：日記編集確認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：日記編集確認＞内容* -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.h_album_confirm_content})。</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$ltag.album})({$ltag.title})
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:411px" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$form_val.subject})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$ltag.album})({$ltag.description})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$form_val.description|nl2br})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$ltag.photo_1})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$form_val.upfile_1.name})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$ltag.photo_2})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$form_val.upfile_2.name})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$ltag.photo_3})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$form_val.upfile_3.name})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({if $form_val.category})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$ltag.open_range})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$form_val.category})

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
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$ltag.album_open})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({if $form_val.public_flag == "public"})
({$ltag.album_public})
({elseif $form_val.public_flag == "friend"})
({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
({elseif $form_val.public_flag == "private"})
({$ltag.not_open})
({/if})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="center" valign="middle" colspan="3">
<div class="padding_w_s">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
<tr>
({t_form m=pc a=do_h_album_edit_insert_c_album})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
<input type="hidden" name="subject" value="({$form_val.subject})">
<input type="hidden" name="body" value="({$form_val.body})">
<input type="hidden" name="public_flag" value="({$form_val.public_flag})">
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})">
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})">
<input type="hidden" name="category" value="({$form_val.category})">
<td><input type="submit" class="submit" value="　({$ltag.released_2})　"></td>
</form>

({t_form m=pc a=page_h_album_edit})
<input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
<input type="hidden" name="del_img" value="({$form_val.del_img})">
<input type="hidden" name="subject" value="({$form_val.subject})">
<input type="hidden" name="description" value="({$form_val.description})">
<input type="hidden" name="category" value="({$form_val.category})">
<td><input type="submit" class="submit" value="　({$ltag.Changes})　"></td>
</form>
</tr>
</table>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
</table>
<!-- ここまで：主内容 -->
<!-- 無し -->
<!-- *ここまで：日記編集確認＞＞内容* -->
</td>
<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_02"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：日記編集確認****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
*****************************})