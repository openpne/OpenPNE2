({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：メッセージテーブル****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- 小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">Todo投稿履歴</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->

({if $posted_list})
<!-- ここから：主内容＞＞タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:634px;" align="right" class="bg_02">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
</tr>
</table>
<!-- ここまで：主内容＞＞タブ -->
<!-- ここから：主内容＞＞コメント一覧 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({foreach from=$posted_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:180px;" class="bg_05">

<div class="padding_s">
({if $item.r_datetime})
	({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({else})
	投稿日時記録以前のTodo
({/if})
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:453px;" class="bg_02">

<div class="padding_s">
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})&amp;target_id=({$item.c_member_id})">({$item.memo})</a>
（({if $item.member_name})
({$item.member_name})
({else})
共有Todo
({/if})
）
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞コメント一覧 -->
<!-- ここから：主内容＞＞タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:634px;" align="right" class="bg_02">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
</tr>
</table>
<!-- ここまで：主内容＞＞タブ -->

({else})
<!-- ここから：主内容＞＞メッセージ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td align="center" class="bg_02">

<div style="padding:10px;">

投稿済みのTodoはありません

</div>

</td>
</tr>
</table>
<!-- ここまで：主内容＞＞メッセージ -->

({/if})

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：メッセージテーブル****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
