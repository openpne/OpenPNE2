<div id="LayoutC">
<div id="Center">

({if $target_friend_list_disp})
({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_FRIEND})リスト</h3></div>

({capture name=pager})({strip})
<div class="pagerAbsolute">
<p>[ ({foreach from=$page_num item=item})({if $item!=$page})<a href="({t_url m=pc a=page_fh_friend_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>({else})({$item})({/if}) ({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
({if $target_friend_list_disp.0})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.5})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.10})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.15})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.20})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.25})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.30})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.35})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.40})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_friend_list_disp.45})
<tr class="photo">
({t_loop from=$target_friend_list_disp start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_friend_list_disp start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
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
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})一覧</h3></div>
<div class="block">
<p>({$WORD_MY_FRIEND})登録がありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
