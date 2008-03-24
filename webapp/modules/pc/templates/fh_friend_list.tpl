<div id="LayoutC">
<div id="Center">

({if $target_friend_list_disp})

({* {{{ photoTable *})
<!-- ******ここから：マイフレンド一覧（メンバー有り）****** -->
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_FRIEND})リスト</h3></div>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_fh_friend_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $is_prev})
<p class="prev">&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})">前を表示</a>&nbsp;</p>
({/if})
<p class="number">({$start_num})件～({$end_num})件を表示&nbsp;</p>
({if $is_next})
<p class="next">&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})">次を表示</a>&nbsp;</p>
({/if})
&nbsp;
</div>

<table>
({if $target_friend_list_disp.0})
<!-- ここから：サムネイル＞＞一段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞一段目 -->
<!-- ここから：ニックネーム＞＞一段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=0 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞一段目 -->
({/if})
({if $target_friend_list_disp.5})
<!-- ここから：サムネイル＞＞二段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞二段目 -->
<!-- ここから：ニックネーム＞＞二段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=5 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞二段目 -->
({/if})
({if $target_friend_list_disp.10})
<!-- ここから：サムネイル＞＞三段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞三段目 -->
<!-- ここから：ニックネーム＞＞三段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=10 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞三段目 -->
({/if})
({if $target_friend_list_disp.15})
<!-- ここから：サムネイル＞＞四段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr><!-- ここまで：サムネイル＞＞四段目 -->
<!-- ここから：ニックネーム＞＞四段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=15 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞四段目 -->
({/if})
({if $target_friend_list_disp.20})
<!-- ここから：サムネイル＞＞五段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞五段目 -->
<!-- ここから：ニックネーム＞＞五段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=20 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞五段目 -->
({/if})
({if $target_friend_list_disp.25})
<!-- ここから：サムネイル＞＞六段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞六段目 -->
<!-- ここから：ニックネーム＞＞六段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=25 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞六段目 -->
({/if})
({if $target_friend_list_disp.30})
<!-- ここから：サムネイル＞＞七段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞七段目 -->
<!-- ここから：ニックネーム＞＞七段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=30 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞七段目 -->
({/if})
({if $target_friend_list_disp.35})
<!-- ここから：サムネイル＞＞八段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞八段目 -->
<!-- ここから：ニックネーム＞＞八段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=35 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞八段目 -->
({/if})
({if $target_friend_list_disp.40})
<!-- ここから：サムネイル＞＞九段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞九段目 -->
<!-- ここから：ニックネーム＞＞九段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=40 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞九段目 -->
({/if})
({if $target_friend_list_disp.45})
<!-- ここから：サムネイル＞＞十段目 -->
<tr class="photo">
({t_loop from=$target_friend_list_disp start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：サムネイル＞＞十段目 -->
<!-- ここから：ニックネーム＞＞十段目 -->
<tr class="text">
({t_loop from=$target_friend_list_disp start=45 num=5})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>
({else})
&nbsp;
({/if})</td>
({/t_loop})
</tr>
<!-- ここまで：ニックネーム＞＞十段目 -->
({/if})
</table>

<div class="pagerAbsolute">
<p>[ ({foreach from=$page_num item=item})
({if $item!=$page})<a href="({t_url m=pc a=page_fh_friend_list})&amp;page=({$item})&amp;target_c_member_id=({$target_member.c_member_id})">({$item})</a>
({else})({$item})
({/if})({/foreach})]</p>
</div>

<div class="pagerRelative">
({if $is_prev})
<p class="prev">&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=-1&amp;page=({$page})">前を表示</a>&nbsp;</p>
({/if})
<p class="number">({$start_num})件～({$end_num})件を表示&nbsp;</p>
({if $is_next})
<p class="next">&nbsp;<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;direc=1&amp;page=({$page})">次を表示</a>&nbsp;</p>
({/if})
&nbsp;
</div>

</div>
</div>
<!-- ******ここまで：マイフレンド一覧（メンバー有り）****** -->
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
