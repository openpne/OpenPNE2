({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_165px.tpl"})

({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************* -->
<!-- ******ここから：カレンダー****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：カレンダー＞内容* -->
({*ここから：header*})
<!-- ここから：カレンダータイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;margin:0px auto;">
<tr>
<td align="center" class="bg_03 padding_s">

({strip})
({if $ym.prev_month})
<span class="b_b">
<a href="({t_url m=pc a=page_fh_diary_list})
    &amp;target_c_member_id=({$target_member.c_member_id})
    &amp;year=({$ym.prev_year})
    &amp;month=({$ym.prev_month})">
＜
</a>
</span>
({/if})

<span class="b_b">({$date_val.month})月のカレンダー</span>

({if $ym.next_month})
<span class="b_b">
<a href="({t_url m=pc a=page_fh_diary_list})
    &amp;target_c_member_id=({$target_member.c_member_id})
    &amp;year=({$ym.next_year})
    &amp;month=({$ym.next_month})">
＞
</a>
</span>
({/if})
({/strip})

</td>
</tr>
</table>
<!-- ここまで：カレンダータイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;margin:0px auto;">
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
<tr>
<td class="bg_09 s_ss padding_ss" align="right"><span class="c_02 s_ss">日</span></td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">月</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">火</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">水</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">木</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right">金</td>
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_09 s_ss padding_ss" align="right"><span class="c_03 s_ss">土</span></td>
</tr>
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name="calendar_days"})
<td style="width:({if $smarty.foreach.calendar_days.iteration%7 == 0 || $smarty.foreach.calendar_days.iteration%7 == 1})21({else})20({/if})px;height:18px;" valign="middle" align="right" class="bg_02 s_ss padding_ss">
({if $item.day})
({if $item.is_diary})
<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})" class="s_ss">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
&nbsp;({/if})
</td>
({if $smarty.foreach.calendar_days.iteration%7 != 0})
<td style="width:1px;" class="bg_10"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/if})
({/foreach})
</tr>
({****************})
<tr>
<td style="width:149px;" class="bg_10" colspan="13"><img src="./skin/dummy.gif" alt="dummy" style="width:149px;height:1px;" class="dummy"></td>
</tr>
({****************})
({/foreach})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：カレンダー＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：カレンダー****** -->
<!-- ****************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：最近のコメント****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：最近のコメント＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:111px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">最近のコメント</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div align="left" style="padding:3px;" class="bg_02 border_01">

<a href="({t_url m=pc a=page_fh_comment_list})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">一覧を見る</a>

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：最近のコメント＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：最近のコメント****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $date_list})

<!-- ********************************** -->
<!-- ******ここから：各月の日記一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：各月の日記一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:111px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">各月の日記</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div align="left" class="bg_02 border_01 padding_ss">
({foreach from=$date_list item=item})

<div><a href="({t_url m=pc a=page_fh_diary_list})&amp;year=({$item.year})&amp;month=({$item.month})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$item.year})年({$item.month})月の一覧</a></div>

({/foreach})
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：各月の日記一覧＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：各月の日記一覧****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({/if})
({if $category_list})

<!-- ********************************** -->
<!-- ******ここから：カテゴリ一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center">
<!-- *ここから：カテゴリ一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:111px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">カテゴリ一覧</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div align="left" class="bg_02 border_01 padding_ss">
({foreach from=$category_list item=category})

<div><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category.c_diary_category_id})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$category.category_name})</a></div>

({/foreach})
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：カテゴリ一覧＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：カテゴリ一覧****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({/if})

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_165px.tpl"})
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：日記を編集する****** -->
({t_form _enctype=file m=pc a=page_h_diary_add_confirm})

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：日記を編集する＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">日記を書く</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞日記表示 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="width:522px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

タイトル

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:439px;" class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input size="40" type="text" name="subject" class="text" value="({$form_val.subject})">

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
<div style="padding:4px 3px;">

本　　文

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({if $inc_entry_point[3]})
<div>({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})</div>
({/if})

<textarea class="text" name="body" rows="15" cols="50" style="width:415px">({$form_val.body})</textarea>

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
<div style="padding:4px 3px;">

写　真 1

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input type="file" name="upfile_1">

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
<div style="padding:4px 3px;">

写　真 2

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input type="file" name="upfile_2">

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
<div style="padding:4px 3px;">

写　真 3

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input type="file" name="upfile_3">

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $use_diary_category})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

カテゴリ

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">
<input type="text" class="text" name="category" id="category" size="40" value="({$form_val.category})">
<select onChange="if(selectedIndex){if(!category.value.match(/\s$/)){category.value += ' '}category.value += options[selectedIndex].value + ' ';}">
<option>カテゴリを選択してください</option>
({foreach from=$category_list item=value})
<option value="({$value.category_name})">({$value.category_name})</option>
({/foreach})
</select>
<br>
※カテゴリはひとつにつき全角10文字（半角20文字）以内で入力してください。<br>
※ひとつの日記にカテゴリは5つまで同時に指定することができます。<br>
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

公開範囲

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input type="radio" name="public_flag" value="public"({if $form_val.public_flag == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_public"><label for="public_flag_public">全員に公開</label><br>
<input type="radio" name="public_flag" value="friend"({if $form_val.public_flag == "friend"}) checked="checked"({/if}) class="no_bg" id="public_flag_friend"><label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label><br>
<input type="radio" name="public_flag" value="private"({if $form_val.public_flag == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_private"><label for="public_flag_private">公開しない</label><br>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="center" colspan="3">
<div style="padding:4px 3px;">

<input type="submit" class="submit" value="　確認画面　">

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
<!-- ここまで：主内容＞＞日記表示 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：日記を編集する＞＞内容* -->
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
<!-- ******ここまで：日記を編集する****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
