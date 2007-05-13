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
({foreach from=$entry_point_list key=key item=item})
<dt><strong class="item">({$item[2]})</strong></dt>
<dd>
<ul>
({section name=menulist loop=$item[1]+1 start=$item[0]})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})&amp;target=({$key})&amp;num=({$smarty.section.menulist.index})">({$key}) ({$smarty.section.menulist.index})</a></li>
({/section})
</ul>
</dd>
({/foreach})
</dl>

</td>
<td class="detail">
<h3>({$entry_point_list[$requests.target][2]}) ({$requests.num})</h3>

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
({elseif $requests.target == 'h_diary_edit'})
<p class="image">
<img src="modules/admin/img/entry_point_h_diary_edit.gif" />
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
