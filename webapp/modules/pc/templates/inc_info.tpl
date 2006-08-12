<!--　インフォメーション　＆　カレンダー　-->
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;" class="info">
<tr>
<td style="width:5px;"><img src="./skin/dummy.gif" style="width:5px;height:1px;" class="dummy"></td>
<td style="width:715px;" align="center" valign="middle">

<!--ここから：運営者からのお知らせ-->
<table border="0" cellspacing="0" cellpadding="0" style="width:715px;" class="info_body">
<tr>
<td align="center" class="border_07 bg_11" style="width:105px;border-right:none;"><img src="({t_img_url_skin filename=icon_information})" alt="お知らせ"></td>
<td class="border_07 bg_02" style="width:610px;">

<table border="0" cellspacing="0" cellpadding="0" style="width:610px;">
<tr>
<td class="padding_s">

({$site_info|smarty:nodefaults|default:"&nbsp;"})

</td>
</tr>
({if $num_f_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">承認待ちのメンバーが({$num_f_confirm_list})名います！</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
({if $num_message_not_is_read})
<tr>
<td class="padding_s">

★<span class="caution">新着メッセージが({$num_message_not_is_read})件あります！</span>&nbsp;<a href="({t_url m=pc a=page_h_message_box})"><span class="b_b">メッセージを読む</span></a>

</td>
</tr>
({/if})
({if $num_diary_not_is_read})
<tr>
<td class="padding_s">

★<span class="caution">({$num_diary_not_is_read})件の日記に対して新着コメントがあります！</span>&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})"><span class="caution">日記を見る</span></a>

</td>
</tr>
({/if})
({if $num_h_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">コミュニティ参加承認待ちのメンバーが({$num_h_confirm_list})名います！</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">コミュニティ管理人交代依頼が({$num_anatani_c_commu_admin_confirm_list})件きています。</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
</table>

</td>
</tr>
</table>
<!--ここまで：運営者からのお知らせ-->

</td>
</tr>
</table>