({ext_include file="inc_header.tpl"})
({if $box == "inbox" || !$box })
<tr>
<td class="container inc_c_com_topic_find" align="center">
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
<tr>
<td style="width:720px;height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:720px;height:2px;" class="dummy"></td>
</tr>
<tr>
<td align="center">

({*ここから：本体*})

<div class="color_19" style="width:680px;height:24px;border-left:none 0px;border-right:none 0px;border-top:none 0px;">
({t_form _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})">

<table border="0" cellspacing="0" cellpadding="0" class="search_bar" style="width:680px;height:24px;">
<tr>
<td align="center" style="height:24px;">
<img src="({t_img_url_skin filename=icon_search})" alt="search" style="width:62px;height:20px;" class="icon">
キーワード<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
<input type="text" size="20" name="keyword" class="text border_01" value="({$keyword})" style="width:150px;">
送信者<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
<select name="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_sender_list item=item})
<option ({if $target_c_member_id==$item.c_member_id_from})selected({/if}) value="({$item.c_member_id_from})">({$item.nickname})</option>
({/foreach})
</select>

<input type="submit" class="submit" value=" 検 索 " style="width:62px;height:20px;">

</td>
</tr>
</table>

</form>
</div>

({*ここまで：本体*})
</td>
</tr>
</table>
</td>
</tr>
({elseif $box == "outbox"})
<tr>
<td class="container inc_c_com_topic_find" align="center">
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
<tr>
<td style="width:720px;height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:720px;height:2px;" class="dummy"></td>
</tr>
<tr>
<td align="center">

({*ここから：本体*})

<div class="color_19" style="width:680px;height:24px;border-left:none 0px;border-right:none 0px;border-top:none 0px;">
({t_form _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})">

<table border="0" cellspacing="0" cellpadding="0" class="search_bar" style="width:680px;height:24px;">
<tr>
<td align="center" style="height:24px;">
<img src="({t_img_url_skin filename=icon_search})" alt="search" style="width:62px;height:20px;" class="icon">
キーワード<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
<input type="text" size="20" name="keyword" class="text border_01" value="({$keyword})" style="width:150px;">
宛先<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
<select name="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_receiver_list item=item})
<option ({if $target_c_member_id==$item.c_member_id_to})selected({/if}) value="({$item.c_member_id_to})">({$item.nickname})</option>
({/foreach})
</select>

<input type="submit" class="submit" value=" 検 索 " style="width:62px;height:20px;">

</td>
</tr>
</table>

</form>
</div>

({*ここまで：本体*})
</td>
</tr>
</table>
</td>
</tr>
({/if})
({ext_include file="inc_layoutcolumn_top_175px.tpl"})
<script type="text/javascript">
<!--
function checkAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}

function clearAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}

//-->
</script>
({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

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
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">受信メッセージ</a>
({else})
<td align="left" style="width:151px;padding:3px;" class="bg_09 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">受信メッセージ
({/if})
</td>
</tr>
<tr>
({if $box != "outbox"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ</a>
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">送信済みメッセージ
({/if})
</td>
</tr>
<tr>
({if $box != "savebox"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書きメッセージ</a>
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">下書きメッセージ
({/if})
</td>
</tr>
<tr>
({if $box != "trash"})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_02 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1"><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">ごみ箱</a>
({else})
<td align="left" style="width:151px;padding:3px;border-top:none;" class="bg_09 border_10">
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">ごみ箱
({/if})
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


({if $calendar})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************* -->
<!-- ******ここから：カレンダー****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：カレンダー＞内容* -->
({*ここから：header*})
<!-- ここから：カレンダータイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;margin:0px auto;">
<tr>
<td align="center" class="bg_03 padding_s">

({strip})
({if $ym.prev_month})
<span class="b_b">
<a href="({t_url m=pc a=page_h_message_box})
    &amp;target_c_member_id=({$target_member.c_member_id})
    &amp;box=({$box})
    &amp;year=({$ym.prev_year})
    &amp;month=({$ym.prev_month})">
＜
</a>
</span>
({/if})

<span class="b_b">({$date_val.month})月のカレンダー</span>

({if $ym.next_month})
<span class="b_b">
<a href="({t_url m=pc a=page_h_message_box})
    &amp;target_c_member_id=({$target_member.c_member_id})
    &amp;box=({$box})
    &amp;year=({$ym.next_year})
    &amp;month=({$ym.next_month})">
＞
</a>
</span>
({/if})
({/strip})

</td>
</tr>
</table>
<!-- ここまで：カレンダータイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;margin:0px auto;">
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
<tr>
<td class="bg_09 s_ss padding_ss" align="right"><span class="c_02 s_ss">日</span></td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">月</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">火</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">水</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">木</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">金</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right"><span class="c_03 s_ss">土</span></td>
</tr>
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name="calendar_days"})
<td style="width:({if $smarty.foreach.calendar_days.iteration%7 == 0 || $smarty.foreach.calendar_days.iteration%7 == 1})21({else})20({/if})px;height:18px;" valign="middle" align="right" class="bg_02 s_ss padding_ss">
({if $item.day})
({if $item.is_message})
<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})&amp;box=({$box})" class="s_ss">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
&nbsp;({/if})
</td>
({if $smarty.foreach.calendar_days.iteration%7 != 0})
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/if})
({/foreach})
</tr>
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
({/foreach})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：カレンダー＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：カレンダー****** -->
<!-- ****************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/if})

