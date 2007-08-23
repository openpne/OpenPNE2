({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu_topic.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾄﾋﾟｯｸとｺﾒﾝﾄの削除<br>
</td></tr></table>

このﾄﾋﾟｯｸを本当に削除しますか?<br>
(ｺﾒﾝﾄも削除されますのでご注意ください)<br>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_c_bbs_delete_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_c_topic_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
