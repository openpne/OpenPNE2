({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
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
<td style="width:530px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">日記公開範囲の一括設定します</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：メッセージ -->
<table border="0" cellspacing="1" cellpadding="3" style="width:566px;">
<tr>
<td colspan="2" class="bg_02" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({t_form m=pc a=do_h_set_public_flag_all})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})">

設定内容 ： ({if $public_flag_diary_all == 'private'})公開しない({elseif $public_flag_diary_all == 'friend'})({$smarty.const.WORD_MY_FRIEND})まで公開({else})全員に公開({/if})<br><br>
<input type="submit" class="submit" name="ok" value="一括設定">
<input type="submit" class="submit" value="キャンセル">

</form>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</td>
</tr>
</table>
<!-- ここまで：メッセージ -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メッセージテーブル****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
