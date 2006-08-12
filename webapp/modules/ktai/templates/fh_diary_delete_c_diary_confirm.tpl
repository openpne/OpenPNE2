({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">日記削除確認</font></center>
<hr>

本当に削除しますか？<br>

({t_form m=ktai a=do_fh_diary_delete_c_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary_id})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
