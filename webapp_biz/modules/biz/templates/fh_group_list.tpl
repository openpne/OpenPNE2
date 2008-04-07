({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({if $fh_com_list_user})
({* unknown *})
({* unknown *})({* {{{ photoTable *})
({* unknown *})<div class="dparts photoTable"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループリスト</h3></div>
({* unknown *})
({* unknown *})<div class="pagerAbsolute">
({* unknown *})<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({* unknown *})({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})<table>
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=0 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=0 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})
({* unknown *})({if $fh_com_list_user.5})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=5 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=5 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.10})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=10 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=10 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.15})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=15 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=15 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.20})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=20 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=20 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.25})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=25 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=25 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.30})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=30 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=30 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.35})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=35 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=35 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.40})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=40 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=40 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({if $fh_com_list_user.45})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$fh_com_list_user start=45 num=5})
({* unknown *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$fh_com_list_user start=45 num=5})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})
({* unknown *})<div class="pagerAbsolute">
({* unknown *})<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({* unknown *})({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* unknown *})({* {{{ simpleBox *})
({* unknown *})<div class="dparts simpleBox"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループ一覧</h3></div>
({* unknown *})<div class="block">
({* unknown *})<p>参加しているグループはありません。</p>
({* unknown *})</div>
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
