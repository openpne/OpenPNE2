({$inc_html_header|smarty:nodefaults})
<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
({if $inc_entry_point[1]})
<tr>
<td class="container">
({$inc_entry_point[1]|smarty:nodefaults})
</td>
</tr>
({/if})
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
({if $inc_entry_point[2]})
<tr>
<td class="container">
({$inc_entry_point[2]|smarty:nodefaults})
</td>
</tr>
({/if})
<tr>
<td class="container main_content" align="center">

({assign var=is_no_alert value=true})
({ext_include file="inc_alert_box.tpl"})({* エラーメッセージコンテナ *})

</td>
</tr>
<tr>
<td class="container main_content">

<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center" style="width:720px;">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

({if $inc_entry_point[3]})
({$inc_entry_point[3]|smarty:nodefaults})
({/if})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：bizモジュール::スケジュール****** -->
({$calendar|smarty:nodefaults})
<!-- ******ここまで：bizモジュール::スケジュール****** -->
<!-- ******************************** -->

<!-- **************************************** -->
<!-- ******ここから：ホームに戻る****** -->
<div id="link_community_top" align="center">
({if !$is_closed_shisetsu})
<img src="./skin/dummy.gif" class="icon arrow_1">&nbsp;<a href="({t_url m=biz a=page_s_add_shisetsu})">施設登録</a>
({/if})
<img src="./skin/dummy.gif" class="v_spacer_l">

<img src="./skin/dummy.gif" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_h_home})">ホームに戻る</a>

</div>
<!-- ******ここまで：ホームに戻る****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

<img src="./skin/dummy.gif" class="v_spacer_l">

({if $inc_entry_point[5]})
({$inc_entry_point[5]|smarty:nodefaults})
({/if})

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
</td>
</tr>
</table>({*END:container*})
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
