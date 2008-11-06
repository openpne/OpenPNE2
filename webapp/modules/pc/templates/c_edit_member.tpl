({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ***************************************************** -->
<!-- ******ここから：メッセージテーブル管理メンバー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- 小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:240px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">メンバー管理</span></td>
<td style="width:388px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $c_member_list})({*<<メンバー一覧：if*})
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:642px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})
({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$c_member_list item=c_member})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:178px;" class="bg_03 padding_s">

<span class="c_01">({$c_member.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</span>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:220px;" class="bg_02 padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">

({if !$c_member.is_c_commu_admin||$c_member.is_c_commu_sub_adomin})
<a href="({t_url m=pc a=page_c_edit_member_delete_c_commu_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">コミュニティから退会させる</a>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">

({if $c_commu.c_member_id_sub_admin != $u})
({if $c_member.is_c_commu_sub_admin})
<a href="({t_url m=pc a=page_c_sub_admin_delete})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者から降格</a>
({elseif $c_member.c_commu_sub_admin_confirm_id > 0})
<a href="({t_url m=pc a=page_h_confirm_to_list})"><strong>申請を取り消し</strong></a>
({elseif !$c_member.c_commu_admin_confirm_id <= 0})
<a href="({t_url m=pc a=page_c_sub_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者に指名</a>
({else})
&nbsp;
({/if})

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">

({if $c_member.c_commu_admin_confirm_id > 0})
<a href="({t_url m=pc a=page_h_confirm_to_list})"><strong>申請を取り消し</strong></a>
({elseif $c_member.c_commu_sub_admin_confirm_id <= 0})
<a href="({t_url m=pc a=page_c_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">管理権を渡す</a>
({else})
&nbsp;
({/if})

</td>

({else})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">
&nbsp;
</td>
({/if})

({else})
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">
&nbsp;
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:80px;" class="bg_02 padding_s">
&nbsp;
</td>
({/if})

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>

<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:642px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})
({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>

({/if})({*<<メンバー一覧：if*})

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メッセージテーブル管理メンバー一覧****** -->
<!-- ***************************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})

