({ext_include file="inc_header.tpl" no_use_alert=true})

<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">パスワードを忘れた方</span></td>
</tr>
</table>
({*ここまで：header*})
({*ここから：body*})
<div class="border_01 bg_09" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<p>以下のボタンをクリックし、パスワードの再発行ページをおこなってください。</p>
({t_form _method=get m=pc a=page_o_password_query})
&nbsp;&nbsp;&nbsp;<input type="submit" class="submit" value="パスワード再発行ページへ">
</form>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({*ここまで：body*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

<img class="v_spacer_l" alt="dummy" src="./skin/dummy.gif">

<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">携帯から登録された方</span></td>
</tr>
</table>
({*ここまで：header*})
({*ここから：body*})
<div class="border_01 bg_09" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<p>携帯から登録された方がPC版を利用するにはPCメールアドレスの登録が必要です。<br>
（なお、iPhone等の一部の携帯端末はPCとして扱われます）</p>
<p>以下のボタンをクリックし、PCメールアドレスの登録手続きをおこなってください。</p>
({t_form _method=get m=pc a=page_o_regist_pc_address})
&nbsp;&nbsp;&nbsp;<input type="submit" class="submit" value="PCメールアドレス登録ページへ">
</form>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
({*ここまで：body*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

<img class="v_spacer_l" alt="dummy" src="./skin/dummy.gif">

({ext_include file="inc_footer.tpl"})
