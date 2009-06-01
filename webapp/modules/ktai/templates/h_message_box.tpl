({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({if $box == 'trash'})ごみ箱({elseif $box == 'savebox'})下書き({elseif $box != 'outbox'})受信箱({else})送信箱({/if})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒｯｾｰｼﾞﾘｽﾄ</font><br>
</td></tr></table>
({if !$total_num})
ﾒｯｾｰｼﾞはありません。
({else})
<center>
({$pager.start})件～({$pager.end})件を表示
</center>

({if $box == 'trash'})

({capture name="pager"})
({if $is_prev_t || $is_next_t})
<center>
({if $is_prev_t})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;page_t=({$page_t-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a> ({/if})
({if $is_next_t})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;page_t=({$page_t+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
({/capture})

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_message_trash_list item=c_message_trash})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$c_message_trash.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;({$tail})">({$c_message_trash.subject|default:"&nbsp;"|t_truncate:50:""})</a>(({$c_message_trash.nickname|t_truncate:17:""|default:"&nbsp;"})さん)
({if $c_message_trash.c_member_id_to != $u})<font color="#({$ktai_color_config.font_06})">(★)</font>({/if})
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
※送信済ﾒｯｾｰｼﾞ…<font color="#({$ktai_color_config.font_06})">(★)</font>
<br>

({$smarty.capture.pager|smarty:nodefaults})

({elseif $box == 'savebox'})
({capture name="pager"})
({if $is_prev_v || $is_next_v})
<center>
({if $is_prev_v})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=savebox&amp;page_v=({$page_v-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="4">[i:128]前を表示</a> ({/if})
({if $is_next_v})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=savebox&amp;page_v=({$page_v+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
({/capture})

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_message_saved_list item=c_message_saved})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$c_message_saved.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_h_message_send})&amp;target_c_message_id=({$c_message_saved.c_message_id})&amp;({$tail})">({$c_message_saved.subject|default:"&nbsp;"|t_truncate:50:""})</a>（({$c_message_saved.nickname|t_truncate:17:""|default:"&nbsp;"})さん）
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

({elseif $box != 'outbox'})
({capture name="pager"})
({if $is_prev_r || $is_next_r})
<center>
({if $is_prev_r})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;page_r=({$page_r-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="4">[i:128]前を表示</a> ({/if})
({if $is_next_r})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;page_r=({$page_r+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
({/capture})

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_message_received_list item=c_message_received})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$c_message_received.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_received.c_message_id})&amp;({$tail})">({$c_message_received.subject|default:"&nbsp;"|t_truncate:50:""})</a>（({$c_message_received.nickname|t_truncate:17:""|default:"&nbsp;"})さん）
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

({else})
({capture name="pager"})
({if $is_prev_s || $is_next_s})
<center>
({if $is_prev_s})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;page_s=({$page_s-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="4">[i:128]前を表示</a> ({/if})
({if $is_next_s})<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;page_s=({$page_s+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
({/capture})
<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_message_sent_list item=c_message_sent})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$c_message_sent.r_datetime|date_format:"%Y/%m/%d %H:%M"})({if $smarty.const.USE_MESSAGE_OPEN_UNOPEN})（({if $c_message_sent.is_read})開封済({else})未開封({/if})）({/if})<br>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_sent.c_message_id})&amp;({$tail})">({$c_message_sent.subject|default:"&nbsp;"|t_truncate:50:""})</a>（({$c_message_sent.nickname|t_truncate:17:""|default:"&nbsp;"})さん）<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})
({/if})

({/if})

({if $box != 'trash' && $box != 'savebox'})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">ﾒｯｾｰｼﾞ検索</font><br>
</td></tr>
</table>
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
({t_form _method=get m=ktai a=page_h_message_box})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="box" value="({$box})">
<input type="text" name="keyword" value="({$keyword})">
<center>
<input type="submit" value="検索する">
</center>
</form>
({/if})

<hr color="#({$ktai_color_config.border_01})">
({if $box == 'trash'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=savebox&amp;({$tail})">下書き</a><br>
({elseif $box == 'savebox'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({elseif $box != 'outbox'})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=savebox&amp;({$tail})">下書き</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({else})
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=savebox&amp;({$tail})">下書き</a><br>
<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({/if})
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ﾒｯｾｰｼﾞを書く</a><br>
({$inc_ktai_footer|smarty:nodefaults})
