<div id="LayoutC">
<div id="Center">

({if $c_topic.member_num})
({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>イベント参加者一覧</h3></div>

({capture name=pager})({strip})
<div class="pagerAbsolute">
<p>[ ({foreach from=$page_num item=item})({if $item != $page})<a href="({t_url m=pc a=page_c_event_member_list})&amp;page=({$item})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">({$item})</a>({else})({$item})({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_event_member_list})&amp;page=({$page-1})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_event_member_list})&amp;page=({$page+1})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
<tr class="photo">
({t_loop from=$c_event_member_list start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>

({if $c_event_member_list[5]})
<tr class="photo">
({t_loop from=$c_event_member_list start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[10]})
<tr class="photo">
({t_loop from=$c_event_member_list start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[15]})
<tr class="photo">
({t_loop from=$c_event_member_list start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[20]})
<tr class="photo">
({t_loop from=$c_event_member_list start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[25]})
<tr class="photo">
({t_loop from=$c_event_member_list start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[30]})
<tr class="photo">
({t_loop from=$c_event_member_list start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[35]})
<tr class="photo">
({t_loop from=$c_event_member_list start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[40]})
<tr class="photo">
({t_loop from=$c_event_member_list start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $c_event_member_list[45]})
<tr class="photo">
({t_loop from=$c_event_member_list start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_event_member_list start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname|default:"&nbsp;"})</a>({/if})</td>
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
<div class="partsHeading"><h3>イベント参加者一覧</h3></div>
<div class="block">
<p>イベントへの参加者がいません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">イベント [({$c_topic.name})] トップへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
