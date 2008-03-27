<div id="LayoutC">
<div id="Center">

({* {{{ alertBox *})
<div class="dparts alertBox"><div class="parts">
<table><tr>
<th><img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="({t_img_url_skin filename=icon_alert_l})" class="icon">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</th>
<td>({$smarty.const.SNS_NAME}) のURLが変更になりました。<br />
<br />
お気に入り（ブックマーク）に登録されている方、リンクされている方は
以下のURLに変更していただきますよう、お願いいたします。<br />
<br />
新しいURLは以下になります。<br />
<a href="({$url})">({$url})</a><br />
({if $wait > 0})
※({$wait})秒後に自動的に移動します。
({/if})</td>
</tr></table>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
