<div id="LayoutC">
<div id="Center">

({if $c_commu_list})
({* {{{ manageList *})
<div class="dparts manageList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})管理</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.prev_page})<p class="prev"><a href="({t_url m=pc a=page_h_manage_commu page=$pager.prev_page})">前を表示</a></p>({/if})
({if $pager.total_num})<p class="number">({$pager.start_num})件～({$pager.end_num})件を表示</p>({/if})
({if $pager.next_page})<p class="next"><a href="({t_url m=pc a=page_h_manage_commu page=$pager.next_page})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
({foreach from=$c_commu_list item=item})
<tr>
<td class="photo"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /><br />({$item.name})</a></td>
<td>
<br/>
</td>
<td>
({if $item.is_display_topic_home})
<a href="({t_url m=pc a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$item.c_commu_id})&amp;target_is_display_topic_home=0&amp;sessid=({$PHPSESSID})">
({$WORD_COMMUNITY})最新書き込みを表示しない
({else})
<a href="({t_url m=pc a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$item.c_commu_id})&amp;target_is_display_topic_home=1&amp;sessid=({$PHPSESSID})">
({$WORD_COMMUNITY})最新書き込みを表示する
({/if})
</a></td>
</tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})管理</h3></div>
<div class="block">
<p>({$WORD_COMMUNITY})登録がありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
