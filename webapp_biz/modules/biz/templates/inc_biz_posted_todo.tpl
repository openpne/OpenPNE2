({* #1945 *})({if $posted_todo})
({* #1945 *})<tr><th>Todo投稿履歴</th><td>
({* #1945 *})<dl class="articleList">
({* #1945 *})({foreach from=$posted_todo item=item})
({* #1945 *})<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})">({$item.memo})</a> (({if $item.c_member_id == 0})共有Todo({else})({$item.member_name})({/if}))</dd>
({* #1945 *})({/foreach})
({* #1945 *})</dl>
({* #1945 *})<div class="moreInfo"><ul class="moreInfo">
({* #1945 *})<li><a href="({t_url m=biz a=page_h_biz_todo_posted_list})">もっと読む</a></li>
({* #1945 *})</ul></div>
({* #1945 *})</td></tr>
({* #1945 *})({/if})
