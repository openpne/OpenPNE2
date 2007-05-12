({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="テンプレート挿入"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>テンプレート挿入(<img src="./modules/admin/img/icn_exclamation.gif" alt="上級者向け設定" class="icn" />上級者向け設定)</h2>
<div class="contents">
<p class="caution" id="c01">※Smartyテンプレート形式で記述します。</p>
<p class="caution" id="c02">誤った形式で記述すると、ページを正しく表示することができなくなってしまいます。<br />元に戻す場合は、内容を空にして変更してください。</p>

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

<dt><strong class="item">【PC版】 h_diary_add</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_diary_add&amp;num=1">h_diary_add 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_diary_add&amp;num=2">h_diary_add 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=h_diary_add&amp;num=3">h_diary_add 3</a></li>
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

<dt><strong class="item">【携帯版】 f_home</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_f_home&amp;num=1">f_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_f_home&amp;num=2">f_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_f_home&amp;num=3">f_home 3</a></li>
</ul>
</dd>

<dt><strong class="item">【携帯版】 c_home</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_c_home&amp;num=1">c_home 1</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_c_home&amp;num=2">c_home 2</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=ktai_c_home&amp;num=3">c_home 3</a></li>
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
({elseif $requests.target == 'h_reply_message'})
【PC版】 h_reply_message ({$requests.num})
({elseif $requests.target == 'h_diary_add'})
【PC版】 h_diary_add ({$requests.num})
({else})
【携帯版】 ({$requests.target}) ({$requests.num})
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
<h4>テンプレート挿入場所対応図[ ({$requests.target}) ]</h4>
({if $requests.target == 'h_home' || $requests.target == 'f_home' || $requests.target == 'c_home'})
<p class="image">
<img src="modules/admin/img/({$requests.target})_small.gif" />
</p>
({elseif $requests.target == 'h_reply_message'})
<p class="image">
<img src="modules/admin/img/entry_point_h_reply_message.gif" />
</p>
({elseif $requests.target == 'h_diary_add'})
<p class="image">
<img src="modules/admin/img/entry_point_h_diary_add.gif" />
</p>


({elseif $requests.target == 'ktai_o_login'})
<p class="image">
<img src="modules/admin/img/entry_point_k-tai_o_login.gif" />
</p>
({elseif $requests.target == 'ktai_h_home'})
<p class="image">
<img src="modules/admin/img/entry_point_k-tai_h_home.gif" />
</p>
({elseif $requests.target == 'ktai_f_home'})
<p class="image">
<img src="modules/admin/img/entry_point_k-tai_f_home.gif" />
</p>
({elseif $requests.target == 'ktai_c_home'})
<p class="image">
<img src="modules/admin/img/entry_point_k-tai_c_home.gif" />
</p>
({/if})
</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})
