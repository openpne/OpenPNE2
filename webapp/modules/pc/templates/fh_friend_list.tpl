({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $target_friend_list_disp})

<!-- *********************************************** -->
<!-- ******ここから：マイフレンド一覧（メンバー有り）****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：マイフレンド一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$WORD_FRIEND})リスト</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：ページ切り替えタブ：上 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="center">

<div class="padding_s">

[({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_fh_friend_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})
({/foreach})]

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：ページ切り替えタブ：上 -->
<!-- ここから：ページ切り替えメニュー：上 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="right">

<div class="padding_s">

({if $is_prev})&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})">前を表示</a>&nbsp;({/if})
({$start_num})件～({$end_num})件を表示&nbsp;
({if $is_next})&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})">次を表示</a>&nbsp;({/if})
&nbsp;

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：ページ切り替えメニュー：上 -->
<!-- ここから：サムネイルとニックネーム -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $target_friend_list_disp.0})
<!-- ここから：サムネイル＞＞一段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=0 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞一段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞一段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=0 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞一段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.5})
<!-- ここから：サムネイル＞＞二段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=5 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞二段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞二段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=5 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞二段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.10})
<!-- ここから：サムネイル＞＞三段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=10 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞三段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞三段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=10 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞三段目 -->
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.15})
<!-- ここから：サムネイル＞＞四段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=15 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞四段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞四段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=15 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞四段目 -->
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.20})
<!-- ここから：サムネイル＞＞五段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=20 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞五段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞五段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=20 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞五段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.25})
<!-- ここから：サムネイル＞＞六段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=25 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞六段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞六段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=25 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞六段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.30})
<!-- ここから：サムネイル＞＞七段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=30 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞七段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞七段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=30 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞七段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})

({if $target_friend_list_disp.35})
<!-- ここから：サムネイル＞＞八段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=35 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞八段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞八段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=35 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞八段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.40})
<!-- ここから：サムネイル＞＞九段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=40 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞九段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞九段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=40 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞九段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $target_friend_list_disp.45})
<!-- ここから：サムネイル＞＞十段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=45 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" style="width:111px;">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：サムネイル＞＞十段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから：ニックネーム＞＞十段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$target_friend_list_disp start=45 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))</a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<!-- ここまで：ニックネーム＞＞十段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})

</table>
<!-- ここまで：サムネイルとニックネーム -->
<!-- ここから：ページ切り替えタブ：下 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="center">

<div class="padding_s">

[({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_fh_friend_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})
({/foreach})]

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：ページ切り替えタブ：下 -->
<!-- ここから：ページ切り替えメニュー：下 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="right">

<div class="padding_s">

({if $is_prev})&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})">前を表示</a>&nbsp;({/if})
({$start_num})件～({$end_num})件を表示&nbsp;
({if $is_next})&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})">次を表示</a>&nbsp;({/if})
&nbsp;

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：ページ切り替えメニュー：下 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：マイフレンド一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：マイフレンド一覧（メンバー有り）****** -->
<!-- *********************************************** -->

({else})

<!-- *********************************************** -->
<!-- ******ここから：マイフレンド一覧（メンバー無し）****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：マイフレンド一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$WORD_MY_FRIEND})一覧</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：主内容 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:564px;height:50px;" class="bg_03" align="center" valign="middle">

({$WORD_MY_FRIEND})登録がありません。

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここまで：主内容 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：マイフレンド一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：マイフレンド一覧（メンバー無し）****** -->
<!-- *********************************************** -->

({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
