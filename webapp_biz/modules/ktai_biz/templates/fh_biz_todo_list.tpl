({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">Todoﾘｽﾄ</a></font><br>
</td></tr></table>
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})"></td></tr>
({foreach from=$todolist item=todo})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$todo.memo})<br>
[<a href="({t_url m=ktai_biz a=do_fh_biz_todo_check})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;target_c_member_id=({$target_c_member_id})&amp;is_checked=({$is_checked})&amp;({$tail})">({if $is_checked})未完了に戻す({else})完了する({/if})</a>]
[<a href="({t_url m=ktai_biz a=page_fh_biz_todo_edit})&amp;target_c_member_id=({$target_c_member_id})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;({$tail})">編集</a>]
[<a href="({t_url m=ktai_biz a=do_fh_biz_todo_delete})&amp;target_c_member_id=({$target_c_member_id})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;({$tail})">削除</a>]<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
[i:76]<a href="({t_url m=ktai_biz a=page_fh_biz_todo_add})&amp;target_c_member_id=({$target_c_member_id})&amp;({$tail})">Todoを追加</a><br>
({if $is_checked})
[i:69]<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;target_c_member_id=({$target_c_member_id})&amp;({$tail})">未完了Todoを見る</a><br>
({else})
[i:69]<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;target_c_member_id=({$target_c_member_id})&amp;is_checked=1&amp;({$tail})">完了済みTodoを見る</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})