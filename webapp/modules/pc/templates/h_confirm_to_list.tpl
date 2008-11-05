({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：フレンド承認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：フレンド承認＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">あなたが({$WORD_FRIEND})リンクを要請しているメンバー
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞メッセージ -->
<div align="center" style="padding:3px;text-align:center;" class="border_01 bg_03">

({if $anataga_c_friend_confirm_list})
以下の人があなたが({$WORD_FRIEND})リンクを要請している人です。<br>
要請を取り消したい場合は削除するを選択してください。
({else})
現在({$WORD_FRIEND})リンクを要請してるメンバーはいません。
({/if})

</div>
<!-- ここまで：主内容＞＞メッセージ -->
({if $anataga_c_friend_confirm_list})
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞メンバー一覧 -->
<div class="border_01 bg_08" style="width:562px;margin:0px auto;">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$anataga_c_friend_confirm_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:90px;" class="bg_03" align="center" valign="top" rowspan="5">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

名&nbsp;&nbsp;前

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})">({$item.nickname})</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:459px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

メッセージ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$item.message|nl2br})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="center" valign="middle">

<table border="0" cellspacing="0" cellpadding="0" style="width:371px;">
<tr>
<td style="width:99px;" class="bg_02" align="left">
<img src="./skin/dummy.gif" alt="dot" class="dot">
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:271px;" class="bg_03" align="center">

<div class="padding_s">

<a href="({t_url m=pc a=do_h_confirm_list_delete_c_friend_to_confirm})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_sakujo})" class="icon"></a>

</div>

</td>
</tr>
</table>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>
<!-- ここまで：主内容＞＞メンバー一覧 -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：フレンド承認＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：フレンド承認****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- **************************************** -->
<!-- ******ここから：コミュニティ参加承認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コミュニティ参加承認＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">あなたが参加を希望しているコミュニティリスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞メッセージ -->
<div class="border_01 bg_09" align="center" style="padding:3px;text-align:center;" class="border_01 bg_03">

({if $anataga_c_commu_member_confirm_list})
以下の人のコミュニティに参加を希望しています。<br>
要請を取り消したい場合は削除するを選択してください。
({else})
現在あなたは承認が必要なコミュニティに参加を要請していません。
({/if})

</div>
<!-- ここまで：主内容＞＞メッセージ -->
({if $anataga_c_commu_member_confirm_list})
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞メンバー一覧 -->
<div class="border_01 bg_08" style="width:562px;margin:0px auto;">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$anataga_c_commu_member_confirm_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:90px;" class="bg_03" align="center" valign="top" rowspan="7">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

名&nbsp;&nbsp;前

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:459px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

参加希望<br>コミュニティ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

メッセージ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$item.message|nl2br})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="center" valign="middle">

<table border="0" cellspacing="0" cellpadding="0" style="width:371px;">
<tr>
<td style="width:99px;" class="bg_02" align="left">

<img src="./skin/dummy.gif" alt="dot" class="dot">

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:271px;" class="bg_03" align="center">

<div class="padding_s">

<a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_member_to_confirm})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_sakujo})" class="icon"></a>

</div>

</td>
</tr>
</table>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>
<!-- ここまで：主内容＞＞メンバー一覧 -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：コミュニティ参加承認＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ参加承認****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************************* -->
<!-- ******ここから：コミュニティ管理者交代承認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コミュニティ管理者交代承認＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:458px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">あなたがコミュニティの管理者交代を要請しているメンバー</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞メッセージ -->
<div class="border_01 bg_09" align="center" style="padding:3px;text-align:center;" class="border_01 bg_03">

({if $anataga_c_commu_admin_confirm_list})
以下コミュニティであなたが管理者交代を要請しています。<br>
取り消したい場合は削除するを選択してください。
({else})
現在あなたはコミュニティの管理者交代を要請していません。
({/if})

</div>
<!-- ここまで：主内容＞＞メッセージ -->
({if $anataga_c_commu_admin_confirm_list})
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞メンバー一覧 -->
<div class="border_01 bg_08" style="width:562px;margin:0px auto;">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$anataga_c_commu_admin_confirm_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:90px;" class="bg_03" align="center" valign="top" rowspan="7">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

名&nbsp;&nbsp;前

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">({$item.nickname})</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:459px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

コミュニティ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

メッセージ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$item.message|nl2br})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="center" valign="middle">

<table border="0" cellspacing="0" cellpadding="0" style="width:371px;">
<tr>
<td style="width:99px;" class="bg_02" align="left">
<img src="./skin/dummy.gif" alt="dot" class="dot">
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:271px;" class="bg_03" align="center">
<div class="padding_s">
<a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_admin_to_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_sakujo})" class="icon"></a>
</div>
</td>
</tr>
</table>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>
<!-- ここまで：主内容＞＞メンバー一覧 -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：コミュニティ管理者交代承認＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ管理者交代承認****** -->
<!-- ********************************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************************* -->
<!-- ******ここから：コミュニティ副管理者承認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コミュニティ副管理者承認＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:458px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">あなたがコミュニティ副管理者を要請しているメンバー</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞メッセージ -->
<div class="border_01 bg_09" align="center" style="padding:3px;text-align:center;" class="border_01 bg_03">

({if $anataga_c_commu_sub_admin_confirm_list})
以下のコミュニティであなたが副管理者を要請しています。<br>
取り消したい場合は削除するを選択してください。
({else})
現在あなたはコミュニティの副管理者を要請していません。
({/if})

</div>
<!-- ここまで：主内容＞＞メッセージ -->
({if $anataga_c_commu_sub_admin_confirm_list})
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞メンバー一覧 -->
<div class="border_01 bg_08" style="width:562px;margin:0px auto;">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$anataga_c_commu_sub_admin_confirm_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:90px;" class="bg_03" align="center" valign="top" rowspan="7">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

名&nbsp;&nbsp;前

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">({$item.nickname})</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:459px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

コミュニティ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

メッセージ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$item.message|nl2br})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="center" valign="middle"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:371px;" class="bg_02" align="center" valign="middle">

<table border="0" cellspacing="0" cellpadding="0" style="width:371px;">
<tr>
<td style="width:99px;" class="bg_02" align="left">
<img src="./skin/dummy.gif" alt="dot" class="dot">
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:271px;" class="bg_03" align="center">
<div class="padding_s">
<a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_sub_admin_to_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_sakujo})" class="icon"></a>
</div>
</td>
</tr>
</table>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>
<!-- ここまで：主内容＞＞メンバー一覧 -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：コミュニティ副管理者承認＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ副管理者承認****** -->
<!-- ********************************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
