({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************** -->
<!-- ******ここから：メッセージテーブル****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- 小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">このコミュニティに参加</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：メッセージ -->
<table border="0" cellspacing="1" cellpadding="3" style="width:574px;">
<tr class="bg_02">

({t_form m=pc a=do_c_join_request_insert_c_commu_member_confirm})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_member_id" value="({$member.c_member_id})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})">

<td style="width:180px;" class="bg_05">
<span class="c_01">
メッセージ (任意)
</span>
</td>

<td class="bg_02">

<textarea class="text" name="body" rows="6" cols="50" style="width:377px;"></textarea>

</td>
</tr>
<tr>
<td class="bg_02" colspan="2" align="center">

<input type="submit" class="submit" value="参加を希望する">

</td>

</form>

</tr>
</table>
<!-- ここまで：メッセージ -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メッセージテーブル****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})

