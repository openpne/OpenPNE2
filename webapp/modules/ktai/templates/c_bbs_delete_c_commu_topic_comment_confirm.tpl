({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">トピックコメント削除確認</font></center>
<hr>

本当に削除しますか？<br>

({t_form m=ktai a=do_c_bbs_delete_c_commu_topic_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment_id})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
