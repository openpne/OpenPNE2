({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">アクセスブロック設定</font></center>
<hr>

アクセスをブロックするメンバーのIDを指定します。<br>
<br>

({t_form m=ktai a=do_h_config_access_block_update})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({foreach from=$c_member_id_block item=item})
ID <input type="text" name="c_member_id_block[]" value="({$item})"><br>
({/foreach})
ID <input type="text" name="c_member_id_block[]" value=""><br>
<input type="submit" value="変更"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
