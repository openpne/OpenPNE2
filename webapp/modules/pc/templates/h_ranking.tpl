<div id="LayoutB">

<div id="Left">

({* {{{ rankingSideNav *})
<div class="parts rankingSideNav">
<div class="item">
<div class="partsHeading"><h3>アクセス数No1</h3></div>
<p>昨日のアクセスが多かったメンバーのランキングです。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})">アクセス数No1</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})数No1</h3></div>
<p>登録されている({$WORD_MY_FRIEND})の数が多いメンバーのランキングです。
</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=friend">({$WORD_MY_FRIEND})数No1</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>参加人数No１({$WORD_COMMUNITY})</h3></div>
<p>参加者の多い({$WORD_COMMUNITY})のランキングです。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=com_member">参加人数No１<br />({$WORD_COMMUNITY})を表示</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>盛り上がり度No１({$WORD_COMMUNITY})</h3></div>
<p>昨日の掲示板書き込み数が多かった({$WORD_COMMUNITY})のランキングです。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=com_comment">盛り上がり度No１<br />({$WORD_COMMUNITY})を表示</a></p>
</div>
</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({foreach from=$rank_list key=rank item=list name=ranking})
({if $rank == 1})({assign var=size value=120})({else})({assign var=size value=76})({/if})

({* {{{ rankingList *})
<div class="dparts rankingList"><div class="parts">
({if $rank == 1})
<div class="partsHeading"><p>({strip})
<strong>
({if $kind == "ashiato"})
アクセス数No1メンバー
({elseif $kind == "friend"})
({$WORD_MY_FRIEND})数No1メンバー
({elseif $kind == "com_member"})
参加人数No１({$WORD_COMMUNITY})
({elseif $kind == "com_comment"})
盛り上がり度No1({$WORD_COMMUNITY})
({/if})
</strong>
は
({if $kind == "ashiato" || $kind == "friend"})
({$list[0].c_member.nickname}) さん
({else})『({$list[0].c_commu.name})』
({/if})
です。
({/strip})</p></div>
({/if})
({if $rank > 1})<div class="ditem"><div class="item">({/if})
({foreach from=$list item=item})
<table>
<tr><td class="photo" rowspan="({if $kind == "ashiato" || $kind == "friend"})2({else})4({/if})">({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.c_member.image_filename w=$size h=$size noimg=no_image})" alt="" /></a>
({else})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.c_commu.image_filename w=$size h=$size noimg=no_logo})" alt="" /></a>
({/if})
({/strip})</td>
<th>第({$rank})位</th>
<td class="name">({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.c_member.nickname})</a> さん
({else})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu.name})</a>
({/if})
 ：
({if $kind == "ashiato"})
({$item.count})アクセス
({elseif $kind == "friend"})
({$item.count})人
({elseif $kind == "com_member"})
({$item.count})人
({elseif $kind == "com_comment"})
書き込み({$item.count})件
({/if})
({/strip})</td>
</tr>
({if $kind == "ashiato" || $kind == "friend"})
<tr>
<th>自己紹介</th>
<td>({$item.c_member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr>
({elseif $kind == "com_member" || $kind == "com_comment"})
<tr>
<th>カテゴリ</th>
<td>({$item.c_commu.c_commu_category.name})</td>
</tr>
<tr>
<th>管理者</th>
<td>({$item.c_commu.c_member_admin.nickname})</td>
</tr>
<tr>
<th>説明文</th>
<td>({$item.c_commu.info|t_truncate:36:"":3})</td>
</tr>
({/if})
</table>
({/foreach})
({if $rank > 1})</div></div>({/if})
</div></div>
({* }}} *})

({/foreach})

</div><!-- Center -->
</div><!-- LayoutB -->
