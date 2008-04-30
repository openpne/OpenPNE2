({if $INC_NAVI_type === 'h'})
<div class="parts localNav" id="hLocalNav">
<ul>
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="hLocalNav_({$key+1})"><a href="({$item.url})">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
</div>
({elseif $INC_NAVI_type === 'f'})
<div class="parts localNav" id="fLocalNav">
<ul>
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="fLocalNav_({$key+1})"><a href="({$item.url})&amp;target_c_member_id=({$INC_NAVI_c_member_id_friend})">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
</div>
({elseif $INC_NAVI_type === 'c'})
<div class="parts localNav" id="cLocalNav">
<ul>
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="cLocalNav_({$key+1})"><a href="({$item.url})&amp;target_c_commu_id=({$INC_NAVI_c_commu_id})">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
</div>
({/if})
