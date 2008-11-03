({$inc_ktai_header|smarty:nodefaults})
<table width="100%">
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})要請中</font><br>
</td></tr></table>
({if !$anataga_c_commu_member_confirm_list})
({$WORD_COMMUNITY_HALF})要請中ありません。
({else})
<center>
({$pager.start})～({$pager.end})件目を表示<br>
</center>
<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$anataga_c_commu_member_confirm_list item=anataga_c_commu_member_confirm name=anataga_c_commu_member_confirm_list_name})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$anataga_c_commu_member_confirm.c_member_id_admin})&amp;({$tail})">({$anataga_c_commu_member_confirm.nickname})</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})名：</font><br>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$anataga_c_commu_member_confirm.c_commu_id})&amp;({$tail})">({$anataga_c_commu_member_confirm.c_commu_name})</a><br>
<br>
({if $anataga_c_commu_member_confirm.message})
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
({$anataga_c_commu_member_confirm.message|nl2br})<br>
({/if})
<center>
[<a href="({t_url m=ktai a=do_h_confirm_list_delete_c_commu_member_confirm})&amp;target_c_commu_member_confirm_id=({$anataga_c_commu_member_confirm.c_commu_member_confirm_id})&amp;({$tail})">依頼削除</a>]<br><br>
</center>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
({/if})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_confirm_list6})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_confirm_list6})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
<hr color="#({$ktai_color_config.border_01})">

({$inc_ktai_footer|smarty:nodefaults})
