({if $posted_todo})
<!-- ここから：主内容＞Todo投稿履歴 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">Todo投稿履歴</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$posted_todo item=item})
({strip})
<img src="./skin/dummy.gif" style="width:14px;height:14px;" class="icon icon_3">
({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})&amp;target_id=({$item.c_member_id})">({$item.memo})</a>
({/strip})
 （({if $item.c_member_id == 0})共有Todo({else})({$item.member_name})({/if})）<br>
({/foreach})

<!-- ここから：主内容＞Todo投稿履歴＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" class="icon arrow_1">
<a href="({t_url m=biz a=page_h_biz_todo_posted_list})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞Todo投稿履歴＞フッターメニュー -->

</td>
</tr>
<!-- ここまで：主内容＞Todo投稿履歴 -->
({/if})
