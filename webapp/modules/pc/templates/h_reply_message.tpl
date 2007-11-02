({assign var=no_use_alert value=true})

({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：送信完了メッセージ****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center">
<!-- *ここから：送信完了メッセージ内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" style="width:566px;" cellspacing="0" align="center" cellpadding="0" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({if $msg == 1})
メッセージを送る
({elseif $msg == 2})
メッセージを下書き保存
({else})
&nbsp;
({/if})
</span>
</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- *ここから：主内容* -->
<table border="0" style="width: 566px;" cellspacing="0" align="center" cellpadding="0" class="border_01">

({if $msg == 1})
<tr>
<td class="bg_03" align="center">
<div class="padding_s">送信完了しました。</div>
({if $inc_entry_point[3]})
({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})
</td>
</tr>

({elseif $msg == 2})
<tr>
<td class="bg_02" align="center">
<div class="padding_s">下書きメッセージを保存しました。</div>
</td>
</tr>

({else})
<tr>
<td class="bg_03" align="center">
<div class="padding_s">&nbsp;</div>
</td>
</tr>

({/if})
</table>

<!-- *ここまで：主内容* -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：送信完了メッセージ内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：送信完了メッセージ****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************** -->
<!-- ******ここから：トップページに戻る****** -->
<div class="content_footer" align="center">

({if $msg == 1})
【<a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信済みメッセージ一覧</a>】
({elseif $msg == 2})
【<a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">下書きメッセージ一覧</a>】
({/if})

</div>
<!-- ******ここまで：トップページに戻る****** -->
<!-- ************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
