({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="日記コメント削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>日記コメント削除</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

この日記コメントを削除します。削除後に復元させることはできないので注意してください。

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_diary_comment')})" />
<input type="hidden" name="target_c_diary_comment_id" value="({$diary_comment.c_diary_comment_id})" />
<span class="textBtnS"><input type="submit" value="削除" /></span>
</form>

<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$diary_comment.c_diary_comment_id})
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary_comment.c_diary_id})" target="_blank">({$diary_comment.subject})</a> (コメント({$diary_comment.count_comments})件)
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$diary_comment.c_member_id})" target="_blank">({$diary_comment.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$diary_comment.r_datetime})
</td>
</tr>
({****})
<tr>
<th width="150">日記コメント本文</th>
<td width="500">
({$diary_comment.body|nl2br})
</td>
</tr>
({****})
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
