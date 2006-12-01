({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$target_c_member.nickname}) さんの日記リスト</font></center>
<hr>
({if $INC_NAVI_type=="h"})
<a href="#search" accesskey="1">1.検索</a>
<br>
({/if})
({capture name="pager"})
<br>
({if $is_prev || $is_next})
({if $is_prev})<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})({if $keyword})&amp;keyword=({$keyword})({/if})&amp;({$tail})">次へ</a>({/if})
({if $pager})
<br>
({$total_num})件中 
({$pager.start})件～({$pager.end})件を表示<br>
<br>
({/if})
({/if})
({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_diary_list item=target_diary})
({$target_diary.r_date|date_format:"%y/%m/%d"})-<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;({$tail})">({$target_diary.subject})</a>(({$target_diary.num_comment}))<br>
({/foreach})
({$smarty.capture.pager|smarty:nodefaults})

({if $INC_NAVI_type=="h"})
<a name="search"></a>
({t_form _method=get m=ktai a=page_fh_diary_list})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="keyword" value="({$keyword})">
<input type="submit" value="検索">
</form>
({/if})
<hr>
({if $INC_NAVI_type=="h"})
<a href="({t_url m=ktai a=page_h_diary_edit})&amp;({$tail})">日記を書く</a><br>
({/if})
({if $INC_NAVI_type=="f"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})