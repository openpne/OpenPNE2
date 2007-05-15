({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">プロフィール画像削除確認</font></center>
<hr>

本当に削除しますか？<br>

({t_form m=ktai a=do_h_config_image_delete_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="img_num" value="({$img_num})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config_image})&amp;({$tail})">ｷｬﾝｾﾙして戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
