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
<dt><strong class="item">フッター</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_footer_before">ログイン前フッター</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_footer_after">ログイン後フッター</a></li>
</ul>
</dd>
<dt><strong class="item">PC版全ページ共通</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_html_head">HTML挿入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_top2">HTML挿入&nbsp;A</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_top">HTML挿入&nbsp;B</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_bottom2">HTML挿入&nbsp;C</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_bottom">HTML挿入&nbsp;D</a></li>
</ul>
</dd>
<dt><strong class="item">携帯版全ページ共通</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_html_head">HTML挿入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_header">HTML挿入(ページ上部)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_footer">HTML挿入(ページ下部)</a></li>
</ul>
</dd>
</dl>

</td>
<td class="detail">
<h3>
({if $title == 'inc_page_footer_before'})
ログイン前フッター
({elseif $title == 'inc_page_footer_after'})
ログイン後フッター
({elseif $title == 'inc_html_head'})
【PC版】HTML挿入(HTML head内)
({elseif $title == 'inc_page_top2'})
【PC版】HTML挿入 A
({elseif $title == 'inc_page_top'})
【PC版】HTML挿入 B　（旧：【PC版】HTML挿入(ページ上部)）
({elseif $title == 'inc_page_bottom2'})
【PC版】HTML挿入 C
({elseif $title == 'inc_page_bottom'})
【PC版】HTML挿入 D　（旧：【PC版】HTML挿入(ページ下部)）
({elseif $title == 'inc_ktai_html_head'})
【携帯版】HTML挿入(HTML head内)
({elseif $title == 'inc_ktai_header'})
【携帯版】HTML挿入(ページ上部)
({elseif $title == 'inc_ktai_footer'})
【携帯版】HTML挿入(ページ下部)
({/if})
</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
({if $requests.target == 'sns_kiyaku' || $requests.target == 'sns_privacy'})
<p class="caution" id="c01">※HTMLタグは<strong>使用できません</strong>が、URLはリンクされます。</p>
({elseif $requests.target == 'daily_news_head' || $requests.target == 'daily_news_foot'})
({else})
<p class="caution" id="c01">※HTMLタグが使用できますが、タグの閉じ忘れ等がありますと表示が崩れるなどの問題が起こることがありますのでご注意ください。</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_html','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$title})" />
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_siteadmin.body})</textarea>
<p class="textBtn"><input type="submit" value="変更する" /></p>
</form>

<h4>テンプレート挿入場所対応図[({if $title == 'inc_page_footer_before'})
ログイン前フッター
({elseif $title == 'inc_page_footer_after'})
ログイン後フッター
({elseif $title == 'inc_html_head'})
【PC版】HTML挿入(HTML head内)
({elseif $title == 'inc_page_top2'})
【PC版】HTML挿入 A
({elseif $title == 'inc_page_top'})
【PC版】HTML挿入 B　（旧：【PC版】HTML挿入(ページ上部)）
({elseif $title == 'inc_page_bottom2'})
【PC版】HTML挿入 C
({elseif $title == 'inc_page_bottom'})
【PC版】HTML挿入 D　（旧：【PC版】HTML挿入(ページ下部)）
({elseif $title == 'inc_ktai_html_head'})
【携帯版】HTML挿入(HTML head内)
({elseif $title == 'inc_ktai_header'})
【携帯版】HTML挿入(ページ上部)
({elseif $title == 'inc_ktai_footer'})
【携帯版】HTML挿入(ページ下部)
({/if})]</h4>
({if $requests.target == 'inc_page_top2' || $requests.target == 'inc_page_top' || $requests.target == 'inc_page_bottom2' || $requests.target == 'inc_page_bottom'})
<p class="caution" id="c02">※内容が空のときはHTML挿入部分が表示されないので各HTML挿入部分に該当する隙間はブラウザ内枠との間に生じません。</p>

<p class="image">
<img src="modules/admin/img/insert_HTML.gif" />
</p>
({elseif $title == 'inc_page_footer_before'})
<p class="caution" id="c02">※ログイン画面下部にも反映されます。</p>

<p class="image">
<img src="modules/admin/img/insert_HTML_footer_before.gif" />
</p>
({elseif $title == 'inc_page_footer_after'})
<p class="image">
<img src="modules/admin/img/insert_HTML_footer.gif" />
</p>
({elseif $title == 'inc_html_head' || $title == 'inc_ktai_html_head'})
<p class="caution" id="c02">※HEADタグ内に配置されるので、外観上の挿入ポイントはありません。</p>

({elseif $title == 'inc_ktai_header' || $title == 'inc_ktai_footer'})
<p class="image">
<img src="modules/admin/img/insert_HTML_k-tai.gif" />
</p>

({/if})

</td>
</tr>
</table>

<div class="contents">
({$inc_footer|smarty:nodefaults})
