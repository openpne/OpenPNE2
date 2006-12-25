({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})

({assign var="page_name" value="お知らせ・規約設定"})
({ext_include file="inc_tree_adminInfoKiyaku.tpl"})
</div>

({*ここまで:navi*})

<h2>お知らせ・規約設定</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">お知らせ</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=h_home">【PC版】 h_homeのお知らせ</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_h_home">【携帯】 h_homeのお知らせ</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_fh_diary">【携帯】 fh_diaryのお知らせ</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_f_home">【携帯】 f_homeのお知らせ</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_c_home">【携帯】 c_homeのお知らせ</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=daily_news_head">デイリーニュース上部</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=daily_news_foot">デイリーニュース下部</a></li>
</ul>
</dd>
<dt><strong class="item">規約</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=sns_kiyaku">利用規約</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=sns_privacy">プライバシーポリシー</a></li>
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>
({if $requests.target == 'h_home'})
＜ＰＣ版＞ホームのお知らせ
({elseif $requests.target == 'k_h_home'})
＜携帯版＞ホームのお知らせ
({elseif $requests.target == 'k_fh_diary'})
＜携帯版＞日記ページのお知らせ
({elseif $requests.target == 'k_f_home'})
＜携帯版＞フレンドページのお知らせ
({elseif $requests.target == 'k_c_home'})
＜携帯版＞コミュニティページのお知らせ
({elseif $requests.target == 'sns_kiyaku'})
利用規約
({elseif $requests.target == 'sns_privacy'})
プライバシーポリシー
({elseif $requests.target == 'daily_news_head'})
デイリーニュース上部
({elseif $requests.target == 'daily_news_foot'})
デイリーニュース下部
({elseif $requests.target == 'inc_html_head'})
【PC版】HTML挿入(HTML head内)
({elseif $requests.target == 'inc_page_top'})
【PC版】HTML挿入(ページ上部)
({elseif $requests.target == 'inc_page_bottom'})
【PC版】HTML挿入(ページ下部)
({elseif $requests.target == 'inc_ktai_html_head'})
【携帯】HTML挿入(HTML head内)
({elseif $requests.target == 'inc_ktai_header'})
【携帯】HTML挿入(ページ上部)
({elseif $requests.target == 'inc_ktai_footer'})
【携帯】HTML挿入(ページ下部)
({/if})
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