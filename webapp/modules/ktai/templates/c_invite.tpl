({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})紹介</font><br>
</td></tr></table>

({if $c_friend_list})

({$WORD_MY_FRIEND_HALF})に({$WORD_COMMUNITY_HALF})を紹介するﾒｯｾｰｼﾞを送信します。<br>
({$WORD_COMMUNITY_HALF})管理者から紹介した場合には、承認制の({$WORD_COMMUNITY_HALF})にも承認無しで参加できます。<br>
<br>

({t_form m=ktai a=do_c_invite_insert_c_message_commu_invite})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">紹介先：</font><br>
<select name="target_c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id})">({$c_friend.nickname})
({/foreach})
</select>
<br>
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6">「({$c_commu.name})」({$WORD_COMMUNITY_HALF})に入ってみました。よかったら一緒にどうですか?</textarea><br>
<br>
<input type="submit" value="ﾒｯｾｰｼﾞを送信する">
</form>

<br>
※紹介先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_c_invite})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">ここ</a>を押して画面を更新してください
({else})
紹介できる({$WORD_MY_FRIEND_HALF})がいません。
({/if})

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
