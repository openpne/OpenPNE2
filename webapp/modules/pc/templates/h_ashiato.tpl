<div id="LayoutC">
<div id="Center">

({if $c_ashiato_list})

({* {{{ ashiatoList *})
<div class="dparts ashiatoList"><div class="parts">
<div class="partsHeading"><h3>あしあと</h3></div>
<div class="partsInfo">
<p>({$c_member.nickname})さんのページを訪れた人たちです。最新30件までを表示、同一人物・同一日付のアクセスは最新の日時だけが表示されます。</p>
</div>
<div class="item">
<p>ページ全体のアクセス数：<strong>({$c_ashiato_num})</strong> アクセス</p>
<ul class="list">
({foreach from=$c_ashiato_list item=c_ashiato})
<li>({$c_ashiato.r_datetime|date_format:"%Y年%m月%d日 %H:%M"}) <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_ashiato.c_member_id_from})">({$c_ashiato.nickname|default:"&nbsp;"})</a></li>
({/foreach})
</ul>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>あしあと</h3></div>
<div class="block">
<p>まだあしあとはありません。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
