({$inc_header|smarty:nodefaults})

<h2>テンプレート挿入 (上級者向け設定)</h2>

<table>
<tr>
<td style="vertical-align:top;">

【PC版】 h_home
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=1">h_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=2">h_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=3">h_home 3</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=4">h_home 4</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=5">h_home 5</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=6">h_home 6</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=7">h_home 7</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=8">h_home 8</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=9">h_home 9</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=10">h_home 10</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=11">h_home 11</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_home&amp;num=12">h_home 12</a></li>
</ul>

【PC版】 f_home (h_prof)
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=1">f_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=2">f_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=3">f_home 3</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=4">f_home 4</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=5">f_home 5</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=6">f_home 6</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=7">f_home 7</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=8">f_home 8</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=f_home&amp;num=9">f_home 9</a></li>
</ul>

【PC版】 c_home
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=1">c_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=2">c_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=3">c_home 3</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=4">c_home 4</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=5">c_home 5</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=6">c_home 6</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=7">c_home 7</a></li>
</ul>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})">戻る</a></li>
</ul>
</td>

<td style="vertical-align:top;">
<p>
({if $requests.target == 'h_home'})
【PC版】 h_home ({$requests.num})
({elseif $requests.target == 'f_home'})
【PC版】 f_home (h_prof) ({$requests.num})
({elseif $requests.target == 'c_home'})
【PC版】 c_home ({$requests.num})
({/if})
</p>

({if $msg})
<div class="caution">({$msg})</div>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_entry_point','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target" value="({$requests.target})">
<input type="hidden" name="num" value="({$requests.num})">
<textarea name="source" cols="({$cols|default:60})" rows="({$rows|default:10})">({$source})</textarea><br>
<input type="submit" class="submit" value="変更">
</form>

<p class="caution">※Smartyテンプレート形式で記述します。<br>
誤った形式で記述すると、ページを正しく表示することができなくなってしまいます。<br>
元に戻す場合は、内容を空にして変更してください。</p>

<p>
[ ({$requests.target}) ]<br>
<img src="modules/admin/img/({$requests.target})_small.gif">
</p>

</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})