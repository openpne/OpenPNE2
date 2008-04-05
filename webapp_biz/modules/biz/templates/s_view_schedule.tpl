<div id="LayoutC">
<div id="Center">

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
施設予定詳細
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

施設名

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:503px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$list.name})<br>

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

日時

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$schedule.date|date_format:"%Y年%m月%d日"})({$schedule.begin_time|date_format:"%H:%M"})～({$schedule.finish_time|date_format:"%H:%M"})
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

予定登録者

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
({$schedule.member_name})
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
<td class="bg_03" align="center" valign="middle" colspan="3">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:2em;">
<tr>
({if !$msg})
<td class="padding_ss" align="center">

({t_form m=biz a=page_s_delete_schedule})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$schedule.biz_shisetsu_schedule_id})">
<input value="削除する" type="submit" class="submit">
</form>

</td>
({else})
<td class="padding_ss" align="right">

({t_form m=biz a=page_s_list})
<input type="hidden" name="w" value="({$w})">
<input value="続けて新規の施設予定登録をする" type="submit" class="submit">
</form>

</td>

({capture name="続けて予定登録"})
<td class="padding_ss" align="center">

({t_form m=biz a=page_h_biz_schedule_add})
<input value="続けて予定登録をする" type="submit" class="submit">
</form>

</td>
({/capture})

<td class="padding_ss" align="left">

({t_form m=biz a=page_s_list})
<input value="施設一覧に戻る" type="submit" class="submit">
</form>

</td>
({/if})
</tr>
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

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

</div><!-- Center -->
</div><!-- LayoutC -->
