<div id="LayoutC">
<div id="Center">

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>あなたが({$WORD_FRIEND})リンクを要請しているメンバー</h3></div>

<div class="pagerAbsolute">
({if $anataga_c_friend_confirm_list})
<p>以下の人があなたが({$WORD_FRIEND})リンクを要請している人です。<br />要請を取り消したい場合は削除するを選択してください。</p>
({else})
<p>現在({$WORD_FRIEND})リンクを要請してるメンバーはいません。</p>
({/if})
</div>

({if $anataga_c_friend_confirm_list})
<div class="block">
({foreach from=$anataga_c_friend_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})">({$item.nickname})</a></td>
</tr><tr>
<th>メッセージ</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_delete_c_friend_to_confirm})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_sakujo})" alt="削除する" /></a></span></left></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>あなたが参加を希望している({$WORD_COMMUNITY})リスト</h3></div>

<div class="pagerAbsolute">
({if $anataga_c_commu_member_confirm_list})
<p>以下の({$WORD_COMMUNITY})に参加を希望しています。<br />要請を取り消したい場合は削除するを選択してください。</p>
({else})
<p>現在あなたは承認が必要な({$WORD_COMMUNITY})に参加を要請していません。</p>
({/if})
</div>

({if $anataga_c_commu_member_confirm_list})
<div class="block">
({foreach from=$anataga_c_commu_member_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></td>
</tr><tr>
<th>参加希望<br />({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>メッセージ</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_member_to_confirm})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_sakujo})" alt="削除する" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>あなたが({$WORD_COMMUNITY})の管理者交代を要請しているメンバー</h3></div>

<div class="pagerAbsolute">
({if $anataga_c_commu_admin_confirm_list})
<p>以下の({$WORD_COMMUNITY})であなたが管理者交代を要請しています。<br />取り消したい場合は削除するを選択してください。</p>
({else})
<p>現在あなたは({$WORD_COMMUNITY})の管理者交代を要請していません。</p>
({/if})
</div>

({if $anataga_c_commu_admin_confirm_list})
<div class="block">
({foreach from=$anataga_c_commu_admin_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">({$item.nickname})</a></td>
</tr><tr>
<th>({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>メッセージ</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_admin_to_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_sakujo})" alt="削除する" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>あなたが({$WORD_COMMUNITY})の副管理者を要請しているメンバー</h3></div>

<div class="pagerAbsolute">
({if $anataga_c_commu_sub_admin_confirm_list})
<p>以下の({$WORD_COMMUNITY})であなたが副管理者を要請しています。<br />取り消したい場合は削除するを選択してください。</p>
({else})
<p>現在あなたは({$WORD_COMMUNITY})の副管理者を要請していません。</p>
({/if})
</div>

({if $anataga_c_commu_sub_admin_confirm_list})
<div class="block">
({foreach from=$anataga_c_commu_sub_admin_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">({$item.nickname})</a></td>
</tr><tr>
<th>({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>メッセージ</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_sub_admin_to_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_sakujo})" alt="削除する" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
