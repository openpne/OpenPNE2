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

({* #1939 *})<!-- ******ここから：トップページに戻る****** -->
({* #1939 *})<div class="content_footer" align="center">
({* #1939 *})
({* #1939 *})({if $msg == 1})
({* #1939 *})【<a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ一覧</a>】
({* #1939 *})({elseif $msg == 2})
({* #1939 *})【<a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書きメッセージ一覧</a>】
({* #1939 *})({/if})
({* #1939 *})
({* #1939 *})</div>
({* #1939 *})<!-- ******ここまで：トップページに戻る****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
