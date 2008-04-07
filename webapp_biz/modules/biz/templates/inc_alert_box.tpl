({* unknown *})({if $msg || $msg1 || $msg2 || $msg3 || $err_msg})
({* unknown *})
({* unknown *})({if $is_no_alert})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* unknown *})
({* unknown *})<!-- ************************* -->
({* unknown *})<!-- ******ここから：メッセージ****** -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width})({else})580({/if})px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:({if $width})({$width-14})({else})566({/if})px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：メッセージ＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width-16})({else})564({/if})px;">
({* unknown *})<tr>
({* unknown *})<td style="width:({if $width})({$width-16})({else})564({/if})px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:({if $width})({$width-18})({else})562({/if})px;height:50px;" class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:8px 30px;">
({* unknown *})<!-- ここから：主内容＞メッセージ文本体 -->
({* unknown *})({if $msg})({$msg})<br>({/if})
({* unknown *})({if $msg1})({$msg1})<br>({/if})
({* unknown *})({if $msg2})({$msg2})<br>({/if})
({* unknown *})({if $msg3})({$msg3})<br>({/if})
({* unknown *})({foreach from=$err_msg item=item})
({* unknown *})({$item})</br>
({* unknown *})({/foreach})
({* unknown *})<!-- ここまで：主内容＞メッセージ文本体 -->
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：メッセージ＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ******ここまで：メッセージ****** -->
({* unknown *})<!-- ******************************* -->
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* unknown *})
({* unknown *})
({* unknown *})<!-- ************************* -->
({* unknown *})<!-- ******ここから：警告****** -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width})({else})580({/if})px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:({if $width})({$width-14})({else})566({/if})px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：警告＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width-16})({else})564({/if})px;">
({* unknown *})<tr>
({* unknown *})<td style="width:({if $width})({$width-16})({else})564({/if})px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:150px;" class="bg_03" align="center" valign="middle">
({* unknown *})<!-- ここから：主内容＞警告アイコン -->
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* unknown *})<img src="({t_img_url_skin filename=icon_alert_l})" class="icon" />
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* unknown *})<!-- ここまで：主内容＞警告アイコン -->
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:({if $width})({$width-153})({else})427({/if})px;height:50px;" class="bg_02" align="left" valign="middle">
({* unknown *})<div style="padding:8px 6px;" class="caution">
({* unknown *})<!-- ここから：主内容＞警告文本体 -->
({* unknown *})({if $msg})({$msg})<br>({/if})
({* unknown *})({if $msg1})({$msg1})<br>({/if})
({* unknown *})({if $msg2})({$msg2})<br>({/if})
({* unknown *})({if $msg3})({$msg3})<br>({/if})
({* unknown *})({foreach from=$err_msg item=item})
({* unknown *})({$item})</br>
({* unknown *})({/foreach})
({* unknown *})<!-- ここまで：主内容＞警告文本体 -->
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：警告＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ******ここまで：警告****** -->
({* unknown *})<!-- ************************* -->
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})({/if})