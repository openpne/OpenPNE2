({$inc_header|smarty:nodefaults})

<h2>書き込み管理</h2>
({if $msg})
<p class="caution">({$msg})</p>
({/if})

<p>IDは半角数字で入力してください。</p>

({* 日記 *})
<h3>日記</h3>
<div class="caution">
URL例：(ＸＸＸがID)<br>
({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=ＸＸＸ<br>
</div>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})">
ID：<input type="text" name="target_c_diary_id" value="({$requests.target_c_diary_id})" size="6">
<input type="submit" class="submit" value="確認">
</p>
</form>

({if $c_diary})
<table>
<tr>
<th>タイトル</th>
<td>({$c_diary.subject})</td>
</tr>
<tr>
<th>本文</th>
<td style="width:360px">({$c_diary.body|t_url2a|nl2br})</td>
</tr>
<tr>
<th>URL</th>
<td><a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary.c_diary_id})" target="_blank">URL</a></td>
</tr>
<form action="./" method="post">
<tr>
<th><input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_diary','do')})">
<input type="hidden" name="target_c_diary_id" value="({$c_diary.c_diary_id})">
&nbsp;</th>
<td><input type="submit" class="submit" value="削除する"></td>
</tr>
</form>
</table>
({/if})

<hr>

({* 日記コメント *})
<h3>日記コメント</h3>
<div class="caution">
日記コメントで表示しているIDを入力してください<br>
</div>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})">
ID：<input type="text" name="target_c_diary_comment_id" value="({$requests.target_c_diary_comment_id})" size="6">
<input type="submit" class="submit" value="確認">
</p>
</form>

({if $c_diary_comment})
<table>
<tr>
<th>本文</th>
<td style="width:360px">({$c_diary_comment.body|t_url2a|nl2br})</td>
</tr>
<tr>
<th>URL</th>
<td><a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_comment.c_diary_id})" target="_blank">URL</a></td>
</tr>
<form action="./" method="post">
<tr>
<th><input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_diary_comment','do')})">
<input type="hidden" name="target_c_diary_comment_id" value="({$c_diary_comment.c_diary_id})">
&nbsp;</th>
<td><input type="submit" class="submit" value="削除する"></td>
</tr>
</form>
</table>
({/if})

<hr>

({* コミュニティ *})
<h3>コミュニティ</h3>
<div class="caution">
URL例：(ＸＸＸがID)<br>
({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=ＸＸＸ<br>
</div>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})">
ID：<input type="text" name="target_c_commu_id" value="({$requests.target_c_commu_id})" size="6">
<input type="submit" class="submit" value="確認">
</p>
</form>

({if $c_commu})
<table>
<tr>
<th>コミュニティ名</th>
<td style="width:360px">({$c_commu.name})</td>
</tr>
<tr>
<th>説明</th>
<td>({$c_commu.info|t_url2a|nl2br})</td>
</tr>
<tr>
<th>URL</th>
<td><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})" target="_blank">URL</a></td>
</tr>
<form action="./" method="post">
<tr>
<th><input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu','do')})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
&nbsp;</th>
<td><input type="submit" class="submit" value="削除する"></td>
</tr>
</form>
</table>
({/if})

<hr>

({* コミュニティトピック *})
<h3>コミュニティトピック・イベント</h3>
<div class="caution">
URL例：(ＸＸＸがID)<br>
({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=ＸＸＸ<br>
({t_url _absolute=1 m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=ＸＸＸ
</div>
<form action="./" method="post">
<p>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})">
ID：<input type="text" name="target_c_commu_topic_id" value="({$requests.target_c_commu_topic_id})" size="6">
<input type="submit" class="submit" value="確認">
</p>
</form>

({if $c_commu_topic})
<table>
<tr>
<th>トピック(イベント)名</th>
<td style="width:360px">({$c_commu_topic.name})</td>
</tr>
<tr>
<th>本文</th>
<td>({$c_commu_topic.body|t_url2a|nl2br})</td>
</tr>
<tr>
<th>URL</th>
<td><a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})" target="_blank">URL</a></td>
</tr>
<form action="./" method="post">
<tr>
<th><input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu_topic','do')})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic.c_commu_topic_id})">
&nbsp;</th>
<td><input type="submit" class="submit" value="削除する"></td>
</tr>
</form>
</table>
({/if})
<hr>
({* トピックコメント *})
<h3>トピックコメント</h3>
<div class="caution">
トピックコメントで表示しているIDを入力してください<br>
</div>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})">
ID：<input type="text" name="target_c_commu_topic_comment_id" value="({$requests.target_c_commu_topic_comment_id})" size="6">
<input type="submit" class="submit" value="確認">
</p>
</form>

({if $c_commu_topic_comment})
<table>
<tr>
<th>本文</th>
<td style="width:360px">({$c_commu_topic_comment.body|t_url2a|nl2br})</td>
</tr>
<tr>
<th>URL</th>
<td><a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_comment.c_commu_topic_id})" target="_blank">URL</a></td>
</tr>
<form action="./" method="post">
<tr>
<th><input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu_topic_comment','do')})">
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})">
&nbsp;</th>
<td><input type="submit" class="submit" value="削除する"></td>
</tr>
</form>
</table>
({/if})
<br><br>

({$inc_footer|smarty:nodefaults})
