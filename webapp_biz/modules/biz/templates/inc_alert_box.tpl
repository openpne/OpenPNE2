({if $msg || $msg1 || $msg2 || $msg3 || $err_msg})

({if $is_no_alert})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />

<!-- ************************* -->
<!-- ******ここから：メッセージ****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width})({else})580({/if})px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:({if $width})({$width-14})({else})566({/if})px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_01" align="center">
<!-- *ここから：メッセージ＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width-16})({else})564({/if})px;">
<tr>
<td style="width:({if $width})({$width-16})({else})564({/if})px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:({if $width})({$width-18})({else})562({/if})px;height:50px;" class="bg_02" align="left" valign="middle">
<div style="padding:8px 30px;">
<!-- ここから：主内容＞メッセージ文本体 -->
({if $msg})({$msg})<br>({/if})
({if $msg1})({$msg1})<br>({/if})
({if $msg2})({$msg2})<br>({/if})
({if $msg3})({$msg3})<br>({/if})
({foreach from=$err_msg item=item})
({$item})</br>
({/foreach})
<!-- ここまで：主内容＞メッセージ文本体 -->
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：メッセージ＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
</table>
<!-- ******ここまで：メッセージ****** -->
<!-- ******************************* -->

({else})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />


<!-- ************************* -->
<!-- ******ここから：警告****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width})({else})580({/if})px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:({if $width})({$width-14})({else})566({/if})px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_01" align="center">
<!-- *ここから：警告＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width-16})({else})564({/if})px;">
<tr>
<td style="width:({if $width})({$width-16})({else})564({/if})px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:150px;" class="bg_03" align="center" valign="middle">
<!-- ここから：主内容＞警告アイコン -->
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
<img src="({t_img_url_skin filename=icon_alert_l})" class="icon" />
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
<!-- ここまで：主内容＞警告アイコン -->
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:({if $width})({$width-153})({else})427({/if})px;height:50px;" class="bg_02" align="left" valign="middle">
<div style="padding:8px 6px;" class="caution">
<!-- ここから：主内容＞警告文本体 -->
({if $msg})({$msg})<br>({/if})
({if $msg1})({$msg1})<br>({/if})
({if $msg2})({$msg2})<br>({/if})
({if $msg3})({$msg3})<br>({/if})
({foreach from=$err_msg item=item})
({$item})</br>
({/foreach})
<!-- ここまで：主内容＞警告文本体 -->
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：警告＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
</table>
<!-- ******ここまで：警告****** -->
<!-- ************************* -->

({/if})

({/if})