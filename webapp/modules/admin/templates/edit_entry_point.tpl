({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;デザインカスタマイズ：テンプレート挿入</div>
</div>

({*ここまで:navi*})

<h2>テンプレート挿入(<img src="./modules/admin/img/icn_exclamation.gif" alt="上級者向け設定" class="icn" />上級者向け設定)</h2>
<div class="contents">
<p class="caution" id="c01">※Smartyテンプレート形式で記述します。</p>
<p class="caution" id="c02">誤った形式で記述すると、ページを正しく表示することができなくなってしまいます。<br />元に戻す場合は、内容を空にして変更してください。</p>

</div>({*/div class="contents"*})

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">【PC版】 h_home</strong></dt>
<dd>
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
</dd>
<dt><strong class="item">【PC版】 f_home (h_prof)</strong></dt>
<dd>
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
</dd>
<dt><strong class="item">【PC版】 c_home</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=1">c_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=2">c_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=3">c_home 3</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=4">c_home 4</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=5">c_home 5</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=6">c_home 6</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=c_home&amp;num=7">c_home 7</a></li>
</ul>
</dd>

<dt><strong class="item">【PC版】 h_reply_message</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_reply_message&amp;num=1">h_reply_message 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_reply_message&amp;num=2">h_reply_message 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_reply_message&amp;num=3">h_reply_message 3</a></li>
</ul>
</dd>

<dt><strong class="item">【携帯版】 o_login</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_o_login&amp;num=1">o_login 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_o_login&amp;num=2">o_login 2</a></li>
</ul>
</dd>

<dt><strong class="item">【携帯版】 h_home</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_h_home&amp;num=1">h_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_h_home&amp;num=2">h_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_h_home&amp;num=3">h_home 3</a></li>
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>({if $requests.target == 'h_home'})
【PC版】 h_home ({$requests.num})
({elseif $requests.target == 'f_home'})
【PC版】 f_home (h_prof) ({$requests.num})
({elseif $requests.target == 'c_home'})
【PC版】 c_home ({$requests.num})
({/if})</h3>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_entry_point','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<input type="hidden" name="num" value="({$requests.num})" />
<textarea name="source" cols="({$cols|default:60})" rows="({$rows|default:10})">({$source})</textarea>
<p class="textBtn"><input type="submit" value="変更する" /></p>
</form>
<dl class="image">
<dt>テンプレート挿入場所対応図[ ({$requests.target}) ]</dt>
<dd><img src="modules/admin/img/({$requests.target})_small.gif"></dd>
</dl>
</td>
</tr>
</table>

</div>
({$inc_footer|smarty:nodefaults})
