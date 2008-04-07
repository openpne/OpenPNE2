({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({if $fh_com_list_user})
({* unknown *})
({* #1944 *})({* {{{ photoTable *})
({* #1944 *})<div class="dparts photoTable"><div class="parts">
({* #1944 *})<div class="partsHeading"><h3>グループリスト</h3></div>
({* #1944 *})
({* #1944 *})<div class="pagerAbsolute">
({* #1944 *})<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
({* #1944 *})</div>
({* #1944 *})
({* #1944 *})<div class="pagerRelative">
({* #1944 *})({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
({* #1944 *})<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({* #1944 *})({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
({* #1944 *})</div>
({* #1944 *})
({* #1944 *})<table>
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=0 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=0 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.5})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=5 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=5 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.10})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=10 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=10 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.15})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=15 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=15 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.20})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=20 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=20 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.25})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=25 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=25 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.30})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=30 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=30 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.35})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=35 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=35 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.40})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=40 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=40 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})
({* #1944 *})({if $fh_com_list_user.45})
({* #1944 *})<tr class="photo">
({* #1944 *})({t_loop from=$fh_com_list_user start=45 num=5})
({* #1944 *})<td>({if $item})({if $item.admin_id == $target_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})<tr class="text">
({* #1944 *})({t_loop from=$fh_com_list_user start=45 num=5})
({* #1944 *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({* #1944 *})({/t_loop})
({* #1944 *})</tr>
({* #1944 *})({/if})
({* #1944 *})</table>
({* #1944 *})
({* #1944 *})<div class="pagerAbsolute">
({* #1944 *})<p>[ ({foreach from=$page_list item=item})({if $item == $page})({$item})({else})<a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({/if}) ({/foreach})]</p>
({* #1944 *})</div>
({* #1944 *})
({* #1944 *})<div class="pagerRelative">
({* #1944 *})({if $pager.prev_page})<p class="prev"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
({* #1944 *})<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({* #1944 *})({if $pager.next_page})<p class="next"><a href="({t_url m=biz a=page_fh_group_list})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
({* #1944 *})</div>
({* #1944 *})
({* #1944 *})</div></div>
({* #1944 *})({* }}} *})
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* #1985 *})({* {{{ simpleBox *})
({* #1985 *})<div class="dparts simpleBox"><div class="parts">
({* #1985 *})<div class="partsHeading"><h3>グループ一覧</h3></div>
({* #1985 *})<div class="block">
({* #1985 *})<p>参加しているグループはありません。</p>
({* #1985 *})</div>
({* #1985 *})</div></div>
({* #1985 *})({* }}} *})
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
