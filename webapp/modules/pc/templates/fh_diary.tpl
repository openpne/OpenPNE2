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

<!-- ****************************** -->
<!-- ******ここから：最近の日記****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:165px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:149px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10" align="center" style="width: 149px;">
<!-- *ここから：最近の日記＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:149px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:111px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">最近の日記</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div align="left" style="padding:3px;" class="bg_02 border_01">
({foreach from=$new_diary_list item=item})

<div><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_3">({$item.subject})</a></div>

({/foreach})
</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：最近の日記＞＞内容* -->
</td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_10"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：最近の日記****** -->
<!-- ******************************* -->

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
<a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">一覧を見る</a>
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
<div align="left" style="padding:3px;" class="bg_02 border_01">
({foreach from=$date_list item=item})
<div><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$item.year})&amp;month=({$item.month})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$item.year})年({$item.month})月の一覧</a></div>
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

({if $category})

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
({foreach from=$category item=category_item})

<div><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_diary_category_id})"><img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$category_item.category_name})</a></div>

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

<!-- ***************************** -->
<!-- ******ここから：日記本文****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：日記本文＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:236px; padding:2px 0px;" class="bg_06"><span class="b_b c_00"><span id="DOM_fh_diary_writer">({$target_member.nickname})</span>({if $type == "f"})さん({/if})の日記</span></td>
<td style="width:250px; padding:2px 3px;" class="bg_06" align="right" valign="middle">
({if $target_diary.public_flag == "public"})
（全員に公開）
({elseif $target_diary.public_flag == "friend"})
（({$WORD_MY_FRIEND})まで公開）
({elseif $target_diary.public_flag == "private"})
（公開しない）
({/if})
</td>
</tr>
</table>
<!-- ここから：主内容＞＞前の日記／次の日記 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="width:524px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<!-- ************************************** -->
<td align="left" style="width: 10px" class="bg_09"><img src="./skin/dummy.gif" alt="" style="width:10px;" class="dummy"></td>
<td align="left" style="width: 252px;" class="bg_09">
({if $c_diary_id_prev})
<div style="padding:4px 3px;">
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})">«前の日記</a>
({else})
&nbsp;
({/if})
</div>
</td>

<!-- ************************************** -->

<td align="right" style="width: 252px;" class="bg_09">
<div style="padding:4px 3px;">
({if $c_diary_id_next})
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})">次の日記»</a>
({else})
&nbsp;
({/if})
</div>
</td>
<td align="right" style="width: 10px" class="bg_09"><img src="./skin/dummy.gif" alt="" style="width:10px;" class="dummy"></td>
<!-- ************************************** -->
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞前の日記／次の日記 -->
<!-- ここから：主内容＞＞日記表示 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:95px;" class="bg_05" align="center" valign="top" rowspan="3">
<div style="padding:4px 3px;">

({$target_diary.r_datetime|date_format:"%Y年%m月%d日<br>%H:%M"})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:424px;" class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<span id="DOM_fh_diary_title">({$target_diary.subject})</span>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:426px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle" style="width:424px;">

<div style="padding:4px 3px;">

({if $target_diary.image_filename_1 || $target_diary.image_filename_2 || $target_diary.image_filename_3})
<div>
({if $target_diary.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$target_diary.image_filename_1})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $target_diary.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$target_diary.image_filename_2})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $target_diary.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$target_diary.image_filename_3})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_3 w=120 h=120})"></a></span>({/if})
</div>
({/if})

<div class="lh_120" id="DOM_fh_diary_body">
({$target_diary.body|nl2br|t_url2cmd:'diary'|t_cmd:'diary'})
</div>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $category_list})
<tr>
<td class="bg_01" align="right"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="right" colspan="3">
<div style="padding:4px 3px; font-size:85%;">

({foreach from=$category_list item=category})
    ({$category.category_name}) 
({/foreach})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({if $type == "h"})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="center" colspan="3">
<div style="padding:4px 3px;">

({t_form _method=get m=pc a=page_h_diary_edit})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">
<input type="submit"  class="submit" value="編 集">
</form>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
</table>
<!-- ここまで：主内容＞＞日記表示 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：日記本文＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：日記本文****** -->
<!-- ***************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $target_diary_comment_list})
<!-- ********************************* -->
<!-- ******ここから：コメント一覧****** -->
({t_form m=pc a=page_fh_delete_comment})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07" id="DOM_fh_diary_comments">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コメント一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
コメント
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞表示件数切り替え -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;">
({*********})
<tr>
<td style="width:524;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:522;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_all})
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})">最新を表示</a>
({else})
({if $total_num > $page_size})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;is_all=1">すべて表示</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_next})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
({/if})
 ({$pager.start})番～({$pager.end})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞表示件数切り替え -->
