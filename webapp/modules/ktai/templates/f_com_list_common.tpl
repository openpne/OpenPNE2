({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">共通ｺﾐｭﾆﾃｨﾘｽﾄ(({$common_commu_count}))</font></center>
<hr>

({foreach from=$common_commu_list item=c_commu})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name})</a>(({$c_commu.count_members}))<br>
({/foreach})
<br>
({if $is_prev || $is_next})

({if $is_prev})<a href="({t_url m=ktai a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})

({/if})
<hr>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})