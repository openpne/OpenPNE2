<div class="w_screen inc_navi">
({if $INC_NAVI_type=="h" || $INC_NAVI_type=="self"})

<img src="({t_img_url_skin filename=skin_navi_h})" class="bg">
<div class="h">

({foreach from=$navi key=key item=item})
({if $item.url})
<a class="navi_h_({$key+1})" href="({$item.url})"><img src="./skin/dummy.gif" alt="({$item.caption})"></a>
({/if})
({/foreach})

</div>

({elseif $INC_NAVI_type=="f" || $INC_NAVI_type=="other"})

<img src="({t_img_url_skin filename=skin_navi_f})" class="bg">
<div class="f">

({foreach from=$navi key=key item=item})
({if $item.url})
<a class="navi_f_({$key+1})" href="({$item.url})&amp;target_c_member_id=({$INC_NAVI_c_member_id_friend})"><img src="./skin/dummy.gif" alt="({$item.caption})"></a>
({/if})
({/foreach})

</div>

({elseif $INC_NAVI_type=="c"})

<img src="({t_img_url_skin filename=skin_navi_c})" class="bg">
<div class="c">

({foreach from=$navi key=key item=item})
({if $item.url})
<a class="navi_c_({$key+1})" href="({$item.url})&amp;target_c_commu_id=({$INC_NAVI_c_commu_id})"><img src="./skin/dummy.gif" alt="({$item.caption})"></a>
({/if})
({/foreach})

</div>

({/if})
</div>