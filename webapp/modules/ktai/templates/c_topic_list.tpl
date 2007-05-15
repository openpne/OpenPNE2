({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu.name})</font></center>
<hr>

■ﾄﾋﾟｯｸﾘｽﾄ<br>
<br>
({foreach from=$c_topic_list item=item})
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name})</a>(({$item.write_num}))<br>
({/foreach})

({* pager *})
({if $is_prev || $is_next})
<br>
({if $is_prev})
<a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a>
({/if})
({if $is_next})
<a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>
({/if})
({/if})

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})