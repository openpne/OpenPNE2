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
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
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
<td style="width:5px;"><img src="./skin/dummy.gif" style="width:5px;" class="dummy"></td>({*<--spacer*})
<td class="left_content" valign="top">
({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

<!-- *********************************************** -->
<!-- ******ここから：コミュニティの写真及び名前覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:254px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" style="width:254px;height:7px;" class="dummy"></td>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td align="center" class="bg_01">
<!-- *ここから：コミュニティの写真及び名前覧＞＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：写真 -->
<div class="border_07 bg_02" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:254px;">
<tr>
<td align="center">

<img src="./skin/dummy.gif" class="v_spacer_m">

<img src="({t_img_url filename=$group.image_filename w=180 h=180 noimg=no_image})" class="pict">

<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
</tr>
</table>

</div>
<!-- ここまで：写真 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：自分の名前 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:256px;">
<tr>
<td align="center" class="bg_05">
<img src="./skin/dummy.gif" class="v_spacer_m">
({$c_commu.name})
</td>
</tr>
</table>
<!-- ここまで：コミュニティの名前 -->
({*ここから：footer*})
<!-- *ここまで：コミュニティの写真及び名前覧＞＞内容* -->
</td>
<td class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_05"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティの写真及び名前覧****** -->
<!-- *********************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_m">

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
</td>
<td style="width:5px;"><img src="./skin/dummy.gif" style="width:5px;" class="dummy"></td>({*<--spacer*})
<td class="right_content" valign="top">
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

<!-- **************************************** -->
<!-- ******ここから：コミュニティ情報一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:426px;" class="bg_00"><img src="./skin/dummy.gif" style="width:426px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01">
<!-- *ここから：コミュニティ情報一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="./skin/content_header_1.gif" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:100px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">グループ</span></td>
<td style="width:290px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div class="bg_00">
<table border="0" cellspacing="0" cellpadding="0" style="width:426px;">
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_01" align="center">
<table border="0" cellspacing="1" cellpadding="4" style="width:424px;">
<!-- ここから：主内容＞コミュニティの名前 -->
<tr>
<td style="width:80px;" class="bg_09"><span class="c_01">グループ名</span></td>
<td style="width:342px;" class="bg_02">

({$group.name})

</td>
</tr>
<!-- ここまで：主内容＞コミュニティの名前 -->
<!-- ここから：主内容＞管理人 -->
<tr>
<td style="width:80px;" class="bg_09"><span class="c_01">管理人</span></td>
<td style="width:342px;" class="bg_02">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$admin_data.c_member_id})">({$admin_data.nickname})</a>

</td>
</tr>
<!-- ここまで：主内容＞管理人 -->
<!-- ここから：主内容＞メンバー数 -->
<tr>
<td style="width:80px;" class="bg_09"><span class="c_01">メンバー数</span></td>
<td style="width:342px;" class="bg_02">

({$member_count|default:"０"})人

</td>
</tr>
<!-- ここまで：主内容＞メンバー数 -->
<!-- ここから：主内容＞コミュニティの説明 -->
<tr>
<td style="width:80px;" class="bg_09"><span class="c_01">グループ<br>説明文</span></td>
<td style="width:342px;" class="bg_02">

({$group.info|t_url2a|nl2br})
</td>
</tr>
<!-- ここまで：主内容＞コミュニティの説明 -->
</table>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
</table>
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:271px;" class="bg_02"><img src="./skin/dummy.gif" class="dummy"></td>
<td style="width:151px;padding:5px 0px;" class="bg_02 lh_140">
({if $is_admin})
<img src="./skin/dummy.gif" class="icon arrow_1">
<a href="({t_url m=biz a=page_h_biz_group_edit})&amp;target_id=({$group.biz_group_id})">グループ設定変更</a>
<br>
({/if})
<br>
</td>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:1px;height:1px;" class="bg_04" colspan="4"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
({*ここから：*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:426px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ情報一覧****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_m">

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
</td>
</tr>
</table>({*END:container*})
</td>
</tr>
<tr>
<td class="container main_content" align="center">

({if $calendar_head})
<!-- ******************************** -->
<!-- ******ここから：bizモジュール::スケジュール****** -->
	({$calendar_head|smarty:nodefaults})
	({$calendar_value|smarty:nodefaults})
	({$calendar_foot|smarty:nodefaults})
<!-- ******ここまで：bizモジュール::スケジュール****** -->
<!-- ******************************** -->
({/if})

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
