({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_175px.tpl"})
({***********************************})
({**ここから：メインコンテンツ(左)*******})
({***********************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- *********************************************** -->
<!-- ******ここから：メッセージボックス左メニュー****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:151px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_02" align="center">
<!-- *ここから：メッセージボックス左メニュー＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:151px;">
<tr>
({if $box != "inbox"})
<td align="left" style="width:151px;padding:3px;" class="bg_02 border_10">
({else})
<td align="left" style="width:151px;padding:3px;" class="bg_09 border_10">
({/if})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">受信メッセージ</a>
</td>
</tr>
<tr>
({if $box != "outbox"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
({/if})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済メッセージ</a>
</td>
</tr>
<tr>
({if $box != "savebox"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
({/if})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書き</a>
</td>
</tr>
<tr>
({if $box != "trash"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
({/if})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">ごみ箱</a>
</td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：メッセージボックス左メニュー＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メッセージボックス左メニュー****** -->
<!-- *********************************************** -->

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_175px.tpl"})
({**ここから：メインコンテンツ（右）**})
({********************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- **************************** -->
<!-- ******ここから：メッセージ表示欄****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:520px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:506px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：メッセージ表示欄＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:506px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">メッセージの詳細</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->

<table border="0" cellspacing="0" cellpadding="0" class="border_01" style="width: 504px;">
<tr>
<td style="width:340px;height:2em;" class="bg_03" align="left">
<div class="padding_s">
({if $prev_c_message_id})
<a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$prev_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$prev_c_message_id})({/if})">前を表示</a>
({/if})
</div>
</td>
<td style="width:340px;height:2em;" class="bg_03" align="right">
<div class="padding_s">
({if $next_c_message_id})
<a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$next_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$next_c_message_id})({/if})">次を表示</a>
({/if})
</div>
</td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" style="width:504px;">
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" align="center" rowspan="5" class="bg_03">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({if $c_message.is_received})({$c_message.c_member_id_from})({else})({$c_message.c_member_id_to})({/if})">
<img src="({t_img_url filename=$c_message.image_filename_disp w=120 h=120 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:63px;" class="bg_05" align="right">

<div class="padding_s">

({if $c_message.is_received})
差出人 :
({else})
宛 先 :
({/if})

</div>

</td>
<td style="width:330px;" class="bg_05" align="left">

<div class="padding_s">

({if $c_message.is_received})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})">({$c_message.c_member_nickname_from})</a>
({else})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})">({$c_message.c_member_nickname_to})</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="2"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_05" align="right">

<div class="padding_s">

日　付 :

</div>

</td>
<td class="bg_05" align="left">

<div class="padding_s">

({$c_message.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})

</div>

</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="2"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_05" align="right">

<div class="padding_s">

件　名 :

</div>

</td>
<td class="bg_05" align="left">

<div class="padding_s">

({$c_message.subject})

</div>

</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td align="left" valign="top" colspan="6" class="bg_02">

<div class="padding_w_m">

({if $c_message.image_filename_1||$c_message.image_filename_2||$c_message.image_filename_3})
({if $c_message.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_1})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $c_message.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_2})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $c_message.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_3})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_3 w=120 h=120})"></a></span>({/if})
<br><br>
({/if})

({$c_message.body|nl2br|t_url2cmd:'message'|t_cmd:'message'})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：コマンド？ -->
<table border="0" cellspacing="0" cellpadding="0" class="border_01" style="width: 504px;">
<tr>
<td style="width:340px;height:2em;" class="bg_03" align="left">

<div class="padding_s">

({t_form m=pc a=do_h_message_box_delete_message})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id[]" value=({$c_message.c_message_id})>
<input type="hidden" name="box" value="({$box})">

({if $box == 'trash'})
<input type="submit" class="submit" name="move" value="元に戻す">
({/if})
<input type="submit" class="submit" name="remove" value="削 除">

</form>

</div>

</td>
<td style="width:164px;" class="bg_03" align="right">

<div class="padding_s">

({if ($box == 'inbox' || !$box) && $c_message.c_member_nickname_from})
({t_form m=pc a=page_f_message_send})
<input type="hidden" name="target_c_message_id" value="({$c_message.c_message_id})">
<input type="hidden" name="jyusin_c_message_id" value="({$jyusin_c_message_id})">
<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})">
<input name="hensin2" type="submit" class="submit" value="　返信する　">
</form>
({/if})

</div>

</td>
</tr>
</table>
<!-- ここまで：コマンド？ -->
({*ここまで：footer*})
<!-- *ここまで：メッセージ表示欄＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メッセージ表示欄****** -->
<!-- **************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
