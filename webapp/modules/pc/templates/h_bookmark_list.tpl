<div id="LayoutC">
<div id="Center">

({if !$c_members_num})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>お気に入り</h3></div>
<div class="block">
<p>まだお気に入り登録がありません。</p>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>お気に入り</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_bookmark_list})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$pager_index.displaying_first})名～({$pager_index.displaying_last})名を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_bookmark_list})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_members item=c_member})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})"><img src="({t_img_url filename=$c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$c_member.nickname})</td>
</tr><tr>
<th>自己紹介</th><td>({$c_member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>最終ログイン</th><td><span class="text">({$c_member.last_login})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a> <a href="({t_url m=pc a=do_f_bookmark_delete})&amp;target_c_member_id=({$c_member.c_member_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_sakujo})" alt="削除する" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
