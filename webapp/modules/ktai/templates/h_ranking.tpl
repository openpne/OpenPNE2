({$inc_ktai_header|smarty:nodefaults})
<center>ランキング</center>
<hr>

<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=ashiato&amp;({$tail})">ｱｸｾｽ数No1</a><br>
<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=friend&amp;({$tail})">({$WORD_MY_FRIEND_HALF})数No1</a><br>
<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=com_member&amp;({$tail})">参加人数No1ｺﾐｭﾆﾃｨ</a><br>
<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=com_comment&amp;({$tail})">盛り上がり度No1ｺﾐｭﾆﾃｨ</a><br>
<hr>

({if $kind == "ashiato"})
ｱｸｾｽ数
({elseif $kind == "friend"})
({$WORD_MY_FRIEND_HALF})数
({elseif $kind == "com_member"})
ｺﾐｭﾆﾃｨ参加人数
({elseif $kind == "com_comment"})
ｺﾐｭﾆﾃｨ盛り上がり度
({/if})
ﾗﾝｷﾝｸﾞ<br>
<br>

({foreach from=$rank_list key=rank item=list name=ranking})
({if $rank == 1})

({foreach from=$list item=item})
第({$rank})位
({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.c_member.nickname})</a>さん
({else})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.c_commu.name})</a>
({/if})
：
({if $kind == "ashiato"})
({$item.count})ｱｸｾｽ
({elseif $kind == "friend"})
({$item.count})人
({elseif $kind == "com_member"})
({$item.count})人
({elseif $kind == "com_comment"})
書き込み({$item.count})件
({/if})
<br>
({/strip})
({/foreach})

({else})

({foreach from=$list item=item})
第({$rank})位
({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.c_member.nickname})</a>さん
({else})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.c_commu.name})</a>
({/if})：({if $kind == "ashiato"})
({$item.count})ｱｸｾｽ
({elseif $kind == "friend"})
({$item.count})人
({elseif $kind == "com_member"})
({$item.count})人
({elseif $kind == "com_comment"})
書き込み({$item.count})件
({/if})
<br>
({/strip})
({/foreach})
({/if})

({foreachelse})
ﾗﾝｷﾝｸﾞﾃﾞｰﾀがありません<br>
({/foreach})

<br>
({if $kind == "ashiato"})
昨日のｱｸｾｽ数が多かったﾒﾝﾊﾞｰのﾗﾝｷﾝｸﾞです。
({elseif $kind == "friend"})
登録されている({$WORD_MY_FRIEND_HALF})の数が多いﾒﾝﾊﾞｰのﾗﾝｷﾝｸﾞです。
({elseif $kind == "com_member"})
参加者の多いｺﾐｭﾆﾃｨのﾗﾝｷﾝｸﾞです。
({elseif $kind == "com_comment"})
昨日の掲示板書き込み数が多かったｺﾐｭﾆﾃｨのﾗﾝｷﾝｸﾞです。
({/if})

<hr>

({$inc_ktai_footer|smarty:nodefaults})