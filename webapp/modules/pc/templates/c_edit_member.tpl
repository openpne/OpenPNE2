<div id="LayoutC">
<div id="Center">

({* #1958 *})<!-- ******ここから：メッセージテーブル管理メンバー一覧****** -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;" class="border_01">
({* #1958 *})<tr>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy" /></td>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})</tr>
({* #1958 *})<tr>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})<td class="bg_01" align="center">
({* #1958 *})({*ここから：header*})
({* #1958 *})<!-- 小タイトル -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:644px;" class="border_01">
({* #1958 *})<tr>
({* #1958 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1958 *})<td style="width:240px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">メンバー管理</span></td>
({* #1958 *})<td style="width:388px;" align="right" class="bg_06">&nbsp;</td>
({* #1958 *})</tr>
({* #1958 *})</table>
({* #1958 *})<!-- ここまで：小タイトル -->
({* #1958 *})({*ここまで：header*})
({* #1958 *})({*ここから：body*})
({* #1958 *})<!-- ここから：主内容 -->
({* #1958 *})({if $c_member_list})({*<<メンバー一覧：if*})
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:644px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:642px;" class="bg_02" align="right" valign="middle">
({* #1958 *})
({* #1958 *})<div class="padding_s">
({* #1958 *})
({* #1958 *})({if $is_prev})
({* #1958 *})<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* #1958 *})({/if})
({* #1958 *})({if $is_next})
({* #1958 *})&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})</table>
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:644px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})({foreach from=$c_member_list item=c_member})
({* #1958 *})<tr>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:178px;" class="bg_03 padding_s">
({* #1958 *})
({* #1958 *})<span class="c_01">({$c_member.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</span>
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:220px;" class="bg_02 padding_s">
({* #1958 *})
({* #1958 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a>
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:80px;" class="bg_02 padding_s">
({* #1958 *})
({* #1958 *})({if !$c_member.is_c_commu_admin})
({* #1958 *})<a href="({t_url m=pc a=page_c_edit_member_delete_c_commu_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">({$WORD_COMMUNITY})から退会させる</a>
({* #1958 *})({else})
({* #1958 *})&nbsp;
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:80px;" class="bg_02 padding_s">
({* #1958 *})
({* #1958 *})({if !$c_member.is_c_commu_admin
 &&  !$c_member.is_c_commu_sub_admin
 &&   $c_member.c_commu_admin_confirm_id <= 0
 &&   $c_member.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
({* #1958 *})<a href="({t_url m=pc a=page_c_sub_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者に指名</a>
({* #1958 *})({elseif $c_member.is_c_commu_sub_admin && $c_commu.c_member_id_sub_admin != $u })
({* #1958 *})<a href="({t_url m=pc a=page_c_sub_admin_delete})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">副管理者から降格</a>
({* #1958 *})({else})
({* #1958 *})&nbsp;
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:80px;" class="bg_02 padding_s">
({* #1958 *})
({* #1958 *})({if !($c_member.is_c_commu_admin && !$c_member.is_c_commu_sub_admin)
 &&   $c_member.c_commu_admin_confirm_id <= 0
 &&   $c_member.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
({* #1958 *})<a href="({t_url m=pc a=page_c_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$c_member.c_member_id})">管理権を渡す</a>
({* #1958 *})({else})
({* #1958 *})&nbsp;
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:644px;height:1px;" class="bg_01" colspan="11"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})({/foreach})
({* #1958 *})</table>
({* #1958 *})
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})<td style="width:642px;" class="bg_02" align="right" valign="middle">
({* #1958 *})
({* #1958 *})<div class="padding_s">
({* #1958 *})
({* #1958 *})({if $is_prev})
({* #1958 *})<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* #1958 *})({/if})
({* #1958 *})({if $is_next})
({* #1958 *})&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$requests.target_c_commu_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:644px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1958 *})</tr>
({* #1958 *})</table>
({* #1958 *})
({* #1958 *})({/if})({*<<メンバー一覧：if*})
({* #1958 *})
({* #1958 *})<!-- ここまで：主内容 -->
({* #1958 *})({*ここまで：body*})
({* #1958 *})({*ここから：footer*})
({* #1958 *})<!-- 無し -->
({* #1958 *})({*ここまで：footer*})
({* #1958 *})</td>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})</tr>
({* #1958 *})<tr>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy" /></td>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1958 *})</tr>
({* #1958 *})</table>
({* #1958 *})<!-- ******ここまで：メッセージテーブル管理メンバー一覧****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
