<div id="LayoutC">
<div id="Center">

({* #1951 *})<!-- ******ここから：検索項目の一覧****** -->
({* #1951 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1951 *})<tr>
({* #1951 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy" /></td>
({* #1951 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})</tr>
({* #1951 *})<tr>
({* #1951 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})<td class="bg_01" align="center">
({* #1951 *})({*ここから：header*})
({* #1951 *})<!-- ここから：小タイトル -->
({* #1951 *})<div class="border_01">
({* #1951 *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* #1951 *})<tr>
({* #1951 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1951 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">検索項目の一覧</span></td>
({* #1951 *})</tr>
({* #1951 *})</table>
({* #1951 *})</div>
({* #1951 *})<!-- ここまで：小タイトル -->
({* #1951 *})({*ここまで：header*})
({* #1951 *})({*ここから：body*})
({* #1951 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1951 *})({*********})
({* #1951 *})<tr>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td style="width:564px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({*********})
({* #1951 *})<!-- ここから: ヘッダー下 説明文 -->
({* #1951 *})<tr>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td style="width:564px;" class="bg_09" align="center" valign="middle" colspan="3">
({* #1951 *})
({* #1951 *})<div class="padding_s">
({* #1951 *})
({* #1951 *})※数字は各項目を全体に公開しているメンバーの数になります。
({* #1951 *})
({* #1951 *})</div>
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})<!-- ここまで: ヘッダー下 説明文 -->
({* #1951 *})({*********})
({* #1951 *})<tr>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({*********})
({* #1951 *})<tr>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td class="bg_01" colspan="3">
({* #1951 *})
({* #1951 *})<!-- ここから：主内容 -->
({* #1951 *})<div class="bg_05" align="center">
({* #1951 *})
({* #1951 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1951 *})
({* #1951 *})<table border="0" cellspacing="0" cellpadding="0" style="width:532px;margin:0px auto;">
({* #1951 *})({********})
({* #1951 *})<tr>
({* #1951 *})<td style="width:532px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({********})
({* #1951 *})<tr>
({* #1951 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td style="width:530px;" class="bg_02" align="left" valign="middle">
({* #1951 *})
({* #1951 *})<div class="padding_s">
({* #1951 *})
({* #1951 *})
({* #1951 *})({foreach from=$profile_list item=profile})
({* #1951 *})({if $profile.disp_search && ($profile.form_type == 'select' || $profile.form_type == 'checkbox' || $profile.form_type == 'radio')})
({* #1951 *})<!-- ここから：主内容＞＞({$profile.caption}) -->
({* #1951 *})<table border="0" cellspacing="0" cellpadding="0" style="width:530px;">
({* #1951 *})({*******})
({* #1951 *})<tr>
({* #1951 *})<td>
({* #1951 *})
({* #1951 *})({$profile.caption})<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})<td colspan="2">&nbsp;</td>
({* #1951 *})</tr>
({* #1951 *})({*******})
({* #1951 *})<tr>
({* #1951 *})<td style="width:70px;text-align:left;" valign="top">
({* #1951 *})
({* #1951 *})<div class="padding_s">
({* #1951 *})
({* #1951 *})&nbsp;
({* #1951 *})
({* #1951 *})</div>
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})
({* #1951 *})<td style="text-align:left;" valign="top">
({* #1951 *})
({* #1951 *})<div class="padding_s">
({* #1951 *})
({* #1951 *})<table>
({* #1951 *})
({* #1951 *})({foreach from=$profile.options name=$profile.name item=item})
({* #1951 *})({counter name=$profile.name assign=cnt})
({* #1951 *})({if $cnt % 5 == 1})<tr>({/if})
({* #1951 *})<td style="padding-right:0.5em"><a href="({t_url m=pc a=page_h_search_result})&amp;profile%5B({$profile.name})%5D=({$item.c_profile_option_id})">({$item.value})&nbsp;(({$count_list[$item.c_profile_option_id]|default:0}))</a></td>
({* #1951 *})({if $cnt % 5 == 0})</tr>({/if})
({* #1951 *})({/foreach})
({* #1951 *})({if $cnt % 5 != 0})</tr>({/if})
({* #1951 *})
({* #1951 *})</table>
({* #1951 *})
({* #1951 *})</div>
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})</tr>
({* #1951 *})({*******})
({* #1951 *})</table>
({* #1951 *})<!-- ここまで：主内容＞＞({$profile.caption}) -->
({* #1951 *})
({* #1951 *})<hr />
({* #1951 *})({/if})
({* #1951 *})({/foreach})
({* #1951 *})
({* #1951 *})
({* #1951 *})</div>
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({********})
({* #1951 *})<tr>
({* #1951 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({********})
({* #1951 *})</table>
({* #1951 *})
({* #1951 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1951 *})
({* #1951 *})</div>
({* #1951 *})<!-- ここまで：主内容 -->
({* #1951 *})
({* #1951 *})</td>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({*********})
({* #1951 *})<tr>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1951 *})</tr>
({* #1951 *})({*********})
({* #1951 *})</table>
({* #1951 *})({*ここまで：body*})
({* #1951 *})({*ここから：footer*})
({* #1951 *})<!-- 無し -->
({* #1951 *})({*ここから：footer*})
({* #1951 *})</td>
({* #1951 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})</tr>
({* #1951 *})<tr>
({* #1951 *})<td style="width:7px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})<td style="width:566px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})<td style="width:7px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1951 *})</tr>
({* #1951 *})</table>
({* #1951 *})<!-- ******ここまで：検索項目一覧****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
