({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">トピック編集</font></center>
<hr>

({t_form m=ktai a=do_c_topic_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
タイトル<br>
<input type="text" name="title" value="({$c_topic.name})"><br>
本文<br>
<textarea name="body">({$c_topic.body})</textarea><br>
<input type="submit" value="編集">
</form>

<hr>
■ﾄﾋﾟｯｸ削除<br>
({t_form m=ktai a=page_c_topic_delete_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;({$tail})">ﾄﾋﾟｯｸに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