({if $date_list})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<!-- ********************************** -->
<!-- ******ここから：各月のメッセージ一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：各月のメッセージ一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:111px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">各月のメッセージ</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div align="left" class="bg_02 border_01 padding_ss">
({foreach from=$date_list item=date})

<div><a href="({t_url m=pc a=page_h_message_box})&amp;box=({$box})&amp;year=({$date.year})&amp;month=({$date.month})&amp;box=({$box})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$date.year})年({$date.month})月の一覧</a></div>

({/foreach})
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：各月のメッセージ一覧＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：各月のメッセージ一覧****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_175px.tpl"})
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- **************************** -->
<!-- ******ここから：Box一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:520px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:506px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：Box一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:506px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({if $box == "inbox" || !$box })
受信メッセージ
({elseif $box == "outbox"})
送信済みメッセージ
({elseif $box == "savebox"})
下書きメッセージ
({elseif $box == "trash"})
ごみ箱
({/if})
</span></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({if !$all})
&nbsp;({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})
({/if})
</span>
</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->

<!-- ここから：主内容＞＞メッセージ -->
<div align="left" style="padding:0px;" class="bg_09">

({*～メッセージ挿入可～*})

</div>
<!-- ここまで：主内容＞＞メッセージ -->

({if $box == "inbox" || !$box })

({if $count_c_message_ru_list})

<!-- ここから：主内容＞＞受信箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:50%;" class="bg_02" align="left">

<div class="padding_s">

&nbsp;<img src="({t_img_url_skin filename=icon_mail_4})" class="icon">&nbsp;…&nbsp;返信済み

</div>

</td>
<td class="bg_02" align="right">

<div class="padding_s">
({capture name="ru_pager"})
({if $ru_data.is_ru_prev})
 <a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page-1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a>
({/if})
({$total_num})件中
({strip})
({$ru_data.ru_page*$page_size-$page_size+1})件～
({if $ru_data.ru_page*$page_size > $count_c_message_ru_list })
({$count_c_message_ru_list+$ru_data.ru_page*$page_size-$page_size })
({else})
({$ru_data.ru_page*$page_size})
({/if})
件を表示
({/strip})
({if $ru_data.is_ru_next})
 <a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page+1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a>
({/if})
({/capture})
({$smarty.capture.ru_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞受信箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->

({$smarty.capture.inbox_search_box|smarty:nodefaults})

<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->

<!-- ここから：主内容＞＞受信箱＞＞メール内容リスト -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
<td style="width:35px;" class="bg_08">削除</td>
<td style="width:130px;" class="bg_08"><span class="b_b">送信者</span></td>
<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<form action="./" method="post" name="h_message_box_delete_message">
<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="do_h_message_box_delete_message">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

({foreach from=$c_message_ru_list item=c_message_ru})
<tr>
<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})" align="center"><img src="({if $c_message_ru.is_hensin})({t_img_url_skin filename=icon_mail_4})({elseif $c_message_ru.is_read})({t_img_url_skin filename=icon_mail_2})({else})({t_img_url_skin filename=icon_mail_1})({/if})" class="icon"></td>
<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})"><input name="c_message_id[]" value="({$c_message_ru.c_message_id})" type="checkbox" class="no_bg"></td>
<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})">({$c_message_ru.nickname})</td>
<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_ru.c_message_id})&amp;jyusin_c_message_id=({$c_message_ru.c_message_id})">({$c_message_ru.subject})</a></td>
<td class="bg_({if $c_message_ru.is_read})02({else})09({/if})">({$c_message_ru.r_datetime|date_format:"%m月%d日"})</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞受信箱＞＞メール内容リスト -->

<!-- ここから：主内容＞＞受信箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">

