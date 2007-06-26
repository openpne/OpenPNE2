({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ(({$count_member}))</font></center>
<hr>
({foreach from=$c_member_list item=c_member })
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a>(({$c_member.friend_count}))<br>
({/foreach})

({if $is_prev || $is_next})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>({/if})

({/if})
<br>
<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})