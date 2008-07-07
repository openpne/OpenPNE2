({if $group_list})
<!-- ************************************ -->
<!-- ******ここから：グループ一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：コミュニティ一覧＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">グループリスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="1" cellpadding="2" style="width:268px" class="bg_07">

({if $group_list[0]})
({*１行目img*})
<tr>

({t_loop from=$group_list start=0 num=3})
({if $item})
<td style="width:88px;" class="bg_03" align="center">
({if $item.admin_id == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td style="width:88px;" class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({*１行目name*})
<tr>

({t_loop item=item from=$group_list start=0 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
({$item.name})(({$item.count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $group_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$group_list start=3 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.admin_id == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ２行目name -->
<tr>

({t_loop from=$group_list start=3 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
({$item.name})(({$item.count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $group_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$group_list start=6 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.admin_id == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ３行目name -->
<tr>

({t_loop from=$group_list start=6 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">
({$item.name})(({$item.count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

</table>

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px">

<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:115px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:115px;height:1px;" class="dummy"></td>
<td align="left" style="width:136px;padding:2px 0px;" class="bg_02 lh_110">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=biz a=page_fh_group_list})&amp;target_c_member_id=({$c_member_id})">全てを見る(({$group_count}))</a></br>
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=biz a=page_h_biz_group_add})">グループの追加</a><br>
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=biz a=page_h_biz_group_find_all})">グループ検索</a>
</td>
<td style="width:15px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:15px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

<tr>
<td style="width:268px;" class="bg_07" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
<!-- *ここまで：グループ一覧＞＞内容* -->
</td>
</tr>
</table>
<!-- ******ここまで：グループ一覧****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if})
