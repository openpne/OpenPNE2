<div id="LayoutB">

({if $box == "inbox" || !$box })

({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><label for="keyword">キーワード</label><input type="text" class="input_text" name="keyword" id="keyword" value="({$keyword})" size="20" /></li>
<li><label for="target_c_member_id">送信者</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_sender_list item=item})
<option value="({$item.c_member_id_from})"({if $target_c_member_id == $item.c_member_id_from}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select></li>
<li><input type="submit" class="input_submit" value="検索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})

({elseif $box == "outbox"})

({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><label for="keyword">キーワード</label><input type="text" class="input_text" name="keyword" id="keyword" value="({$keyword})" size="20" /></li>
<li><label for="target_c_member_id">宛先</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_receiver_list item=item})
<option value="({$item.c_member_id_to})"({if $target_c_member_id == $item.c_member_id_to}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select></li>
<li><input type="submit" class="input_submit" value="検索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})

({/if})

<div id="Left">

({* unknown *})<script type="text/javascript">
({* unknown *})<!--
({* unknown *})function checkAll() {
({* unknown *})    var sm = document.h_message_box_delete_message;
({* unknown *})    var len = sm.elements.length;
({* unknown *})    for (var i = 0; i < len; i++) {
({* unknown *})        sm.elements[i].checked = true;
({* unknown *})    }
({* unknown *})    return false;
({* unknown *})}
({* unknown *})function clearAll() {
({* unknown *})    var sm = document.h_message_box_delete_message;
({* unknown *})    var len = sm.elements.length;
({* unknown *})    for (var i = 0; i < len; i++) {
({* unknown *})        sm.elements[i].checked = false;
({* unknown *})    }
({* unknown *})    return false;
({* unknown *})}
({* unknown *})//-->
({* unknown *})</script>

({* {{{ sideNav *})
<div class="parts sideNav">

<div class="item pageNav"><ul>
({if $box != "inbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">受信メッセージ</a></li>
({else})<li class="looking">受信メッセージ</li>
({/if})
({if $box != "outbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ</a></li>
({else})<li class="looking">送信済みメッセージ</li>
({/if})
({if $box != "savebox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書きメッセージ</a></li>
({else})<li class="looking">下書きメッセージ</li>
({/if})
({if $box != "trash"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">ごみ箱</a></li>
({else})<li class="looking">ごみ箱</li>
({/if})
</ul></div>

({if $calendar})
<div class="item calendar">
<div class="partsHeading"><h3>
({if $ym.prev_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">＜</a>({/if})
({$date_val.month})月のカレンダー
({if $ym.next_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.next_year})&amp;month=({$ym.next_month})">＞</a>({/if})
</h3></div>
<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">月</th>
<th class="tue">火</th>
<th class="wed">水</th>
<th class="thu">木</th>
<th class="fri">金</th>
<th class="sat">土</th>
</tr>({foreach from=$calendar item=week})<tr>
({foreach from=$week item=item name="calendar_days"})
<td>({strip})
({if $item.day})
({if $item.is_message})
<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})&amp;box=({$box})" class="s_ss">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>
</div>
({/if})

({if $date_list})
<div class="item monthlyMessage">
<div class="partsHeading"><h3>各月のメッセージ</h3></div>
<ul class="list">
({foreach from=$date_list item=date})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=({$box})&amp;year=({$date.year})&amp;month=({$date.month})&amp;box=({$box})">({$date.year})年({$date.month})月の一覧</a></li>
({/foreach})
</ul>
</div>
({/if})

</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* #1956 *})<!-- ******ここから：Box一覧****** -->
({* #1956 *})<table border="0" cellspacing="0" cellpadding="0" style="width:520px;margin:0px auto;" class="border_07">
({* #1956 *})<tr>
({* #1956 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})<td style="width:506px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})</tr>
({* #1956 *})<tr>
({* #1956 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})<td class="bg_01" align="center">
({* #1956 *})<!-- *ここから：Box一覧＞内容* -->
({* #1956 *})({*ここから：header*})
({* #1956 *})<!-- ここから：小タイトル -->
({* #1956 *})<table border="0" cellspacing="0" cellpadding="0" style="width:506px;" class="border_01">
({* #1956 *})<tr>
({* #1956 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1956 *})<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* #1956 *})({if $box == "inbox" || !$box })
({* #1956 *})受信メッセージ
({* #1956 *})({elseif $box == "outbox"})
({* #1956 *})送信済みメッセージ
({* #1956 *})({elseif $box == "savebox"})
({* #1956 *})下書きメッセージ
({* #1956 *})({elseif $box == "trash"})
({* #1956 *})ごみ箱
({* #1956 *})({/if})
({* #1956 *})</span></td>
({* #1956 *})<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* #1956 *})({if !$all})
({* #1956 *})&nbsp;({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})
({* #1956 *})({/if})
({* #1956 *})</span>
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：小タイトル -->
({* #1956 *})({*ここまで：header*})
({* #1956 *})({*ここから：body*})
({* #1956 *})<!-- ここから：主内容 -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞メッセージ -->
({* #1956 *})<div align="left" style="padding:0px;" class="bg_09">
({* #1956 *})
({* #1956 *})({*～メッセージ挿入可～*})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})<!-- ここまで：主内容＞＞メッセージ -->
({* #1956 *})
({* #1956 *})({if $box == "inbox" || !$box })
({* #1956 *})
({* #1956 *})({if $count_c_message_ru_list})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:50%;" class="bg_02" align="left">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})&nbsp;<img src="({t_img_url_skin filename=icon_mail_4})" class="icon">&nbsp;…&nbsp;返信済み
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})<td class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})({capture name="ru_pager"})
({* #1956 *})({if $ru_data.is_ru_prev})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page-1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a>
({* #1956 *})({/if})
({* #1956 *})({$total_num})件中
({* #1956 *})({strip})
({* #1956 *})({$ru_data.ru_page*$page_size-$page_size+1})件～
({* #1956 *})({if $ru_data.ru_page*$page_size > $count_c_message_ru_list })
({* #1956 *})({$count_c_message_ru_list+$ru_data.ru_page*$page_size-$page_size })
({* #1956 *})({else})
({* #1956 *})({$ru_data.ru_page*$page_size})
({* #1956 *})({/if})
({* #1956 *})件を表示
({* #1956 *})({/strip})
({* #1956 *})({if $ru_data.is_ru_next})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page+1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a>
({* #1956 *})({/if})
({* #1956 *})({/capture})
({* #1956 *})({$smarty.capture.ru_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})({$smarty.capture.inbox_search_box|smarty:nodefaults})
({* #1956 *})
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞メール内容リスト -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
({* #1956 *})<td style="width:35px;" class="bg_08">削除</td>
({* #1956 *})<td style="width:130px;" class="bg_08"><span class="b_b">送信者</span></td>
({* #1956 *})<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
({* #1956 *})<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})
({* #1956 *})({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
({* #1956 *})
({* #1956 *})({foreach from=$c_message_ru_list item=c_message_ru})
({* #1956 *})<tr>
({* #1956 *})<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})" align="center"><img src="({if $c_message_ru.is_hensin})({t_img_url_skin filename=icon_mail_4})({elseif $c_message_ru.is_read})({t_img_url_skin filename=icon_mail_2})({else})({t_img_url_skin filename=icon_mail_1})({/if})" class="icon"></td>
({* #1956 *})<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})"><input name="c_message_id[]" value="({$c_message_ru.c_message_id})" type="checkbox" class="no_bg"></td>
({* #1956 *})<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})">({$c_message_ru.nickname})</td>
({* #1956 *})<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_ru.c_message_id})&amp;jyusin_c_message_id=({$c_message_ru.c_message_id})">({$c_message_ru.subject})</a></td>
({* #1956 *})<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})">({$c_message_ru.r_datetime|date_format:"%m月%d日"})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})({/foreach})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞メール内容リスト -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({$smarty.capture.ru_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞削除タブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_05" align="left">
({* #1956 *})
({* #1956 *})<br />
({* #1956 *})&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})<input type="hidden" name="box" value="({$box})">
({* #1956 *})<input type="submit" class="input_submit" value="削 除">
({* #1956 *})({/t_form_block})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞削除タブ -->
({* #1956 *})
({* #1956 *})({else})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})({$smarty.capture.inbox_search_box|smarty:nodefaults})
({* #1956 *})
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})<div align="center" style="padding:20px 30px;" class="bg_02 border_01">
({* #1956 *})
({* #1956 *})メッセージがありません。
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({if $box == "outbox"})
({* #1956 *})
({* #1956 *})({if $count_c_message_s_list})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})({capture name="s_pager"})
({* #1956 *})({if $s_data.is_s_prev})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page-1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a>
({* #1956 *})({/if})
({* #1956 *})({$total_num})件中
({* #1956 *})({strip})
({* #1956 *})({$s_data.s_page*$page_size-$page_size+1})件～
({* #1956 *})({if $s_data.s_page*$page_size > $count_c_message_s_list })
({* #1956 *})({$count_c_message_s_list+$s_data.s_page*$page_size-$page_size })
({* #1956 *})({else})
({* #1956 *})({$s_data.s_page*$page_size})
({* #1956 *})({/if})
({* #1956 *})件を表示
({* #1956 *})({/strip})
({* #1956 *})({if $s_data.is_s_next})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page+1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a>
({* #1956 *})({/if})
({* #1956 *})({/capture})
({* #1956 *})({$smarty.capture.s_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})({$smarty.capture.outbox_search_box|smarty:nodefaults})
({* #1956 *})
({* #1956 *})<!-- ここまで：主内容＞＞送信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信済み箱＞＞メール内容リスト -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
({* #1956 *})<td style="width:35px;" class="bg_08">削除</td>
({* #1956 *})<td style="width:130px;" class="bg_08"><span class="b_b">宛 先</span></td>
({* #1956 *})<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
({* #1956 *})<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})
({* #1956 *})({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
({* #1956 *})
({* #1956 *})({foreach from=$c_message_s_list item=c_message_s})
({* #1956 *})<tr>
({* #1956 *})<td class="bg_02" align="center"><img src="({t_img_url_skin filename=icon_mail_3})" class="icon"></td>
({* #1956 *})<td class="bg_02"><input name="c_message_id[]" value="({$c_message_s.c_message_id})" type="checkbox" class="no_bg"></td>
({* #1956 *})<td class="bg_02">({$c_message_s.nickname})</td>
({* #1956 *})<td class="bg_02"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_s.c_message_id})&amp;box=outbox">({$c_message_s.subject})</a></td>
({* #1956 *})<td class="bg_02">({$c_message_s.r_datetime|date_format:"%m月%d日"})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})({/foreach})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞送信済み箱＞＞メール内容リスト -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({$smarty.capture.s_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信済み箱＞＞削除タブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_05" align="left">
({* #1956 *})
({* #1956 *})<br />
({* #1956 *})&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})<input type="hidden" name="box" value="({$box})">
({* #1956 *})<input type="submit" class="input_submit" value="削 除">
({* #1956 *})({/t_form_block})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞送信済み箱＞＞削除タブ -->
({* #1956 *})
({* #1956 *})({else})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞送信済み箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})({$smarty.capture.outbox_search_box|smarty:nodefaults})
({* #1956 *})
({* #1956 *})<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->
({* #1956 *})
({* #1956 *})<div align="center" style="padding:20px 30px;" class="bg_02 border_01">
({* #1956 *})
({* #1956 *})メッセージがありません。
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})<!-- ここまで：主内容＞＞送信済み箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({if $box == "savebox"})
({* #1956 *})
({* #1956 *})({if $count_c_message_save_list})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({capture name="save_pager"})
({* #1956 *})({if $save_data.is_save_prev})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page-1})&amp;box=savebox">前を表示</a>
({* #1956 *})({/if})
({* #1956 *})({$total_num})件中
({* #1956 *})({strip})
({* #1956 *})({$save_data.save_page*$page_size-$page_size+1})件～
({* #1956 *})({if $save_data.save_page*$page_size > $count_c_message_save_list })
({* #1956 *})({$count_c_message_save_list+$save_data.save_page*$page_size-$page_size })
({* #1956 *})({else})
({* #1956 *})({$save_data.save_page*$page_size})
({* #1956 *})({/if})
({* #1956 *})件を表示
({* #1956 *})({/strip})
({* #1956 *})({if $save_data.is_save_next})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page+1})&amp;box=savebox">次を表示</a>
({* #1956 *})({/if})
({* #1956 *})({/capture})
({* #1956 *})({$smarty.capture.save_pager|smarty:nodefaults})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞下書き保存箱＞＞メール内容リスト -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
({* #1956 *})<td style="width:35px;" class="bg_08">削除</td>
({* #1956 *})<td style="width:130px;" class="bg_08"><span class="b_b">宛 先</span></td>
({* #1956 *})<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
({* #1956 *})<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})
({* #1956 *})({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
({* #1956 *})
({* #1956 *})({foreach from=$c_message_save_list item=c_message_save})
({* #1956 *})<tr>
({* #1956 *})<td class="bg_02" align="center"><img src="({t_img_url_skin filename=icon_mail_1})" class="icon"></td>
({* #1956 *})<td class="bg_02"><input name="c_message_id[]" value="({$c_message_save.c_message_id})" type="checkbox" class="no_bg"></td>
({* #1956 *})<td class="bg_02">({$c_message_save.nickname})</td>
({* #1956 *})<td class="bg_02"><a href="({t_url m=pc a=page_f_message_send})&amp;target_c_message_id=({$c_message_save.c_message_id})&amp;jyusin_c_message_id=({$c_message_save.hensinmoto_c_message_id})&amp;box=savebox">({$c_message_save.subject})</a></td>
({* #1956 *})<td class="bg_02">({$c_message_save.r_datetime|date_format:"%m月%d日"})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})({/foreach})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞下書き保存箱＞＞メール内容リスト -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({$smarty.capture.save_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞下書き保存箱＞＞削除タブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})
({* #1956 *})<td style="width:100%;" class="bg_05" align="left">
({* #1956 *})<br />
({* #1956 *})&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})<input type="hidden" name="box" value="savebox">
({* #1956 *})<input type="submit" class="input_submit" value="削 除">
({* #1956 *})({/t_form_block})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞下書き保存箱＞＞削除タブ -->
({* #1956 *})
({* #1956 *})({else})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞下書き保存箱＞＞メールナッシング -->
({* #1956 *})<div align="center" style="padding:20px 30px;" class="bg_02 border_01">
({* #1956 *})
({* #1956 *})メッセージがありません。
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})<!-- ここまで：主内容＞＞下書き保存箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({if $box == "trash"})
({* #1956 *})
({* #1956 *})({if $count_c_message_trash_list})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:350px;" class="bg_05" align="left">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})&nbsp;<img src="({t_img_url_skin filename=icon_mail_2})" class="icon">&nbsp;…&nbsp;受信&nbsp;
({* #1956 *})&nbsp;<img src="({t_img_url_skin filename=icon_mail_3})" class="icon">&nbsp;…&nbsp;送信済み&nbsp;
({* #1956 *})&nbsp;<img src="({t_img_url_skin filename=icon_mail_1})" class="icon">&nbsp;…&nbsp;下書き
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})<td class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({capture name="trash_pager"})
({* #1956 *})({if $trash_data.is_trash_prev})
({* #1956 *}) <a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page-1})&amp;box=trash">前を表示</a>
({* #1956 *})({/if})
({* #1956 *})({$total_num})件中
({* #1956 *})({strip})
({* #1956 *})({$trash_data.trash_page*$page_size-$page_size+1})件～
({* #1956 *})({if $trash_data.trash_page*$page_size > $count_c_message_trash_list })
({* #1956 *})({$count_c_message_trash_list+$trash_data.trash_page*$page_size-$page_size })
({* #1956 *})({else})
({* #1956 *})({$trash_data.trash_page*$page_size})
({* #1956 *})({/if})
({* #1956 *})件を表示
({* #1956 *})({/strip})
({* #1956 *})({if $trash_data.is_trash_next})
({* #1956 *})<a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page+1})&amp;box=trash">次を表示</a>
({* #1956 *})({/if})
({* #1956 *})({/capture})
({* #1956 *})<nobr>
({* #1956 *})({$smarty.capture.trash_pager|smarty:nodefaults})
({* #1956 *})</nobr>
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞ごみ箱＞＞メール内容リスト -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
({* #1956 *})<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
({* #1956 *})<td style="width:130px;" class="bg_08"><span class="b_b">相 手</span></td>
({* #1956 *})<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
({* #1956 *})<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})
({* #1956 *})({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
({* #1956 *})
({* #1956 *})({foreach from=$c_message_trash_list item=c_message_trash})
({* #1956 *})<tr>
({* #1956 *})({strip})
({* #1956 *})<td class="bg_02" align="center">
({* #1956 *})({if $c_message_trash.c_member_id_to == $u})({* 受信メッセージ *})
({* #1956 *})    <img src="({t_img_url_skin filename=icon_mail_2})" class="icon">
({* #1956 *})({else})
({* #1956 *})    ({if $c_message_trash.is_send})({* 送信メッセージ *})
({* #1956 *})        <img src="({t_img_url_skin filename=icon_mail_3})" class="icon">
({* #1956 *})    ({else})({* 下書きメッセージ *})
({* #1956 *})        <img src="({t_img_url_skin filename=icon_mail_1})" class="icon">
({* #1956 *})    ({/if})
({* #1956 *})({/if})
({* #1956 *})</td>
({* #1956 *})({/strip})
({* #1956 *})<td class="bg_02"><input name="c_message_id[]" value="({$c_message_trash.c_message_id})" type="checkbox" class="no_bg"></td>
({* #1956 *})<td class="bg_02">({$c_message_trash.nickname})</td>
({* #1956 *})<td class="bg_02"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;box=trash">({$c_message_trash.subject})</a></td>
({* #1956 *})<td class="bg_02">({$c_message_trash.r_datetime|date_format:"%m月%d日"})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})({/foreach})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞ごみ箱＞＞メール内容リスト -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_02" align="right">
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})
({* #1956 *})({$smarty.capture.trash_pager|smarty:nodefaults})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞ごみ箱＞＞削除タブ -->
({* #1956 *})<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({* #1956 *})({*********})
({* #1956 *})<tr>
({* #1956 *})<td style="width:100%;" class="bg_05" align="left">
({* #1956 *})
({* #1956 *})<br />
({* #1956 *})&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>
({* #1956 *})
({* #1956 *})<div class="padding_s">
({* #1956 *})<input type="hidden" name="box" value="trash">
({* #1956 *})
({* #1956 *})<input type="submit" class="input_submit" name="move" value="元に戻す">
({* #1956 *})<input type="submit" class="input_submit" name="remove" value="削除">
({* #1956 *})({/t_form_block})
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})
({* #1956 *})</td>
({* #1956 *})</tr>
({* #1956 *})({*********})
({* #1956 *})</table>
({* #1956 *})<!-- ここまで：主内容＞＞ごみ箱＞＞削除タブ -->
({* #1956 *})
({* #1956 *})({else})
({* #1956 *})
({* #1956 *})<!-- ここから：主内容＞＞ごみ箱＞＞メールナッシング -->
({* #1956 *})<div align="center" style="padding:20px 30px;" class="bg_02 border_01">
({* #1956 *})
({* #1956 *})メッセージがありません。
({* #1956 *})
({* #1956 *})</div>
({* #1956 *})<!-- ここまで：主内容＞＞ごみ箱＞＞メールナッシング -->
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})({/if})
({* #1956 *})
({* #1956 *})<!-- ここまで：主内容 -->
({* #1956 *})({*ここまで：body*})
({* #1956 *})({*ここから：footer*})
({* #1956 *})<!-- 無し -->
({* #1956 *})({*ここまで：footer*})
({* #1956 *})<!-- *ここまで：Box一覧＞＞内容* -->
({* #1956 *})</td>
({* #1956 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})</tr>
({* #1956 *})<tr>
({* #1956 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1956 *})</tr>
({* #1956 *})</table>
({* #1956 *})<!-- ******ここまで：Box一覧****** -->

</div><!-- Center -->
</div><!-- LayoutB -->
