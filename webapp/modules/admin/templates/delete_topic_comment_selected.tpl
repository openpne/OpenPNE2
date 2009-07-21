({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="トピックコメント削除の確認"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>トピックコメント削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

({foreach from=$topic_comment_list item=topic_comment})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$topic_comment.c_commu_topic_comment_id})
</td>
</tr>
({****})
<tr>
<th>トピック名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$topic_comment.c_commu_topic_id})" target="_blank">({$topic_comment.topic_name})</a> (({$topic_comment.count_comments}))
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$topic_comment.c_commu_id})" target="_blank">({$topic_comment.commu_name})</a>
</td>
</tr>
({****})
<tr>
<th>投稿者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$topic_comment.c_member_id})" target="_blank">({$topic_comment.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$topic_comment.r_datetime})
</td>
</tr>
({****})
<tr>
<th>トピックコメント本文</th>
<td width="500">
({if $topic_comment.image_filename1 || $topic_comment.image_filename2 || $topic_comment.image_filename3})
<div>
({if $topic_comment.image_filename1})<span class="padding_s"><a href="({t_img_url filename=$topic_comment.image_filename1})" target="_blank"><img src="({t_img_url filename=$topic_comment.image_filename1 w=120 h=120})"></a></span>({/if})
({if $topic_comment.image_filename2})<span class="padding_s"><a href="({t_img_url filename=$topic_comment.image_filename2})" target="_blank"><img src="({t_img_url filename=$topic_comment.image_filename2 w=120 h=120})"></a></span>({/if})
({if $topic_comment.image_filename3})<span class="padding_s"><a href="({t_img_url filename=$topic_comment.image_filename3})" target="_blank"><img src="({t_img_url filename=$topic_comment.image_filename3 w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$topic_comment.body|nl2br|t_url2cmd:'community':$topic_comment.c_member_id|t_cmd:'community'})
({else})
({$topic_comment.body|nl2br})
({/if})
</td>
</tr>
({****})
({if $topic_comment.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>ファイル</th>
<td class="textbody">
<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('file_download','do')})&amp;filename=({$topic_comment.filename})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">
({$topic_comment.original_filename})
</a>
</td>
</tr>
({/if})
({****})
</tbody>
</table>
({/foreach})

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu_topic_comment_selected','do')})" />
<input type="hidden" name="target_c_commu_topic_comment_ids" value="({$target_c_commu_topic_comment_ids})" />
<span class="textBtnS"><input type="submit" value="すべて削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
