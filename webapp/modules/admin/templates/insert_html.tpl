({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="page_name" value="HTML挿入"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>HTML挿入</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">HTML挿入</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_html_head">【PC版】HTML挿入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_page_top">【PC版】HTML挿入(ページ上部)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_page_bottom">【PC版】HTML挿入(ページ下部)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_ktai_html_head">【携帯】HTML挿入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_ktai_header">【携帯】HTML挿入(ページ上部)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=inc_ktai_footer">【携帯】HTML挿入(ページ下部)</a></li>
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>
</h3>
({if $requests.target == 'sns_kiyaku' || $requests.target == 'sns_privacy'})
<p class="caution" id="c01">※HTMLタグは<strong>使用できません</strong>が、URLはリンクされます。</p>
({elseif $requests.target == 'daily_news_head' || $requests.target == 'daily_news_foot'})
({else})
<p class="caution" id="c01">※HTMLタグが使用できますが、タグの閉じ忘れ等がありますと表示が崩れるなどの問題が起こることがありますのでご注意ください。</p>
({/if})
({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_c_admin_info','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_siteadmin.body})</textarea>
<p class="textBtn"><input type="submit" value="変更する" /></p>
</form>
</td>
</tr>
</table>

<div class="contents">
({$inc_footer|smarty:nodefaults})