({if $posted_todo})
<tr class="postedTodoHistory"><th>Todo投稿履歴</th><td>
<ul class="articleList">
({foreach from=$posted_todo item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})&amp;target_id=({$item.c_member_id})">({$item.memo})</a> (({if $item.c_member_id == 0})共有Todo({else})({$item.member_name})({/if}))</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=biz a=page_h_biz_todo_posted_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
