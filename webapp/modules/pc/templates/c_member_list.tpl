<div id="LayoutC">
<div id="Center">

({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})メンバー</h3></div>

({capture name=pager})({strip})
<div class="pagerAbsolute">
<p>[ ({foreach from=$page_num item=item})({if $item!=$page})<a href="({t_url m=pc a=page_c_member_list})&amp;page=({$item})&amp;target_c_commu_id=({$c_commu_id})">({$item})</a>({else})({$item})({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_member_list})&amp;page=({$page-1})&amp;target_c_commu_id=({$c_commu_id})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_member_list})&amp;page=({$page+1})&amp;target_c_commu_id=({$c_commu_id})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
<tr class="photo">
({t_loop from=$c_member_list start=0 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>

({if $c_member_list[5]})
<tr class="photo">
({t_loop from=$c_member_list start=5 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[10]})
<tr class="photo">
({t_loop from=$c_member_list start=10 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[15]})
<tr class="photo">
({t_loop from=$c_member_list start=15 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[20]})
<tr class="photo">
({t_loop from=$c_member_list start=20 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[25]})
<tr class="photo">
({t_loop from=$c_member_list start=25 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[30]})
<tr class="photo">
({t_loop from=$c_member_list start=30 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[35]})
<tr class="photo">
({t_loop from=$c_member_list start=35 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[40]})
<tr class="photo">
({t_loop from=$c_member_list start=40 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_member_list[45]})
<tr class="photo">
({t_loop from=$c_member_list start=45 num=5})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_member_list start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
