({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({******************************})
({**ここから：メインコンテンツ**})
({******************************})


<div class="section">
<dl class="item">
<dt class="heading bg_06">あしあと</dt>
<dd class="description">
<p>({$c_member.nickname})さんのページを訪れた人たちです。最新30件までを表示、同一人物・同一日付のアクセスは最新の日時だけが表示されます。</p>
</dd>
<dd class="data"><div id="ashiato">
({if $c_ashiato_list})
<p>ページ全体のアクセス数：<strong>({$c_ashiato_num})</strong> アクセス</p>
<ul id="ashiato_list">
({foreach from=$c_ashiato_list item=c_ashiato})
	<li>({$c_ashiato.r_datetime|date_format:"%Y年%m月%d日 %H:%M"}) <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_ashiato.c_member_id_from})">({$c_ashiato.nickname|default:"&nbsp;"})</a></li>
({/foreach})
</ul>
({else})
<p>まだあしあとはありません。</p>
({/if})
</div></dd>
</dl>
</div>
({******************************})
({**ここまで：メインコンテンツ**})
({******************************})

({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
