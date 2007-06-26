({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">コミュニティ削除確認：({$c_commu.name})</font></center>
<hr>

削除してもよろしいですか？<br>

({t_form m=ktai a=do_c_edit_delete_c_commu})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a>

({$inc_ktai_footer|smarty:nodefaults})
