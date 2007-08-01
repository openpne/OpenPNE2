({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒｯｾｰｼﾞ削除確認</font></center>
<hr>

ﾒｯｾｰｼﾞをごみ箱に移動しますか？<br>

({t_form m=ktai a=do_h_message_update_c_message_is_deleted})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message_id})">
<input type="submit" value="移動する">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$c_message_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
