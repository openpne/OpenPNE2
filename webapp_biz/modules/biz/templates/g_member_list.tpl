({$inc_html_header|smarty:nodefaults})
<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container main_content">
<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：メンバー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:575px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:561px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:559px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="./skin/content_header_1.gif" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:523px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">グループメンバー</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:561px;">
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:559px;" class="bg_02" align="center" valign="middle">
<div style="padding:4px 3px;text-align:center;">

[ ({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=biz a=page_g_member_list})&amp;start=({$item})&amp;target_c_commu_id=({$c_commu_id})">({$item})</a>
({else})({$item})
({/if})
 ({/foreach})]

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:559px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})<a href="({t_url m=biz a=page_c_member_list})&amp;direc=-1&amp;page=({$page})&amp;target_c_commu_id=({$c_commu_id})">＜前</a>({/if})　
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=biz a=page_c_member_list})&amp;direc=1&amp;page=({$page})&amp;target_c_commu_id=({$c_commu_id})">次＞</a>({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:561px;">
({*********})
({*---------------ここから：１行目：画像-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=0 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：１行目：画像-------------------*})
({*---------------ここから：１行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=0 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：１行目：ニックネーム-------------------*})
({*---------------ここから：２行目：画像-------------------*})
({if $c_member_list[5]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=5 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：２行目：画像-------------------*})
({*---------------ここから：２行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=5 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：２行目：ニックネーム-------------------*})
({*---------------ここから：３行目：画像-------------------*})
({if $c_member_list[10]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=10 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：３行目：画像-------------------*})
({*---------------ここから：３行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=10 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：３行目：ニックネーム-------------------*})
({*---------------ここから：４行目：画像-------------------*})
({if $c_member_list[15]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=15 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：４行目：画像-------------------*})
({*---------------ここから：４行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=15 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：４行目：ニックネーム-------------------*})
({*---------------ここから：５行目：画像-------------------*})
({if $c_member_list[20]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=20 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：５行目：画像-------------------*})
({*---------------ここから：５行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=20 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：５行目：ニックネーム-------------------*})
({*---------------ここから：６行目：画像-------------------*})
({if $c_member_list[25]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=25 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：６行目：画像-------------------*})
({*---------------ここから：６行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=25 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：６行目：ニックネーム-------------------*})
({*---------------ここから：７行目：画像-------------------*})
({if $c_member_list[30]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=30 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：７行目：画像-------------------*})
({*---------------ここから：７行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=30 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：７行目：ニックネーム-------------------*})
({*---------------ここから：８行目：画像-------------------*})
({if $c_member_list[35]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=35 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：８行目：画像-------------------*})
({*---------------ここから：８行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=35 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：８行目：ニックネーム-------------------*})
({*---------------ここから：９行目：画像-------------------*})
({if $c_member_list[40]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=40 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：９行目：画像-------------------*})
({*---------------ここから：９行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=40 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：９行目：ニックネーム-------------------*})
({*---------------ここから：１０行目：画像-------------------*})
({if $c_member_list[45]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=45 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="./skin/icon_crown.gif" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=72 h=72 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" class="dummy" style="width:72px;height:72px;">
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({*---------------ここまで：１０行目：画像-------------------*})
({*---------------ここから：１０行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({t_loop from=$c_member_list start=45 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：１０行目：ニックネーム-------------------*})
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:561px;">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:559px;" class="bg_02" align="center" valign="middle">
<div style="padding:4px 3px;text-align:center;">

[ ({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=biz a=page_c_member_list})&amp;page=({$item})&amp;target_c_commu_id=({$c_commu_id})">({$item})</a>
({else})({$item})
({/if})
 ({/foreach})]

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:559px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})<a href="({t_url m=biz a=page_c_member_list})&amp;direc=-1&amp;page=({$page})&amp;target_c_commu_id=({$c_commu_id})">＜前</a>({/if})　
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=biz a=page_c_member_list})&amp;direc=1&amp;page=({$page})&amp;target_c_commu_id=({$c_commu_id})">次＞</a>({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：メンバー一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：メンバー一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
</td>
</tr>
</table>({*END:container*})
</td>
</tr>
<tr>
<td class="container inc_page_footer">
({$inc_page_footer|smarty:nodefaults})
</td>
</tr>
</table>
({ext_include file="inc_extension_pagelayout_bottom.tpl"})
</body>
</html>
