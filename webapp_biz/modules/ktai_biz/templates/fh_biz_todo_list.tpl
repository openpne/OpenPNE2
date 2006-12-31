({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">Todoリスト</font></center>
<hr>
({foreach from=$todolist item=todo})
<a href="({t_url m=ktai_biz a=do_fh_biz_todo_check})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;is_checked=({$is_checked})&amp;({$tail})">
({if $is_checked})×({else})□({/if})
</a>
({$todo.memo})
<a href="({t_url m=ktai_biz a=page_fh_biz_todo_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;({$tail})">編集</a>
<a href="({t_url m=ktai_biz a=do_fh_biz_todo_delete})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;target_biz_todo_id=({$todo.biz_todo_id})&amp;({$tail})">削除</a><br>
({/foreach})
<hr>
<a href="({t_url m=ktai_biz a=page_fh_biz_todo_add})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">Todoを追加</a><br>
({if $is_checked})
<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">未完了Todoを見る</a>
({else})
<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;is_checked=1&amp;({$tail})">完了済みTodoを見る</a>
({/if})
<hr>
({$inc_ktai_footer|smarty:nodefaults})