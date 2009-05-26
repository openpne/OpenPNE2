<div id="LayoutC">
<div id="Center">

({if $fh_com_list_user})

({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>グループリスト</h3></div>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
</div>

<table>
<tr class="photo">
({t_loop from=$fh_com_list_user start=0 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=0 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>

({if $fh_com_list_user.5})
<tr class="photo">
({t_loop from=$fh_com_list_user start=5 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=5 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.10})
<tr class="photo">
({t_loop from=$fh_com_list_user start=10 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=10 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.15})
<tr class="photo">
({t_loop from=$fh_com_list_user start=15 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=15 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.20})
<tr class="photo">
({t_loop from=$fh_com_list_user start=20 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=20 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.25})
<tr class="photo">
({t_loop from=$fh_com_list_user start=25 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=25 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.30})
<tr class="photo">
({t_loop from=$fh_com_list_user start=30 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=30 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.35})
<tr class="photo">
({t_loop from=$fh_com_list_user start=35 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=35 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.40})
<tr class="photo">
({t_loop from=$fh_com_list_user start=40 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=40 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $fh_com_list_user.45})
<tr class="photo">
({t_loop from=$fh_com_list_user start=45 num=5})
<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$fh_com_list_user start=45 num=5})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
</div>

</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>グループ一覧</h3></div>
<div class="block">
<p>参加しているグループはありません。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
