({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************************** -->
({t_form m=pc a=do_o_regist_pc_address})
<table border="0" cellspacing="0" cellpadding="0" style="width:640px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:626px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：招待＞内容* -->
({*ここから：header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">PCメールアドレス登録</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_09" align="center" valign="middle">

<div class="c_01" style="padding:4px;text-align:center;">

現在、新規登録を停止しています。

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({else})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_09" align="center" valign="middle" colspan="3">

<div class="c_01" style="padding:4px;text-align:center;">

<p>
登録済みの携帯メールアドレスとパスワード、登録したいPCメールアドレスを入力してください。
</p>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
携帯メールアドレス
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="input_text" name="ktai_address" value="({$requests.ktai_address})" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
パスワード
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="password" class="input_password" name="password" value="" size="20">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>


({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})


<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
PCメールアドレス
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="input_text" name="pc_address" value="({$requests.pc_address})" size="40">
<br>
<span class="caution">※メールアドレスは公開されません。</span>
<br>
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>


({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
PCメールアドレス確認
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="input_text" name="pc_address2" value="" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({if $smarty.const.OPENPNE_USE_CAPTCHA})
({*********})
({* captcha *})
({*********})

<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05" align="left" valign="middle">

<div class="c_01" style="padding:5px;">

確認キーワード

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<img src="./cap.php?rand=({math equation="rand(0,99999999)"})">
<br>
※上に表示されているキーワードをご記入下さい。
<br>
<input type="text" class="input_text" name="captcha" value="" size="30">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>


({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_03" align="center" valign="middle" colspan="3">

<div align="center" style="text-align:center;padding:6px;">

<input type="submit" class="input_submit" value="　送　信　">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:626px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:626px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
</form>
<img class="v_spacer_l" alt="dummy" src="./skin/dummy.gif">
<!-- ここまで：主内容 -->

({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
