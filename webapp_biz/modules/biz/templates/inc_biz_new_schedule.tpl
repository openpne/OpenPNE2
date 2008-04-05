({if $newlist})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />

<!-- ********************************** -->
<!-- ******ここから：new schedule一覧****** -->

<table border="0" cellspacing="0" cellpadding="0" style="width:240px;">
<tr>
<td style="width:10px;"><img src="./skin/dummy.gif" alt="dummy" style="width:10px;height:10px;display:block;" /></td>
<td style="width:230px;" align="left">

({*ここから：header*})
<table border="0" cellspacing="0" cellpadding="0" style="width:228px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy" /></td>
<td style="width:205px;" class="bg_06"><span class="b_b c_00">未読スケジュール</span></td>
</tr>
</table>
({*ここまで：header*})
({*ここから：body*})
<table border="0" cellspacing="0" cellpadding="0" style="width:228px">
({****})
({foreach key=i item=value from=$newlist})
<tr>
<td class="bg_02 border_01 padding_ss" style="width:60px;border-right:none;border-top:none;">({$value.begin_date|date_format:"%m月%d日"})</td>
<td class="bg_02 border_01 padding_ss" style="width:168px;border-top:none;"><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$value.biz_schedule_id})&amp;target_id=({$target_id})">({$value.title})</a></td>
</tr>
({****})
({/foreach})
</table>
({*ここまで：body*})
</td>
</tr>
</table>

<!-- ******ここまで：new schedule一覧****** -->
<!-- ********************************** -->

({/if})
