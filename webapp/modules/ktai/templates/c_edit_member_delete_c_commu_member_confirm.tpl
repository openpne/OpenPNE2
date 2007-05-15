({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ削除確認</font></center>
<hr>

本当に削除しますか？<br>

({t_form m=ktai a=do_c_edit_member_delete_c_commu_member})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
