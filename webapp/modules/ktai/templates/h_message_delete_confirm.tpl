({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒｯｾｰｼﾞ削除確認</font></center>
<hr>

ﾒｯｾｰｼﾞを完全に削除しますか？<br>

({t_form m=ktai a=do_h_message_delete_c_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message_id})">
<input type="submit" value="削除する">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
