<div id="LayoutC">
<div id="Center">

({if $common_commu_list})

({* {{{ photoTable *})
<!-- ******ここから：コミュニティ一覧（メンバー有り）****** -->
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>共通コミュニティリスト</h3></div>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_list item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $pager.prev_page})
<p class="prev"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>
({/if})
<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({if $pager.next_page})
<p class="next"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>
({/if})
</div>

<table>
({if $common_commu_list.0})
<!-- ここから：サムネイル＞＞一段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=0 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞一段目 -->
<!-- ここから：名前＞＞一段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞一段目 -->
({/if})
({if $common_commu_list.5})
<!-- ここから：サムネイル＞＞二段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=5 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞二段目 -->
<!-- ここから：名前＞＞二段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞二段目 -->
({/if})
({if $common_commu_list.10})
<!-- ここから：サムネイル＞＞三段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=10 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞三段目 -->
<!-- ここから：名前＞＞三段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞三段目 -->
({/if})
({if $common_commu_list.15})
<!-- ここから：サムネイル＞＞四段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=15 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞四段目 -->
<!-- ここから：名前＞＞四段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞四段目 -->
({/if})
({if $common_commu_list.20})
<!-- ここから：サムネイル＞＞五段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=20 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞五段目 -->
<!-- ここから：名前＞＞五段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞五段目 -->
({/if})
({if $common_commu_list.25})
<!-- ここから：サムネイル＞＞六段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=25 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞六段目 -->
<!-- ここから：名前＞＞六段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞六段目 -->
({/if})
({if $common_commu_list.30})
<!-- ここから：サムネイル＞＞七段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=30 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞七段目 -->
<!-- ここから：名前＞＞七段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞七段目 -->
({/if})
({if $common_commu_list.35})
<!-- ここから：サムネイル＞＞八段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=35 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞八段目 -->
<!-- ここから：名前＞＞八段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞八段目 -->
({/if})
({if $common_commu_list.40})
<!-- ここから：サムネイル＞＞九段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=40 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞九段目 -->
<!-- ここから：名前＞＞九段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞九段目 -->
({/if})
({if $common_commu_list.45})
<!-- ここから：サムネイル＞＞十段目 -->
<tr class="photo">
({t_loop from=$common_commu_list start=45 num=5})
<td>({if $item})({if $item.c_member_id_admin == $target_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" alt="" /><br />({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞十段目 -->
<tr class="text">
({t_loop from=$common_commu_list start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_members}))</a>
({else})
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：名前＞＞十段目 -->
({/if})
</table>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_list item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $pager.prev_page})
<p class="prev"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.prev_page})&amp;target_c_member_id=({$target_member.c_member_id})">前を表示</a></p>
({/if})
<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>
({if $pager.next_page})
<p class="next"><a href="({t_url m=pc a=page_f_com_list_common})&amp;page=({$pager.next_page})&amp;target_c_member_id=({$target_member.c_member_id})">次を表示</a></p>
({/if})
</div>

</div></div>
<!-- ******ここまで：コミュニティ一覧（メンバー有り）****** -->
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>共通コミュニティ一覧</h3></div>
<div class="block">
<p>共通のコミュニティはありません。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
