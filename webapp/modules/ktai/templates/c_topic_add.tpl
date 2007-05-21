({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu.name})</font></center>
<hr>

■トピック作成<br>
({if $msg})
<font color="red">({$msg})</font><br>
({/if})
<br>
({t_form m=ktai a=do_c_topic_add_insert_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
トピック名<br>
<input type="text" name="title" value="" maxlength="126"><br>
本文<br>
<textarea name="body"></textarea><br>
<input type="submit" value="トピック作成">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})