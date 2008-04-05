<div id="LayoutC">
<div id="Center">

<!-- **************************************** -->
<!-- ******ここから：コミュニティ新規作成****** -->
({t_form _enctype=file m=biz a=do_h_biz_group_add})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コミュニティ新規作成＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
新規作成
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞新規作成入力フォーム -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:130px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

グループ名

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="text" class="text" name="name" size="50" value="({$name})">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

グループ説明文

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<textarea class="text" name="info" rows="6" cols="50">({$info})</textarea>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">
<div class="padding_s">

写　　真

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="file" size="40" name="image_filename"><br>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({*ここから：削除予定*})

<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05">

<div class="padding_s">

参加者

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:412px;" class="bg_02">

<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
<tr>
({foreach from=$c_invite_list item=c_invite name=mem key=i})
({counter assign=_cnt})
<td style="width:33%;" class="padding_ss" valign="top" align="left">

({if $c_invite.c_member_id == $c_member_id})
<input type="hidden" id="m({$c_invite.c_member_id})" name="member_list[]" value="({$c_invite.c_member_id})">
({else})
<input type="checkbox" id="m({$c_invite.c_member_id})" name="member_list[]" value="({$c_invite.c_member_id})" class="no_bg" ({if $member_list[$i]})checked({/if})>
({/if})
<label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label>

</td>
({if $smarty.foreach.mem.last && ($smarty.foreach.mem.iteration%3 == 1 || $smarty.foreach.mem.iteration%3 == 2)})<td>&nbsp;</td>({/if})

({if $smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 1})<td>&nbsp;</td>({/if})

({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</tr><tr>({/if})
({/foreach})
</tr>
</table>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({*ここまで：削除予定*})

({*↓*})

({capture name=comment_out})

({*ここから：新規予定*})

<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_05">

<div class="padding_s">

参加者

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:412px;" class="bg_02">

<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
<tr>
({foreach from=$c_invite_list_temp item=item name=mem})
<td style="width:33%;" class="padding_ss" valign="top" align="left">

({if $item.c_member_id == $c_member_id})
<input type="hidden" id="m({$item.c_member_id})" name="member_list[]" value="({$item.c_member_id})">
({else})
<input type="checkbox" id="m({$item.c_member_id})" name="member_list[]" value="({$item.c_member_id})" class="no_bg" ({if $item.checkflag})checked({/if})>
({/if})

({if $item})
<label for="m({$item.c_member_id})">({$item.nickname})</label>
({else})
&nbsp;
({/if})

</td>
({if $smarty.foreach.mem.last && ($smarty.foreach.mem.iteration%3 == 1 || $smarty.foreach.mem.iteration%3 == 2)})<td>&nbsp;</td>({/if})

({if $smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 1})<td>&nbsp;</td>({/if})

({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</tr><tr>({/if})
({/foreach})
</tr>
</table>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({*ここまで：新規予定*})

({/capture})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<div style="text-align:left;" class="padding_w_s">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div style="text-align:center;">
<input type="submit" class="submit" value="　作　成　">
</div>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここから：主内容＞＞新規作成入力フォーム -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：コミュニティ新規作成＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
</form>
<!-- ******ここまで：コミュニティ新規作成****** -->
<!-- **************************************** -->

</div><!-- Center -->
</div><!-- LayoutC -->
