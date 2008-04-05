<div id="LayoutA">
<div id="Left">

<!-- *********************************************** -->
<!-- ******ここから：コミュニティの写真及び名前覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:254px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="dummy" style="width:254px;height:7px;" class="dummy"></td>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
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

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<img src="({t_img_url filename=$group.image_filename w=180 h=180 noimg=no_image})" class="pict">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

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
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({$c_commu.name})
</td>
</tr>
</table>
<!-- ここまで：コミュニティの名前 -->
({*ここから：footer*})
<!-- *ここまで：コミュニティの写真及び名前覧＞＞内容* -->
</td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティの写真及び名前覧****** -->
<!-- *********************************************** -->

</div><!-- Left -->
<div id="Center">

<!-- **************************************** -->
<!-- ******ここから：コミュニティ情報一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:426px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:426px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：コミュニティ情報一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
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
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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
<!-- ここから：主内容＞管理者 -->
<tr>
<td style="width:80px;" class="bg_09"><span class="c_01">管理者</span></td>
<td style="width:342px;" class="bg_02">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$admin_data.c_member_id})">({$admin_data.nickname})</a>

</td>
</tr>
<!-- ここまで：主内容＞管理者 -->
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
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:271px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="dummy"></td>
<td style="width:151px;padding:5px 0px;" class="bg_02 lh_140">
({if $is_admin})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=biz a=page_h_biz_group_edit})&amp;target_id=({$group.biz_group_id})">グループ設定変更</a>
<br>
({/if})
<br>
</td>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;height:1px;" class="bg_04" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
({*ここから：*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:426px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ情報一覧****** -->
<!-- **************************************** -->

</div><!-- Center -->
</div><!-- LayoutA -->

({if $calendar_head})
<!-- ******************************** -->
<!-- ******ここから：bizモジュール::スケジュール****** -->
        ({$calendar_head|smarty:nodefaults})
        ({$calendar_value|smarty:nodefaults})
        ({$calendar_foot|smarty:nodefaults})
<!-- ******ここまで：bizモジュール::スケジュール****** -->
<!-- ******************************** -->
({/if})
