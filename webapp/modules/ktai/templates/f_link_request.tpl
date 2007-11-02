({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_MY_FRIEND_HALF})に追加</font><br>
</td></tr></table>

<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さん</a>とは既にお知り合いですか?
({$WORD_MY_FRIEND_HALF})申請ﾒｯｾｰｼﾞを送信し、承認を受けてください。<br>
※交流の無い方へいきなりﾘﾝｸ申請を送るのは、失礼になる場合もあります。十分に確認して、ﾘﾝｸ申請をおこなってください。
<hr color="#({$ktai_color_config.border_01})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
({t_form m=ktai a=do_f_link_request_insert_c_friend_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})">
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="送信">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:140]<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
