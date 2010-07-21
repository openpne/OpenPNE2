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
<li><input type="submit" class="input_submit" value="　検　索　" /></li>
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
<li><input type="submit" class="input_submit" value="　検　索　" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})

({/if})

<div id="Left">

<script type="text/javascript">
//<![CDATA[
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
//]]>
</script>

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
({if $ym.prev_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">&lt;&lt;</a>({/if})
({$date_val.month})月のカレンダー
({if $ym.next_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.next_year})&amp;month=({$ym.next_month})">&gt;&gt;</a>({/if})
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

({if $box == "inbox" || !$box})

({if $count_c_message_ru_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>受信メッセージ</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

<div class="pagerRelativeMulti">
<div class="text">
<p class="icons">
<span><img src="({t_img_url_skin filename=icon_mail_4})" alt="返信済み" />返信済み</span>
</p>
</div>
<div class="pager">
({capture name=pager})({strip})
({if $ru_data.is_ru_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page-1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a></p>({/if})
<p class="number">({$total_num})件中 ({$ru_data.ru_page*$page_size-$page_size+1})件～
({if $ru_data.ru_page*$page_size > $count_c_message_ru_list })
({$count_c_message_ru_list+$ru_data.ru_page*$page_size-$page_size })
({else})
({$ru_data.ru_page*$page_size})
({/if})
件を表示</p>
({if $ru_data.is_ru_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page+1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a></p>({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})
</div>
</div>

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="({$box})" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">削除</th>
<th>送信者</th>
<th>件名</th>
<th>日付</th>
</tr>
({foreach from=$c_message_ru_list item=c_message_ru})
<tr({if !$c_message_ru.is_read}) class="unread"({/if})>
<td class="status"><span>({strip})
({if $c_message_ru.is_hensin})
<img src="({t_img_url_skin filename=icon_mail_4})" alt="返信済み" />
({elseif $c_message_ru.is_read})
<img src="({t_img_url_skin filename=icon_mail_2})" alt="既読" />
({else})
<img src="({t_img_url_skin filename=icon_mail_1})" alt="未読" />
({/if})
({/strip})</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_ru.c_message_id})" /></span></td>
<td><span>({$c_message_ru.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_ru.c_message_id})&amp;jyusin_c_message_id=({$c_message_ru.c_message_id})">({$c_message_ru.subject})</a></span></td>
<td><span>({$c_message_ru.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

<div class="pagerRelative">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全てをチェック</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全てのチェックをはずす</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>受信メッセージ</h3></div>
<div class="block">
<p>メッセージがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "outbox"})

({if $count_c_message_s_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>送信済みメッセージ</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

<div class="pagerRelativeMulti">
({if $smarty.const.USE_MESSAGE_OPEN_UNOPEN}) 
<div class="text">
<p class="icons">
<span><img src="({t_img_url_skin filename=icon_mail_2})" alt="受信者開封済み" />受信者開封済み</span><br />
<span><img src="({t_img_url_skin filename=icon_mail_3})" alt="受信者未開封" />受信者未開封</span>
</p>
</div>
({/if})
<div class="pager">
({capture name=pager})({strip})
({if $s_data.is_s_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page-1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">前を表示</a></p>({/if})
<p class="number">({$total_num})件中 ({$s_data.s_page*$page_size-$page_size+1})件～
({if $s_data.s_page*$page_size > $count_c_message_s_list})
({$count_c_message_s_list+$s_data.s_page*$page_size-$page_size})
({else})
({$s_data.s_page*$page_size})
({/if})
件を表示</p>
({if $s_data.is_s_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page+1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">次を表示</a></p>({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})
</div>
</div>

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="({$box})" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">削除</th>
<th>宛先</th>
<th>件名</th>
<th>日付</th>
</tr>
({foreach from=$c_message_s_list item=c_message_s})
<tr>
<td class="status"><span>
({if $smarty.const.USE_MESSAGE_OPEN_UNOPEN})
({if $c_message_s.is_read})
<img src="({t_img_url_skin filename=icon_mail_2})" alt="受信者開封済み" />
({else})
<img src="({t_img_url_skin filename=icon_mail_3})" alt="受信者未開封" />
({/if})
({else})
<img src="({t_img_url_skin filename=icon_mail_3})" alt="" />
({/if})
</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_s.c_message_id})" /></span></td>
<td><span>({$c_message_s.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_s.c_message_id})&amp;box=outbox">({$c_message_s.subject})</a></span></td>
<td><span>({$c_message_s.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

<div class="pagerRelative">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全てをチェック</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全てのチェックをはずす</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>送信済みメッセージ</h3></div>
<div class="block">
<p>メッセージがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "savebox"})

({if $count_c_message_save_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>下書きメッセージ</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $save_data.is_save_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page-1})&amp;box=savebox">前を表示</a></p>({/if})
<p class="number">({$total_num})件中 ({$save_data.save_page*$page_size-$page_size+1})件～
({if $save_data.save_page*$page_size > $count_c_message_save_list })
({$count_c_message_save_list+$save_data.save_page*$page_size-$page_size })
({else})
({$save_data.save_page*$page_size})
({/if})
件を表示</p>
({if $save_data.is_save_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page+1})&amp;box=savebox">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="savebox" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">削除</th>
<th>宛先</th>
<th>件名</th>
<th>日付</th>
</tr>
({foreach from=$c_message_save_list item=c_message_save})
<tr>
<td class="status"><span><img src="({t_img_url_skin filename=icon_mail_1})" alt="" /></span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_save.c_message_id})" /></span></td>
<td><span>({$c_message_save.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_f_message_send})&amp;target_c_message_id=({$c_message_save.c_message_id})&amp;jyusin_c_message_id=({$c_message_save.hensinmoto_c_message_id})&amp;box=savebox">({$c_message_save.subject})</a></span></td>
<td><span>({$c_message_save.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全てをチェック</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全てのチェックをはずす</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>下書きメッセージ</h3></div>
<div class="block">
<p>メッセージがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "trash"})

({if $count_c_message_trash_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>ごみ箱メッセージ</h3></div>

<div class="pagerRelativeMulti">
<div class="text">
<p class="icons">
<span><img src="({t_img_url_skin filename=icon_mail_2})" alt="受信" />受信</span>
<span><img src="({t_img_url_skin filename=icon_mail_3})" alt="送信済み" />送信済み</span>
<span><img src="({t_img_url_skin filename=icon_mail_1})" alt="下書き" />下書き</span>
</p>
</div>
<div class="pager">
({capture name=pager})({strip})
({if $trash_data.is_trash_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page-1})&amp;box=trash">前を表示</a></p>({/if})
<p class="number">({$total_num})件中 ({$trash_data.trash_page*$page_size-$page_size+1})件～
({if $trash_data.trash_page*$page_size > $count_c_message_trash_list })
({$count_c_message_trash_list+$trash_data.trash_page*$page_size-$page_size })
({else})
({$trash_data.trash_page*$page_size})
({/if})
件を表示</p>
({if $trash_data.is_trash_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page+1})&amp;box=trash">次を表示</a></p>({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})
</div>
</div>

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="trash" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete"></th>
<th>相手</th>
<th>件名</th>
<th>日付</th>
</tr>
({foreach from=$c_message_trash_list item=c_message_trash})
<tr>
<td class="status"><span>({strip})
({if $c_message_trash.c_member_id_to == $u})({* 受信メッセージ *})
    <img src="({t_img_url_skin filename=icon_mail_2})" alt="受信" />
({else})
    ({if $c_message_trash.is_send})({* 送信メッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_3})" alt="送信済み" />
    ({else})({* 下書きメッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_1})" alt="下書き" />
    ({/if})
({/if})
({/strip})</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_trash.c_message_id})" /></span></td>
<td><span>({$c_message_trash.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;box=trash">({$c_message_trash.subject})</a></span></td>
<td><span>({$c_message_trash.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

<div class="pagerRelative">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全てをチェック</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全てのチェックをはずす</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="move" value="元に戻す" /></li>
<li><input type="submit" class="input_submit" name="remove" value="　削　除　" /></li>
</ul>
</div>

({/t_form_block})

<div class="partsInfo">
</div>
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>ごみ箱</h3></div>
<div class="block">
<p>メッセージがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
