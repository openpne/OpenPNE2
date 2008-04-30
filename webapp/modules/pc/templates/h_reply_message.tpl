({assign var=no_use_alert value=true})
<div id="LayoutC">
<div id="Center">

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({if $msg == 1})メッセージを送る({elseif $msg == 2})メッセージを下書き保存({else})&nbsp;({/if})</h3></div>
<div class="block">
<p>({if $msg == 1})送信完了しました。({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})
({elseif $msg == 2})下書きメッセージを保存しました。
({else})&nbsp;({/if})</p>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
({if $msg == 1})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ一覧</a></li>
({elseif $msg == 2})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書きメッセージ一覧</a></li>
({/if})
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
