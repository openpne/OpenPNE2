({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

({if $c_topic.member_num})
<!-- ******************************** -->
<!-- ******ここから：メンバー一覧（メンバーあり）****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:575px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:561px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:561px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：メンバー一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:559px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:350px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">イベント参加者一覧</span></td>
<td style="width:178px;" align="right" class="bg_06">&nbsp;</td>
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
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:559px;" class="bg_02" align="center" valign="middle">

<div style="padding:4px 3px;text-align:center;">
[ ({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_c_event_member_list})&amp;page=({$item})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">({$item})</a>
({else})({$item})
({/if})
({/foreach})]

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:559px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})<a href="({t_url m=pc a=page_c_event_member_list})&amp;direc=-1&amp;page=({$page})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">＜前</a>({/if})　
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=pc a=page_c_event_member_list})&amp;direc=1&amp;page=({$page})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">次＞</a>({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</tr>
<table border="0" cellspacing="0" cellpadding="0" style="width:561px;">
({*---------------ここから：１行目：写真-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=0 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：１行目：写真-------------------*})
({*---------------ここから：１行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=0 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：１行目：ニックネーム-------------------*})
({*---------------ここから：２行目：写真-------------------*})
({if $c_event_member_list[5]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=5 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：２行目：写真-------------------*})
({*---------------ここから：２行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=5 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：２行目：ニックネーム-------------------*})
({*---------------ここから：３行目：写真-------------------*})
({if $c_event_member_list[10]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=10 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：３行目：写真-------------------*})
({*---------------ここから：３行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=10 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：３行目：ニックネーム-------------------*})
({*---------------ここから：４行目：写真-------------------*})
({if $c_event_member_list[15]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=15 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：４行目：写真-------------------*})
({*---------------ここから：４行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=15 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：４行目：ニックネーム-------------------*})
({*---------------ここから：５行目：写真-------------------*})
({if $c_event_member_list[20]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=20 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：５行目：写真-------------------*})
({*---------------ここから：５行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=20 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：５行目：ニックネーム-------------------*})
({*---------------ここから：６行目：写真-------------------*})
({if $c_event_member_list[25]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=25 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：６行目：写真-------------------*})
({*---------------ここから：６行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=25 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：６行目：ニックネーム-------------------*})
({*---------------ここから：７行目：写真-------------------*})
({if $c_event_member_list[30]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=30 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：７行目：写真-------------------*})
({*---------------ここから：７行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=30 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：７行目：ニックネーム-------------------*})
({*---------------ここから：８行目：写真-------------------*})
({if $c_event_member_list[35]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=35 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：８行目：写真-------------------*})
({*---------------ここから：８行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=35 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：８行目：ニックネーム-------------------*})
({*---------------ここから：９行目：写真-------------------*})
({if $c_event_member_list[40]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=40 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：９行目：写真-------------------*})
({*---------------ここから：９行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=40 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：９行目：ニックネーム-------------------*})
({*---------------ここから：１０行目：写真-------------------*})
({if $c_event_member_list[45]})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=45 num=5})
<td style="width:111px;" class="bg_03" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
({else})
<img src="./skin/dummy.gif" alt="dummy" class="dummy" style="width:76px;height:76px;">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({*---------------ここまで：１０行目：写真-------------------*})
({*---------------ここから：１０行目：ニックネーム-------------------*})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({t_loop from=$c_event_member_list start=45 num=5})
<td style="width:111px;" class="bg_02" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({if $item})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({/t_loop})
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({*---------------ここまで：１０行目：ニックネーム-------------------*})
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:561px;">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:559px;" class="bg_02" align="center" valign="middle">
<div style="padding:4px 3px;text-align:center;">

[ ({foreach from=$page_num item=item})
({if $item!=$page})
<a href="({t_url m=pc a=page_c_event_member_list})&amp;page=({$item})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">({$item})</a>
({else})
({$item})
({/if})
({/foreach})]

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:561px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})<a href="({t_url m=pc a=page_c_event_member_list})&amp;direc=-1&amp;page=({$page})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">＜前</a>({/if})　
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=pc a=page_c_event_member_list})&amp;direc=1&amp;page=({$page})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">次＞</a>({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:561px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:561px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:561px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メンバー一覧（メンバーあり）****** -->
<!-- ******************************** -->

({else})

<!-- *********************************************** -->
<!-- ******ここから：メンバー一覧（メンバーなし）****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：メンバー一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">イベント参加者一覧</span></td>
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

イベントへの参加者がいません。

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
<!-- *ここまで：メンバー一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メンバー一覧（メンバー無し）****** -->
<!-- *********************************************** -->

({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：イベントトップへ****** -->
<div class="content_footer" id="link_event_top" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;
<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">イベント [({$c_topic.name})] トップへ</a>

</div>
<!-- ******ここまで：イベントトップへ****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
