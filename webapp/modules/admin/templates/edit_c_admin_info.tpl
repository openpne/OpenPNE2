({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="page_name" value="お知らせ・規約設定"})
({ext_include file="inc_tree_adminDesign.tpl"})
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
＜携帯版＞({$WORD_DIARY})ページのお知らせ
({elseif $requests.target == 'k_f_home'})
＜携帯版＞({$WORD_FRIEND})ページのお知らせ
({elseif $requests.target == 'k_c_home'})
＜携帯版＞({$WORD_COMMUNITY})ページのお知らせ
({elseif $requests.target == 'sns_kiyaku'})
利用規約
({elseif $requests.target == 'sns_privacy'})
プライバシーポリシー
({elseif $requests.target == 'daily_news_head'})
デイリーニュース上部
({elseif $requests.target == 'daily_news_foot'})
デイリーニュース下部
({/if})
</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
({if $requests.target == 'sns_kiyaku' || $requests.target == 'sns_privacy'})
<p class="caution" id="c01">※HTMLタグは<strong>使用できません</strong>が、URLはリンクされます。</p>
({elseif $requests.target == 'daily_news_head' || $requests.target == 'daily_news_foot'})
({elseif $requests.target == 'k_h_home' || $requests.target == 'k_fh_diary' || $requests.target == 'k_f_home' || $requests.target == 'k_c_home'})
<p class="caution" id="c01">※HTMLタグが使用できますが、タグの閉じ忘れ等がありますと表示が崩れるなどの問題が起こることがありますのでご注意ください。<br />
※携帯版のお知らせ内に外部サイトへのリンクを含めると、外部サイトにリファラから「第三者によるログインが可能な情報」が漏えいする危険性があります。</p>
({else})
<p class="caution" id="c01">※HTMLタグが使用できますが、タグの閉じ忘れ等がありますと表示が崩れるなどの問題が起こることがありますのでご注意ください。</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_c_admin_info','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_siteadmin.body})</textarea>
<p class="textBtn"><input type="submit" value="変更する" /></p>
</form>
({if $requests.target == 'k_h_home' || $requests.target == 'k_fh_diary' || $requests.target == 'k_f_home'|| $requests.target == 'k_c_home'})
<h4>【携帯】お知らせ挿入場所対応図[ ({if $requests.target == 'k_h_home'})
ホーム
({elseif $requests.target == 'k_f_home'})
({$WORD_FRIEND})ページ
({elseif $requests.target == 'k_c_home'})
({$WORD_COMMUNITY})ページ
({elseif $requests.target == 'k_fh_diary'})
({$WORD_DIARY})ページ
({/if}) ]</h4>
<p class="image">
<img src="modules/admin/img/admin_info_({$requests.target}).gif" />
</p>
({/if})
</td>
</tr>
</table>

<div class="contents">
({$inc_footer|smarty:nodefaults})
