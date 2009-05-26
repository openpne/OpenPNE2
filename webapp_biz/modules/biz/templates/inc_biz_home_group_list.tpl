({if $group_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>グループリスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$group_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.biz_group_id})
&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=biz a=page_g_home _urlencode=true _html=false})%26target_c_commu_id=({$item.biz_group_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js?r7140"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>
({else})
<table>
({if $group_list[0]})
<tr class="photo">
({t_loop from=$group_list start=0 num=3})
<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$group_list start=0 num=3})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $group_list[3]})
<tr class="photo">
({t_loop from=$group_list start=3 num=3})
<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$group_list start=3 num=3})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $group_list[6]})
<tr class="photo">
({t_loop from=$group_list start=6 num=3})
<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$group_list start=6 num=3})
<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=biz a=page_fh_group_list})&amp;target_c_member_id=({$c_member_id})">全てを見る(({$group_count}))</a></li>
<li><a href="({t_url m=biz a=page_h_biz_group_add})">グループの追加</a></li>
<li><a href="({t_url m=biz a=page_h_biz_group_find_all})">グループ検索</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})