<!-- ここから：主内容＞＞コメント表示 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="width:522px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$target_diary_comment_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:95px;" class="bg_05" align="center" valign="top" rowspan="3">
<div style="padding:4px 3px;">

({$item.r_datetime|date_format:"%Y年%m月%d日<br>%H:%M"})<br>

({if $type == "h"})

<input type="checkbox" name="target_c_diary_comment_id[]" value="({$item.c_diary_comment_id})" class="no_bg">

({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:424px;" class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<span class="b_b">({$item.number})</span>:
({if $item.nickname !== ''})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><span class="DOM_fh_diary_comment_writer">({$item.nickname|default:"&nbsp;"})</span></a>
({else})
&nbsp;
({/if})

({if $type == "f" && $item.c_member_id == $member.c_member_id})
|&nbsp;<a href="({t_url m=pc a=page_fh_delete_comment})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;target_c_diary_comment_id=({$item.c_diary_comment_id})">削除</a>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:424px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle" style="width:424px;">

<div style="padding:4px 3px;" class="lh_120 DOM_fh_diary_comment_body">

({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})

({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
<br>
({/if})

({$item.body|nl2br|t_url2cmd:'diary'|t_cmd:'diary'})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞コメント表示 -->
<!-- ここから：主内容＞＞表示件数切り替え -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;">
({*********})
<tr>
<td style="width:524;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:522;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_all})
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})">最新を表示</a>
({else})
({if $total_num > $page_size})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;is_all=1">すべて表示</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_next})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
({/if})
 ({$pager.start})番～({$pager.end})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞表示件数切り替え -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
({if $type == "h"})
<!-- ここから：削除 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:520px;" class="bg_03" align="left" valign="middle">
<div style="padding:4px 3px;" class="lh_120">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div style="text-align:center;">
<input type="submit" class="submit" value="　削 除　">
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：削除 -->
({/if})
({*ここまで：footer*})
<!-- *ここまで：コメント一覧＞＞内容* -->
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
<!-- ******ここまで：コメント一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/if})

<!-- ********************************** -->
<!-- ******ここから：前の日記／次の日記****** -->
({if $c_diary_id_prev || $c_diary_id_next})

<table cellspacing="0" cellpadding="0" border="0" style="width:540px;margin:0px auto;">
<tr>
<!-- ************************************** -->
<td align="left" style="width: 10px"><img src="./skin/dummy.gif" alt="" style="width:10px;" class="dummy"></td>
<td align="left" style="width: 260px;">
({if $c_diary_id_prev})
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})">«前の日記</a>
({else})
&nbsp;
({/if})
</td>

<!-- ************************************** -->

<td align="right" style="width: 260px;">
({if $c_diary_id_next})
<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})">次の日記»</a>
({else})
&nbsp;
({/if})
</td>
<td align="right" style="width: 10px"><img src="./skin/dummy.gif" alt="dummy" style="width:10px;" class="dummy"></td>
<!-- ************************************** -->

</tr>
</table>

<img class="v_spacer_l" alt="dummy" src="./skin/dummy.gif"/>

({/if})
<!-- ******ここまで：前の日記／次の日記****** -->
<!-- ******************************** -->

<!-- ********************************** -->
<!-- ******ここから：コメントを書く****** -->

<a name="write"></a>

({t_form _enctype=file m=pc a=page_fh_diary_comment_confirm})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:524px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：コメントを書く＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:486px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">コメントを書く</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:522px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:95px;" class="bg_05" align="center" valign="middle">
<div style="padding:4px 4px;" class="lh_120">

本　　文

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<textarea class="text" name="body" rows="8" cols="40" style="width:419px">({$requests.body})</textarea>

</div>
</td>
<td style="width:1px" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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

<input type="file" name="upfile_1" size="40">

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

<input type="file" name="upfile_2" size="40">

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

<input type="file" name="upfile_3" size="40">

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
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：コメントを書く＞＞内容* -->
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
<!-- ******ここまで：コメントを書く****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
