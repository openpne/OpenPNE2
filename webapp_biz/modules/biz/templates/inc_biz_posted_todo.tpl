({if $posted_todo})
<tr><th>Todo投稿履歴</th><td>
<dl class="articleList">
({foreach from=$posted_todo item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})">({$item.memo})</a> (({if $item.c_member_id == 0})共有Todo({else})({$item.member_name})({/if}))</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=biz a=page_h_biz_todo_posted_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
