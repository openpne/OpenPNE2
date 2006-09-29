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

({ext_include file="inc_alert_box.tpl"})({* エラーメチE��ージコンチE�� *})

<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから�E�メインコンチE��チE*})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ******************************************** -->
<!-- ******ここから�E�招征E***** -->
({t_form m=pc a=page_h_invite_confirm})
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから�E�招征E���E容* -->
({*ここから�E�header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">友人めE{$smarty.const.SNS_NAME})に招征E��めE/span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで�E�小タイトル -->
({*ここまで�E�header*})
({*ここから�E�body*})
<!-- ここから�E�主冁E�� -->
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:572px;" class="bg_09" align="center" valign="middle">

<div class="c_01" style="padding:4px;text-align:center;">

現在、新規登録を停止してぁE��す、E

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({else})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:572px;" class="bg_09" align="center" valign="middle" colspan="3">

<div class="c_01" style="padding:4px;text-align:center;">

、E{$smarty.const.SNS_NAME})」に招征E��たい方のメールアドレスを記�Eしてください、E

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
友人のメールアドレス 
</span>
<img src="./skin/dummy.gif" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input  name="mail" value="({$requests.mail})" size="30">
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
<br>※携帯アドレスには招征E��送ることができません
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
<br>※PCアドレスには招征E��送ることができません
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<div class="c_01" style="padding:5px;">

メチE��ージ (任愁E

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<textarea name="message" rows="5" cols="40">({$requests.message})</textarea>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_s">

&nbsp;

<img src="./skin/dummy.gif" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" class="s_ss">※例！E/td>
<td valign="top" class="s_ss">
こんにちは、○○です。この前話したサイト�E招征E��を送ります、Ebr>
</td>
</tr>
</table>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>

({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>



({*********})
({* captcha *})
({*********})

<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<div class="c_01" style="padding:5px;">

確認キーワーチE 

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<img src="./cap.php">
<br>
※上に表示されてぁE��キーワードをご記�E下さぁE��E
<input  name="captcha" size="30">


</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>




({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">

<div align="center" style="text-align:center;padding:6px;">

<input type="submit" value="　確認画面　">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで�E�主冁E�� -->
({*ここまで�E�body*})
({*ここから�E�footer*})
<!-- 無ぁE-->
({*ここまで�E�footer*})
<!-- *ここまで�E�招征E��＞�E容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
</form>
<!-- ******ここまで�E�招征E***** -->
<!-- ******************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({if $inviting_member || $k_inviting_member})

<!-- ***************************** -->
<!-- ******ここから�E�招征E��覧****** -->
({t_form m=pc a=do_h_invite_delete_member})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから�E�招征E��覧�E��E容* -->
({*ここから�E�header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">招征E��メールアドレス一覧</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで�E�小タイトル -->
({*ここまで�E�header*})
({*ここから�E�body*})
<!-- ここから�E�主冁E�� -->
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({foreach from=$inviting_member item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:255px;" class="bg_09" align="left" valign="middle">

<div class="c_01" style="padding:5px;">

({$item.r_date|date_format:"%Y年%m朁Ed日"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:296px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="checkbox" name="c_member_id[]" value="({$item.c_member_pre_id})" class="no_bg">&nbsp;({$item.regist_address})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/foreach})

({foreach from=$k_inviting_member item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:255px;" class="bg_09" align="left" valign="middle">

<div class="c_01" style="padding:5px;">

({$item.r_datetime|date_format:"%Y年%m朁Ed日"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:296px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="checkbox" name="c_member_ktai_id[]" value="({$item.c_member_ktai_pre_id})" class="no_bg">&nbsp;({$item.ktai_address})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/foreach})


<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">

<div style="padding:6px 100px;text-align:center;">

<input type=submit value="　剁E 除　">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで�E�主冁E�� -->
({*ここまで�E�body*})
({*ここから�E�footer*})
<!-- 無ぁE-->
({*ここまで�E�footer*})
<!-- *ここまで�E�招征E��覧�E�＞�E容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
</form>
<!-- ******ここまで�E�招征E��覧****** -->
<!-- ******************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">
({/if})



({***************************})
({**ここまで�E�メインコンチE��チE*})
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

