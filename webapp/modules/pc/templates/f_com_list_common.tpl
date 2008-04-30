<div id="LayoutC">
<div id="Center">

({if $common_commu_list})
({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>共通({$WORD_COMMUNITY})リスト</h3></div>

({capture name=pager})({strip})
<div class="pagerAbsolute">
<p>[ ({foreach from=$page_list item=item})({if $item!=$page})<a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({else})({$item})({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $pager.prev_page})<p class="prev"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>({/if})
<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({if $pager.next_page})<p class="next"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
<tr class="photo">
({t_loop from=$common_commu_list start=0 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>

({if $common_commu_list.5})
<tr class="photo">
({t_loop from=$common_commu_list start=5 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.10})
<tr class="photo">
({t_loop from=$common_commu_list start=10 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.15})
<tr class="photo">
({t_loop from=$common_commu_list start=15 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.20})
<tr class="photo">
({t_loop from=$common_commu_list start=20 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.25})
<tr class="photo">
({t_loop from=$common_commu_list start=25 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.30})
<tr class="photo">
({t_loop from=$common_commu_list start=30 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.35})
<tr class="photo">
({t_loop from=$common_commu_list start=35 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.40})
<tr class="photo">
({t_loop from=$common_commu_list start=40 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $common_commu_list.45})
<tr class="photo">
({t_loop from=$common_commu_list start=45 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$common_commu_list start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>共通({$WORD_COMMUNITY})一覧</h3></div>
<div class="block">
<p>共通の({$WORD_COMMUNITY})はありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
