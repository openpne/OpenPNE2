({* unknown *})({if $group_list})
({* unknown *})({* {{{ homeNineTable *})
({* unknown *})<div class="parts homeNineTable">
({* unknown *})<div class="partsHeading"><h3>グループリスト</h3></div>
({* unknown *})({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({* unknown *})({capture assign=flashvars})({strip})
({* unknown *})({foreach from=$group_list item=item key=key})
({* unknown *})({if $key > 0})&({/if})
({* unknown *})pne_item({$key+1})_id=({$item.biz_group_id})
({* unknown *})&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
({* unknown *})&pne_item({$key+1})_linkurl=({t_url m=pc a=page_g_home _urlencode=true _html=false})%26target_c_commu_id=({$item.biz_group_id})
({* unknown *})&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
({* unknown *})&pne_item({$key+1})_count=({$item.count})
({* unknown *})({/foreach})
({* unknown *})({/strip})({/capture})
({* unknown *})<script type="text/javascript" src="js/show_flash.js"></script>
({* unknown *})<script type="text/javascript">
({* unknown *})<!--
({* unknown *})show_flash('flash/list.swf', '({$flashvars})');
({* unknown *})//-->
({* unknown *})</script>
({* unknown *})({else})
({* unknown *})<table>
({* unknown *})({if $group_list[0]})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$group_list start=0 num=3})
({* unknown *})<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$group_list start=0 num=3})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})({if $group_list[3]})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$group_list start=3 num=3})
({* unknown *})<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$group_list start=3 num=3})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})({if $group_list[6]})
({* unknown *})<tr class="photo">
({* unknown *})({t_loop from=$group_list start=6 num=3})
({* unknown *})<td>({if $item})({if $item.admin_id == $c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})<tr class="text">
({* unknown *})({t_loop from=$group_list start=6 num=3})
({* unknown *})<td>({if $item})<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$item.biz_group_id})">({$item.name}) (({$item.count}))</a>({/if})</td>
({* unknown *})({/t_loop})
({* unknown *})</tr>
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})({/if})
({* unknown *})<div class="block moreInfo">
({* unknown *})<ul class="moreInfo">
({* unknown *})<li><a href="({t_url m=biz a=page_fh_group_list})&amp;target_c_member_id=({$c_member_id})">全てを見る(({$group_count}))</a></li>
({* unknown *})<li><a href="({t_url m=biz a=page_h_biz_group_add})">グループの追加</a></li>
({* unknown *})<li><a href="({t_url m=biz a=page_h_biz_group_find_all})">グループ検索</a></li>
({* unknown *})</ul>
({* unknown *})</div>
({* unknown *})</div>
({* unknown *})({* }}} *})
({* unknown *})({/if})