({$smarty.capture.ru_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞受信箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞受信箱＞＞削除タブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_05" align="left">

<br>
&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>

<div class="padding_s">
<input type="hidden" name="box" value="({$box})">
<input type="submit" class="submit" value="削 除">
</form>
</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞受信箱＞＞削除タブ -->

({else})

<!-- ここから：主内容＞＞受信箱＞＞メールナッシング -->

<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->

({$smarty.capture.inbox_search_box|smarty:nodefaults})

<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->

<div align="center" style="padding:20px 30px;" class="bg_02 border_01">

メッセージがありません。

</div>
<!-- ここまで：主内容＞＞受信箱＞＞メールナッシング -->

({/if})

({/if})

({if $box == "outbox"})

({if $count_c_message_s_list})

<!-- ここから：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">
({capture name="s_pager"})
({if $s_data.is_s_prev})
 <a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page-1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a>
({/if})
({$total_num})件中
({strip})
({$s_data.s_page*$page_size-$page_size+1})件～
({if $s_data.s_page*$page_size > $count_c_message_s_list })
({$count_c_message_s_list+$s_data.s_page*$page_size-$page_size })
({else})
({$s_data.s_page*$page_size})
({/if})
件を表示
({/strip})
({if $s_data.is_s_next})
 <a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page+1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a>
({/if})
({/capture})
({$smarty.capture.s_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞送信箱＞＞検索BOX -->

({$smarty.capture.outbox_search_box|smarty:nodefaults})

<!-- ここまで：主内容＞＞送信箱＞＞検索BOX -->


<!-- ここから：主内容＞＞送信済み箱＞＞メール内容リスト -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
<td style="width:35px;" class="bg_08">削除</td>
<td style="width:130px;" class="bg_08"><span class="b_b">宛 先</span></td>
<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<form action="./" method="post" name="h_message_box_delete_message">
<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="do_h_message_box_delete_message">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

({foreach from=$c_message_s_list item=c_message_s})
<tr>
<td class="bg_02" align="center"><img src="({t_img_url_skin filename=icon_mail_3})" class="icon"></td>
<td class="bg_02"><input name="c_message_id[]" value="({$c_message_s.c_message_id})" type="checkbox" class="no_bg"></td>
<td class="bg_02">({$c_message_s.nickname})</td>
<td class="bg_02"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_s.c_message_id})&amp;box=outbox">({$c_message_s.subject})</a></td>
<td class="bg_02">({$c_message_s.r_datetime|date_format:"%m月%d日"})</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞送信済み箱＞＞メール内容リスト -->

<!-- ここから：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">

({$smarty.capture.s_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞送信済み箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞送信済み箱＞＞削除タブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_05" align="left">

<br>
&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>

<div class="padding_s">
<input type="hidden" name="box" value="({$box})">
<input type="submit" class="submit" value="削 除">
</form>
</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞送信済み箱＞＞削除タブ -->

({else})

<!-- ここから：主内容＞＞送信済み箱＞＞メールナッシング -->

<!-- ここから：主内容＞＞受信箱＞＞検索BOX -->

({$smarty.capture.outbox_search_box|smarty:nodefaults})

<!-- ここまで：主内容＞＞受信箱＞＞検索BOX -->

<div align="center" style="padding:20px 30px;" class="bg_02 border_01">

メッセージがありません。

</div>
<!-- ここまで：主内容＞＞送信済み箱＞＞メールナッシング -->

({/if})

({/if})

({if $box == "savebox"})

({if $count_c_message_save_list})

<!-- ここから：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">

({capture name="save_pager"})
({if $save_data.is_save_prev})
 <a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page-1})&amp;box=savebox">前を表示</a>
({/if})
({$total_num})件中
({strip})
({$save_data.save_page*$page_size-$page_size+1})件～
({if $save_data.save_page*$page_size > $count_c_message_save_list })
({$count_c_message_save_list+$save_data.save_page*$page_size-$page_size })
({else})
({$save_data.save_page*$page_size})
({/if})
件を表示
({/strip})
({if $save_data.is_save_next})
 <a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page+1})&amp;box=savebox">次を表示</a>
({/if})
({/capture})
({$smarty.capture.save_pager|smarty:nodefaults})
</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞下書き保存箱＞＞メール内容リスト -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
<td style="width:35px;" class="bg_08">削除</td>
<td style="width:130px;" class="bg_08"><span class="b_b">宛 先</span></td>
<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<form action="./" method="post" name="h_message_box_delete_message">
<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="do_h_message_box_delete_message">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

({foreach from=$c_message_save_list item=c_message_save})
<tr>
<td class="bg_02" align="center"><img src="({t_img_url_skin filename=icon_mail_1})" class="icon"></td>
<td class="bg_02"><input name="c_message_id[]" value="({$c_message_save.c_message_id})" type="checkbox" class="no_bg"></td>
<td class="bg_02">({$c_message_save.nickname})</td>
<td class="bg_02"><a href="({t_url m=pc a=page_f_message_send})&amp;target_c_message_id=({$c_message_save.c_message_id})&amp;jyusin_c_message_id=({$c_message_save.hensinmoto_c_message_id})&amp;box=savebox">({$c_message_save.subject})</a></td>
<td class="bg_02">({$c_message_save.r_datetime|date_format:"%m月%d日"})</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞下書き保存箱＞＞メール内容リスト -->

