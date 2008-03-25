({$inc_ktai_header|smarty:nodefaults})

<center>日記ｺﾒﾝﾄ記入履歴</center>
<hr>

({if !$c_diary_my_comment_list})
日記ｺﾒﾝﾄ記入履歴はありません。
({else})
({foreach from=$c_diary_my_comment_list item=each_diary})
({$each_diary.r_datetime|date_format:"%m/%d"})(({$each_diary.nickname|t_truncate:17:""}))<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$each_diary.c_diary_id})&amp;({$tail})">({$each_diary.subject})</a>(({$each_diary.num_comment}))
<br>
({/foreach})

<br>
({strip})
({if $is_prev})<a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a>&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>({/if})
({/strip})
({/if})
<hr>

({$inc_ktai_footer|smarty:nodefaults})
