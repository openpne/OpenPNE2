<div id="LayoutC">
<div id="Center">

({if $fh_com_list_user})

<!-- ************************************************* -->
<!-- ******ここから：グループ一覧（メンバー有り）****** -->
<div id="commu_list" class="border_07" style="width:580px;margin:0px auto;">

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：グループ一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">グループリスト</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：ページ切り替えタブ：上 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="center">
[({foreach from=$page_list item=item})
({if $item == $page})
({$item})
({else})
<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({/if})
({/foreach})]
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：ページ切り替えタブ：上 -->
<!-- ここから：ページ切り替えメニュー：上 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="right">
({if $pager.prev_page})
<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a>&nbsp;
({/if})
({$pager.start_num})件～({$pager.end_num})件を表示
({if $pager.next_page})
&nbsp;<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a>
({/if})
&nbsp;
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：ページ切り替えメニュー：上 -->
<!-- ここから：サムネイルと名前 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">

({if $fh_com_list_user.0})
<!-- ここから：サムネイル＞＞一段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=0 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞一段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞一段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=0 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞一段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.5})
<!-- ここから：サムネイル＞＞二段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=5 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞二段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞二段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=5 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞二段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.10})
<!-- ここから：サムネイル＞＞三段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=10 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞三段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞三段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=10 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞三段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.15})
<!-- ここから：サムネイル＞＞四段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=15 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞四段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞四段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=15 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞四段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.20})
<!-- ここから：サムネイル＞＞五段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=20 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞五段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞五段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=20 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞五段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.25})
<!-- ここから：サムネイル＞＞六段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=25 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞六段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞六段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=25 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞六段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.30})
<!-- ここから：サムネイル＞＞七段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=30 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞七段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞七段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=30 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞七段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.35})
<!-- ここから：サムネイル＞＞八段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=35 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞八段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞八段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=35 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞八段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.40})
<!-- ここから：サムネイル＞＞九段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=40 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞九段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞九段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=40 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞九段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

({if $fh_com_list_user.45})
<!-- ここから：サムネイル＞＞十段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=45 num=5})
<td style="width:111px;" class="bg_03" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({if $item})
({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞十段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここから：名前＞＞十段目 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$fh_com_list_user start=45 num=5})
<td style="width:111px;" class="bg_02" align="center">
({if $item})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({$item.name})(({$item.count_members}))
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({else})
&nbsp;
({/if})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞十段目 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

</table>
<!-- ここまで：サムネイルと名前 -->
<!-- ここから：ページ切り替えタブ：下 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="center">
[({foreach from=$page_list item=item})
({if $item == $page})
({$item})
({else})
<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({/if})
({/foreach})]
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：ページ切り替えタブ：下 -->
<!-- ここから：ページ切り替えメニュー：下 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_02" align="right">
({if $pager.prev_page})
<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a>&nbsp;
({/if})
({$pager.start_num})件～({$pager.end_num})件を表示
({if $pager.next_page})
&nbsp;<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a>
({/if})
&nbsp;
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：ページ切り替えメニュー：下 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：グループ一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</div>
<!-- ******ここまで：グループ一覧（メンバー有り）****** -->
<!-- ************************************************* -->

({else})

<!-- ************************************************* -->
<!-- ******ここから：グループ一覧（メンバー無し）****** -->
<div id="no_commu_list" class="border_07" style="width:580px;margin:0px auto;">

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：グループ一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">グループ一覧</span></td>
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

参加しているグループはありません。

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
<!-- *ここまで：グループ一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</div>
<!-- ******ここまで：グループ一覧（メンバー無し）****** -->
<!-- ************************************************* -->

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
