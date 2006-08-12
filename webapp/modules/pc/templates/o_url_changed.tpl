({$inc_html_header|smarty:nodefaults})

<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container main_content" align="center">

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：警告****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：警告＞内容* -->
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_03" align="center" valign="middle">
<!-- ここから：主内容＞警告アイコン -->
<img src="./skin/dummy.gif" class="v_spacer_l">
<img src="({t_img_url_skin filename=icon_alert_l})" class="icon">
<img src="./skin/dummy.gif" class="v_spacer_l">
<!-- ここまで：主内容＞警告アイコン -->
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:427px;height:50px;" class="bg_02" align="left" valign="middle">
<div style="padding:8px 6px;">
<!-- ここから：主内容＞警告文本体 -->

({$smarty.const.SNS_NAME}) のURLが変更になりました。<br>
<br>
お気に入り（ブックマーク）に登録されている方、リンクされている方は
以下のURLに変更していただきますよう、お願いいたします。<br>
<br>
新しいURLは以下になります。<br>
<a href="({$url})">({$url})</a><br>
({if $wait > 0})
※({$wait})秒後に自動的に移動します。
({/if})

<!-- ここまで：主内容＞警告文本体 -->
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
<!-- *ここまで：警告＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：警告****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" class="v_spacer_l">

</td>
</tr>
<tr>
<td class="container inc_page_footer">
({$inc_page_footer|smarty:nodefaults})
</td>
</tr>
</table>
({ext_include file="inc_extension_pagelayout_bottom.tpl"})
</body>
</html>
