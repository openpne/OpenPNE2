({$inc_header|smarty:nodefaults})
<div class="subNavi"></div>
</div>

({*ここまで:navi*})


({if $msg})
<p class="actionMsg">({$msg})</p>
({else})
({/if})

<div class="contents">

({if $msg})
({else})
<div class="info">
<p>上部メニューから設定したい項目を選択してください。</p>
</div>({*/div class="info"*})
({/if})

({if $smarty.const.DISPLAY_OPENPNE_INFO})
({if $admin_info})
<div class="topics">
<h2>トピックス</h2>
<dl>
({foreach from=$admin_info item=item})
<dt>({$item.date|date_format:"%m/%d"})</dt>
<dd><a href="({$item.link})">({$item.date|date_format:"%m/%d"}) ({$item.title})</a></dd>
({/foreach})
</dl>
</div>({*/div class="topics"*})
({/if})
({/if})

<br class="clear" />

({$inc_footer|smarty:nodefaults})