({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="トピック削除の確認"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>トピック削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

({foreach from=$topic_list item=topic})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$topic.c_commu_topic_id})
</td>
</tr>
({****})
<tr>
<th>トピック名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$topic.c_commu_topic_id})" target="_blank">({$topic.name})</a> (({$topic.count_comments}))
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$topic.c_commu_id})" target="_blank">({$topic.commu_name})</a>
</td>
</tr>
({****})
<tr>
<th>トピック作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$topic.c_member_id})" target="_blank">({$topic.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$topic.r_datetime})
</td>
</tr>
({****})
({if $topic.event_flag})
<tr>
<th>開催日時</th>
<td>
({$topic.open_date})&nbsp;({$topic.open_date_comment})
</td>
</tr>
({****})
<tr>
<th>開催場所</th>
<td>
({$pref[$topic.open_pref_id]})({$topic.open_pref_comment})
</td>
</tr>
({****})
({/if})
<tr>
<th>トピック本文</th>
<td width="500">
({if $topic.image_filename1 || $topic.image_filename2 || $topic.image_filename3})
<div>
({if $topic.image_filename1})<span class="padding_s"><a href="({t_img_url filename=$topic.image_filename1})" target="_blank"><img src="({t_img_url filename=$topic.image_filename1 w=120 h=120})"></a></span>({/if})
({if $topic.image_filename2})<span class="padding_s"><a href="({t_img_url filename=$topic.image_filename2})" target="_blank"><img src="({t_img_url filename=$topic.image_filename2 w=120 h=120})"></a></span>({/if})
({if $topic.image_filename3})<span class="padding_s"><a href="({t_img_url filename=$topic.image_filename3})" target="_blank"><img src="({t_img_url filename=$topic.image_filename3 w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$topic.body|nl2br|t_url2cmd:'community':$topic.c_member_id|t_cmd:'community'})
({else})
({$topic.body|nl2br})
({/if})
</td>
</tr>
({****})
({if $topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>ファイル</th>
<td class="textbody">
<a href="./?m=({$module_name})&amp;a=do_({$hash_tbl->hash('file_download','do')})&amp;filename=({$topic.filename})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">
({$topic.original_filename})
</a>
</td>
</tr>
({/if})
({****})
({if $topic.event_flag})
<tr>
<th>募集期限</th>
<td>
({if $topic.invite_period != "0000-00-00"})({$topic.invite_period})({else})指定なし({/if})
</td>
</tr>
({****})
<tr>
<th>募集人数</th>
<td>
({if $topic.capacity})({$topic.capacity})人({else})無制限({/if})
</td>
</tr>
({****})
<tr>
<th>参加者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$topic.c_commu_topic_id})" target="_blank">({$topic.member_num})人</td>
</td>
</tr>
({****})
({/if})
</tbody>
</table>
({/foreach})

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu_topic_selected','do')})" />
<input type="hidden" name="target_c_commu_topic_ids" value="({$target_c_commu_topic_ids})" />
<span class="textBtnS"><input type="submit" value="すべて削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
