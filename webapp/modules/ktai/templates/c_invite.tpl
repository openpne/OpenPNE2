({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ紹介</font></center>
<hr>
({if $c_friend_list})

({$WORD_MY_FRIEND_HALF})にｺﾐｭﾆﾃｨを紹介するﾒｯｾｰｼﾞを送信します。<br>
<br>

({t_form m=ktai a=do_c_invite_insert_c_message_commu_invite})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
紹介先<br>
<select name="target_c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id})">({$c_friend.nickname})
({/foreach})
</select>
<br>
ﾒｯｾｰｼﾞ<br>
<textarea name="body">「({$c_commu.name})」ｺﾐｭﾆﾃｨに入ってみました。よかったら一緒にどうですか？</textarea><br>
<input type="submit" value="送信">
</form>

※ｺﾐｭﾆﾃｨ管理人から紹介した場合には、承認制のｺﾐｭﾆﾃｨにも承認無しで参加できます。<br>
<br>
※送信先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_c_invite})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">ここ</a>を押して画面を更新してください
({else})
紹介できる({$WORD_MY_FRIEND_HALF})がいません。
({/if})

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})