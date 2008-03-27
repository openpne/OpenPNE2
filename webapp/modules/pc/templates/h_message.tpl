<div id="LayoutB">

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">

<div class="item pageNav"><ul>
({if $box != "inbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">受信メッセージ</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">受信メッセージ</a></li>
({/if})
({if $box != "outbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ</a></li>
({/if})
({if $box != "savebox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書き</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書き</a></li>
({/if})
({if $box != "trash"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">ごみ箱</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">ごみ箱</a></li>
({/if})
</ul></div>

</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* #2037 *})<!-- ******ここから：メッセージ表示欄****** -->
({* #2037 *})<table border="0" cellspacing="0" cellpadding="0" style="width:520px;margin:0px auto;" class="border_07">
({* #2037 *})<tr>
({* #2037 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})<td style="width:506px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})</tr>
({* #2037 *})<tr>
({* #2037 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})<td class="bg_01" align="center">
({* #2037 *})<!-- *ここから：メッセージ表示欄＞内容* -->
({* #2037 *})({*ここから：header*})
({* #2037 *})<!-- ここから：小タイトル -->
({* #2037 *})<table border="0" cellspacing="0" cellpadding="0" style="width:506px;" class="border_01">
({* #2037 *})<tr>
({* #2037 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #2037 *})<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">メッセージの詳細</span></td>
({* #2037 *})</tr>
({* #2037 *})</table>
({* #2037 *})<!-- ここまで：小タイトル -->
({* #2037 *})({*ここまで：header*})
({* #2037 *})({*ここから：body*})
({* #2037 *})<!-- ここから：主内容 -->
({* #2037 *})
({* #2037 *})<table border="0" cellspacing="0" cellpadding="0" class="border_01" style="width: 504px;">
({* #2037 *})<tr>
({* #2037 *})<td style="width:340px;height:2em;" class="bg_03" align="left">
({* #2037 *})<div class="padding_s">
({* #2037 *})({if $prev_c_message_id})
({* #2037 *})<a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$prev_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$prev_c_message_id})({/if})">前を表示</a>
({* #2037 *})({/if})
({* #2037 *})</div>
({* #2037 *})</td>
({* #2037 *})<td style="width:340px;height:2em;" class="bg_03" align="right">
({* #2037 *})<div class="padding_s">
({* #2037 *})({if $next_c_message_id})
({* #2037 *})<a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$next_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$next_c_message_id})({/if})">次を表示</a>
({* #2037 *})({/if})
({* #2037 *})</div>
({* #2037 *})</td>
({* #2037 *})</tr>
({* #2037 *})</table>
({* #2037 *})
({* #2037 *})<table border="0" cellspacing="0" cellpadding="0" style="width:504px;">
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})<td style="width:110px;" align="center" rowspan="5" class="bg_03">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({if $c_message.is_received})({$c_message.c_member_id_from})({else})({$c_message.c_member_id_to})({/if})">
({* #2037 *})<img src="({t_img_url filename=$c_message.image_filename_disp w=120 h=120 noimg=no_image})"></a>
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})<td style="width:63px;" class="bg_05" align="right">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({if $c_message.is_received})
({* #2037 *})差出人 :
({* #2037 *})({else})
({* #2037 *})宛 先 :
({* #2037 *})({/if})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td style="width:330px;" class="bg_05" align="left">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({if $c_message.is_received})
({* #2037 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})">({$c_message.c_member_nickname_from})</a>
({* #2037 *})({else})
({* #2037 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})">({$c_message.c_member_nickname_to})</a>
({* #2037 *})({/if})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td style="width:1px;" class="bg_01" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td style="height:1px;" class="bg_01" colspan="2"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td class="bg_05" align="right">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})日　付 :
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td class="bg_05" align="left">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({$c_message.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td style="height:1px;" class="bg_01" colspan="2"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td class="bg_05" align="right">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})件　名 :
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td class="bg_05" align="left">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({$c_message.subject})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})<tr>
({* #2037 *})<td align="left" valign="top" colspan="6" class="bg_02">
({* #2037 *})
({* #2037 *})<div class="padding_w_m">
({* #2037 *})
({* #2037 *})({if $c_message.image_filename_1||$c_message.image_filename_2||$c_message.image_filename_3})
({* #2037 *})({if $c_message.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_1})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_1 w=120 h=120})"></a></span>({/if})
({* #2037 *})({if $c_message.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_2})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_2 w=120 h=120})"></a></span>({/if})
({* #2037 *})({if $c_message.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$c_message.image_filename_3})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_3 w=120 h=120})"></a></span>({/if})
({* #2037 *})<br /><br />
({* #2037 *})({/if})
({* #2037 *})
({* #2037 *})({$c_message.body|nl2br|t_url2cmd:'message'|t_cmd:'message'})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})</tr>
({* #2037 *})({*********})
({* #2037 *})</table>
({* #2037 *})<!-- ここまで：主内容 -->
({* #2037 *})({*ここまで：body*})
({* #2037 *})({*ここから：footer*})
({* #2037 *})<!-- ここから：コマンド？ -->
({* #2037 *})<table border="0" cellspacing="0" cellpadding="0" class="border_01" style="width: 504px;">
({* #2037 *})<tr>
({* #2037 *})<td style="width:340px;height:2em;" class="bg_03" align="left">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({t_form_block m=pc a=do_h_message_box_delete_message})
({* #2037 *})
({* #2037 *})<input type="hidden" name="c_message_id[]" value=({$c_message.c_message_id})>
({* #2037 *})<input type="hidden" name="box" value="({$box})">
({* #2037 *})
({* #2037 *})({if $box == 'trash'})
({* #2037 *})<input type="submit" class="input_submit" name="move" value="元に戻す">
({* #2037 *})({/if})
({* #2037 *})<input type="submit" class="input_submit" name="remove" value="削 除">
({* #2037 *})
({* #2037 *})({/t_form_block})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})<td style="width:164px;" class="bg_03" align="right">
({* #2037 *})
({* #2037 *})<div class="padding_s">
({* #2037 *})
({* #2037 *})({if ($box == 'inbox' || !$box) && $c_message.c_member_nickname_from})
({* #2037 *})({t_form_block m=pc a=page_f_message_send})
({* #2037 *})<input type="hidden" name="target_c_message_id" value="({$c_message.c_message_id})">
({* #2037 *})<input type="hidden" name="jyusin_c_message_id" value="({$jyusin_c_message_id})">
({* #2037 *})<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})">
({* #2037 *})<input name="hensin2" type="submit" class="input_submit" value="　返信する　">
({* #2037 *})({/t_form_block})
({* #2037 *})({/if})
({* #2037 *})
({* #2037 *})</div>
({* #2037 *})
({* #2037 *})</td>
({* #2037 *})</tr>
({* #2037 *})</table>
({* #2037 *})<!-- ここまで：コマンド？ -->
({* #2037 *})({*ここまで：footer*})
({* #2037 *})<!-- *ここまで：メッセージ表示欄＞＞内容* -->
({* #2037 *})</td>
({* #2037 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})</tr>
({* #2037 *})<tr>
({* #2037 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #2037 *})</tr>
({* #2037 *})</table>
({* #2037 *})<!-- ******ここまで：メッセージ表示欄****** -->

</div><!-- Center -->
</div><!-- LayoutB -->
