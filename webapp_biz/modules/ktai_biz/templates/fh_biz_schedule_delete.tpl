({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">予定削除</font></center>
<hr>
({*BEGIN:container*})

<center>
本当に削除しますか？<br>
<br>

({t_form m=ktai_biz a=do_fh_biz_schedule_delete})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="submit" value="はい">
</form>

({t_form m=ktai_biz a=page_fh_biz_schedule_view})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" value="いいえ">
</form>

</center>


<hr>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$t_id})&amp;({$tail})" accesskey="0">0.ﾎｰﾑ</a><br>

({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
