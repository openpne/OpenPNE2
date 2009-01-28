<div id="LayoutC">
<div id="Center">

({if $c_member_list})
({* {{{ manageList *})
<div class="dparts manageList"><div class="parts">
<div class="partsHeading"><h3>メンバー管理</h3></div>

({capture name=pager})({strip})
({if $is_prev || $is_next})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
<colgroup>
<col class="date" />
<col class="name" />
</colgroup>
<colgroup class="operation">
<col class="delete" />
<col class="subadmin" />
<col class="admin" />
</colgroup>
({foreach from=$c_member_list item=c_member})
<tr>
<td>({$c_member.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a></td>
<td>
({if !$c_member.is_c_commu_admin})
<a href="({t_url m=pc a=page_c_edit_member_delete_c_commu_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">({$WORD_COMMUNITY})から退会させる</a>
({/if})
</td>
<td>
({if !$c_member.is_c_commu_admin
 &&  !$c_member.is_c_commu_sub_admin
 &&   $c_member.c_commu_admin_confirm_id <= 0
 &&   $c_member.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
<a href="({t_url m=pc a=page_c_sub_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者に指名</a>
({elseif $c_member.is_c_commu_sub_admin && $c_commu.c_member_id_sub_admin != $u })
<a href="({t_url m=pc a=page_c_sub_admin_delete})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者から降格</a>
({/if})
</td>
<td>
({if !($c_member.is_c_commu_admin && !$c_member.is_c_commu_sub_admin)
 &&   $c_member.c_commu_admin_confirm_id <= 0
 &&   $c_member.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
<a href="({t_url m=pc a=page_c_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">管理権を渡す</a>
({/if})
</td>
</tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
