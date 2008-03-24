<div id="LayoutC">
<div id="Center">

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>友人を({$smarty.const.SNS_NAME})に招待する</h3></div>
<div class="block">
<p>現在、新規登録を停止しています。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>友人を({$smarty.const.SNS_NAME})に招待する</h3></div>
<div class="partsInfo">
<p>「({$smarty.const.SNS_NAME})」に招待したい方のメールアドレスを記入してください。</p>
</div>
({t_form_block m=pc a=page_h_invite_confirm})
<table>
<tr>
<th>友人のメールアドレス</th>
<td>
<input type="text" class="input_text" name="mail" value="({$requests.mail})" size="40" />
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
<p class="caution">※携帯メールアドレスには招待を送ることができません。</p>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
<p class="caution">※PCメールアドレスには招待を送ることができません。</p>
({/if})
</td>
</tr>
<tr>
<th>メッセージ (任意)</th>
<td>
<textarea name="message" rows="5" cols="40">({$requests.message})</textarea>
</td>
</tr>
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<tr>
<th>確認キーワード</th>
<td>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="確認キーワード" /></p>
<p>※上に表示されているキーワードをご記入下さい。</p>
<input type="text" class="input_text" name="captcha" value="" size="30" />
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({if $inviting_member || $k_inviting_member})
({* {{{ recentList *})
({* #1955 *})<!-- ******ここから：招待一覧****** -->
({* #1955 *})({t_form_block m=pc a=do_h_invite_delete_member})
({* #1955 *})
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1955 *})<tr>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})</tr>
({* #1955 *})<tr>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})<td class="bg_01" align="center">
({* #1955 *})<!-- *ここから：招待一覧＞内容* -->
({* #1955 *})({*ここから：header*})
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1955 *})<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">招待中メールアドレス一覧</span></td>
({* #1955 *})<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：小タイトル -->
({* #1955 *})({*ここまで：header*})
({* #1955 *})({*ここから：body*})
({* #1955 *})<!-- ここから：主内容 -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})({foreach from=$inviting_member item=item})
({* #1955 *})<tr>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})<td style="width:255px;" class="bg_09" align="left" valign="middle">
({* #1955 *})
({* #1955 *})<div class="c_01" style="padding:5px;">
({* #1955 *})
({* #1955 *})({$item.r_date|date_format:"%Y年%m月%d日"})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})<td style="width:296px;" class="bg_02" align="left" valign="middle">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})
({* #1955 *})<input type="checkbox" name="c_member_id[]" value="({$item.c_member_pre_id})" class="no_bg">&nbsp;({$item.regist_address})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})({/foreach})
({* #1955 *})
({* #1955 *})({foreach from=$k_inviting_member item=item})
({* #1955 *})<tr>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})<td style="width:255px;" class="bg_09" align="left" valign="middle">
({* #1955 *})
({* #1955 *})<div class="c_01" style="padding:5px;">
({* #1955 *})
({* #1955 *})({$item.r_datetime|date_format:"%Y年%m月%d日"})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})<td style="width:296px;" class="bg_02" align="left" valign="middle">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})
({* #1955 *})<input type="checkbox" name="c_member_ktai_id[]" value="({$item.c_member_ktai_pre_id})" class="no_bg">&nbsp;({$item.ktai_address})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})({/foreach})
({* #1955 *})
({* #1955 *})
({* #1955 *})<tr>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">
({* #1955 *})
({* #1955 *})<div style="padding:6px 100px;text-align:center;">
({* #1955 *})
({* #1955 *})<input type="submit" class="input_submit" value="　削  除　">
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：主内容 -->
({* #1955 *})({*ここまで：body*})
({* #1955 *})({*ここから：footer*})
({* #1955 *})<!-- 無し -->
({* #1955 *})({*ここまで：footer*})
({* #1955 *})<!-- *ここまで：招待一覧＞＞内容* -->
({* #1955 *})</td>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})</tr>
({* #1955 *})<tr>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})({/t_form_block})
({* #1955 *})<!-- ******ここまで：招待一覧****** -->
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