<!-- ここから：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">

({$smarty.capture.save_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞下書き保存箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞下書き保存箱＞＞削除タブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>

<td style="width:100%;" class="bg_05" align="left">
<br>
&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>

<div class="padding_s">
<input type="hidden" name="box" value="savebox">
<input type="submit" class="submit" value="削 除">
</form>

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞下書き保存箱＞＞削除タブ -->

({else})

<!-- ここから：主内容＞＞下書き保存箱＞＞メールナッシング -->
<div align="center" style="padding:20px 30px;" class="bg_02 border_01">

メッセージがありません。

</div>
<!-- ここまで：主内容＞＞下書き保存箱＞＞メールナッシング -->

({/if})

({/if})

({if $box == "trash"})

({if $count_c_message_trash_list})

<!-- ここから：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:350px;" class="bg_05" align="left">

<div class="padding_s">

&nbsp;<img src="({t_img_url_skin filename=icon_mail_2})" class="icon">&nbsp;…&nbsp;受信&nbsp;
&nbsp;<img src="({t_img_url_skin filename=icon_mail_3})" class="icon">&nbsp;…&nbsp;送信済み&nbsp;
&nbsp;<img src="({t_img_url_skin filename=icon_mail_1})" class="icon">&nbsp;…&nbsp;下書き

</div>

</td>
<td class="bg_02" align="right">

<div class="padding_s">

({capture name="trash_pager"})
({if $trash_data.is_trash_prev})
 <a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page-1})&amp;box=trash">前を表示</a>
({/if})
({$total_num})件中
({strip})
({$trash_data.trash_page*$page_size-$page_size+1})件～
({if $trash_data.trash_page*$page_size > $count_c_message_trash_list })
({$count_c_message_trash_list+$trash_data.trash_page*$page_size-$page_size })
({else})
({$trash_data.trash_page*$page_size})
({/if})
件を表示
({/strip})
({if $trash_data.is_trash_next})
<a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page+1})&amp;box=trash">次を表示</a>
({/if})
({/capture})
<nobr>
({$smarty.capture.trash_pager|smarty:nodefaults})
</nobr>
</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞ごみ箱＞＞メール内容リスト -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
<td style="width:35px;height:19px;" class="bg_08">&nbsp;</td>
<td style="width:130px;" class="bg_08"><span class="b_b">相 手</span></td>
<td style="width:220px;" class="bg_08"><span class="b_b">件 名</span></td>
<td style="width:auto;" class="bg_08"><span class="b_b">日 付</span></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<form action="./" method="post" name="h_message_box_delete_message">
<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="do_h_message_box_delete_message">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

({foreach from=$c_message_trash_list item=c_message_trash})
<tr>
({strip})
<td class="bg_02" align="center">
({if $c_message_trash.c_member_id_to == $u})({* 受信メッセージ *})
    <img src="({t_img_url_skin filename=icon_mail_2})" class="icon">
({else})
    ({if $c_message_trash.is_send})({* 送信メッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_3})" class="icon">
    ({else})({* 下書きメッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_1})" class="icon">
    ({/if})
({/if})
</td>
({/strip})
<td class="bg_02"><input name="c_message_id[]" value="({$c_message_trash.c_message_id})" type="checkbox" class="no_bg"></td>
<td class="bg_02">({$c_message_trash.nickname})</td>
<td class="bg_02"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;box=trash">({$c_message_trash.subject})</a></td>
<td class="bg_02">({$c_message_trash.r_datetime|date_format:"%m月%d日"})</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞ごみ箱＞＞メール内容リスト -->

<!-- ここから：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_02" align="right">

<div class="padding_s">

({$smarty.capture.trash_pager|smarty:nodefaults})

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞ごみ箱＞＞ページ切り替えタブ -->

<!-- ここから：主内容＞＞ごみ箱＞＞削除タブ -->
<table style="width:504px;" border="0" cellspacing="0" cellpadding="0" style="width:auto;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:100%;" class="bg_05" align="left">

<br>
&nbsp;<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>

<div class="padding_s">
<input type="hidden" name="box" value="trash">

<input type="submit" class="submit" name="move" value="元に戻す">
<input type="submit" class="submit" name="remove" value="削除">
</form>

</div>

</td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞ごみ箱＞＞削除タブ -->

({else})

<!-- ここから：主内容＞＞ごみ箱＞＞メールナッシング -->
<div align="center" style="padding:20px 30px;" class="bg_02 border_01">

メッセージがありません。

</div>
<!-- ここまで：主内容＞＞ごみ箱＞＞メールナッシング -->

({/if})

({/if})

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：Box一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：Box一覧****** -->
<!-- **************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
