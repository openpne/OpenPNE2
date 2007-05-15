({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$WORD_MY_FRIEND_HALF})削除確認</font></center>
<hr>

本当に({$WORD_MY_FRIEND_HALF})から外しますか？<br>

({t_form m=ktai a=do_fh_friend_list_delete_c_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="submit" value="外す">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_manage_friend})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
