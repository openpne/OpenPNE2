({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒｯｾｰｼﾞBOX(({if $box == 'trash'})ごみ箱({elseif $box != 'outbox'})受信箱({else})送信箱({/if}))</font></center>
<hr>
({if $box != 'trash'})
<a href="#search" accesskey="1">1.検索</a>
<br><br>

<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ﾒｯｾｰｼﾞを書く</a><br>
({/if})

({if $box == 'trash'})
<br>
[削除済ﾒｯｾｰｼﾞ（({if $total_num})({$total_num})({else})0({/if})）]<br>

({capture name="pager"})
({if $is_prev_t || $is_next_t})
<br>
({if $is_prev_t})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;page_t=({$page_t-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next_t})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;page_t=({$page_t+1})&amp;({$tail})">次へ</a>({/if})
<br>
({$total_num})件中 
({$pager.start})件～({$pager.end})件を表示<br>
<br>
({/if})
({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({if $total_num})
({foreach from=$c_message_trash_list item=c_message_trash})
({$c_message_trash.r_datetime|date_format:"%y/%m/%d"})-({$c_message_trash.nickname|default:"&nbsp;"})さん<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;({$tail})">({$c_message_trash.subject|default:"&nbsp;"})</a>
({if $c_message_trash.c_member_id_to != $u}) (★)({/if})
<br>
({/foreach})
<br>
※送信済ﾒｯｾｰｼﾞ…(★)
<br>
({else})
<br>ﾒｯｾｰｼﾞはありません<br><br>
({/if})

({$smarty.capture.pager|smarty:nodefaults})

({elseif $box != 'outbox' })
<br>
[受信ﾒｯｾｰｼﾞ（({if $total_num})({$total_num})({else})0({/if})）]<br>

({capture name="pager"})
({if $is_prev_r || $is_next_r})
<br>
({if $is_prev_r})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;page_r=({$page_r-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">前へ</a> ({/if})
({if $is_next_r})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;page_r=({$page_r+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">次へ</a>({/if})
<br>
({$total_num})件中 
({$pager.start})件～({$pager.end})件を表示<br>
<br>
({/if})
({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({if $total_num})
({foreach from=$c_message_received_list item=c_message_received})
<tr>
({$c_message_received.r_datetime|date_format:"%y/%m/%d"})-({$c_message_received.nickname|default:"&nbsp;"})さん<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_received.c_message_id})&amp;({$tail})">({$c_message_received.subject|default:"&nbsp;"})</a><br>
({/foreach})
({else})
ﾒｯｾｰｼﾞはありません<br><br>
({/if})

({$smarty.capture.pager|smarty:nodefaults})

({else})

<br>
[送信済ﾒｯｾｰｼﾞ（({if $total_num})({$total_num})({else})0({/if})）]<br>

({capture name="pager"})
({if $is_prev_s || $is_next_s})
<br>
({if $is_prev_s})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;page_s=({$page_s-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">前へ</a> ({/if})
({if $is_next_s})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;page_s=({$page_s+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">次へ</a>({/if})
<br>
({$total_num})件中 
({$pager.start})件～({$pager.end})件を表示<br>
<br>
({/if})
({/capture})
({$smarty.capture.pager|smarty:nodefaults})


({if $total_num})
({foreach from=$c_message_sent_list item=c_message_sent})
({$c_message_sent.r_datetime|date_format:"%y/%m/%d"})-({$c_message_sent.nickname|default:"&nbsp;"})さん<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_sent.c_message_id})&amp;({$tail})">({$c_message_sent.subject|default:"&nbsp;"})</a><br>
({/foreach})
({else})
ﾒｯｾｰｼﾞはありません<br><br>
({/if})

({$smarty.capture.pager|smarty:nodefaults})

({/if})

({if $box != 'trash'})
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ﾒｯｾｰｼﾞを書く</a><br><br>

<a name="search"></a>
({t_form _method=get m=ktai a=page_h_message_box})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="box" value="({$box})">
<input type="text" name="keyword" value="({$keyword})">
<input type="submit" value="検索">
</form>
({/if})

<hr>
({if $box == 'trash'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
({elseif $box != 'outbox'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({else})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({/if})
<br>
({$inc_ktai_footer|smarty:nodefaults})