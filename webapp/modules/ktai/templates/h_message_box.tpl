({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒｯｾｰｼﾞBOX(({if $box != 'outbox'})受信箱({else})送信箱({/if}))</font></center>
<hr>
<a href="#search" accesskey="1">1.検索</a>
<br><br>

<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ﾒｯｾｰｼﾞを書く</a><br>


({if $box != 'outbox' })
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

<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ﾒｯｾｰｼﾞを書く</a><br><br>

<a name="search"></a>
({t_form _method=get m=ktai a=page_h_message_box})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="box" value="({$box})">
<input type="text" name="keyword" value="({$keyword})">
<input type="submit" value="検索">
</form>

<hr>
({if $box != 'outbox'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a>
({else})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a>
({/if})
<br>
({$inc_ktai_footer|smarty:nodefaults})