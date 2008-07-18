({ext_include file="inc_header.tpl"})
({ext_include file="inc_c_com_topic_find.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if !$err_msg})

<!-- ******************************** -->
<!-- ******ここから：トピック表示****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:646px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：トピック表示＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">[({$c_commu.name})] トピック</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_03" align="center" valign="middle" rowspan="({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})9({else})7({/if})">

<div class="padding_s">

({$c_topic.r_datetime|date_format:"%Y年%m月%d日"})<br>({$c_topic.r_datetime|date_format:"%H:%M"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:531px;height:30px;" class="bg_05" align="left" valign="middle">
<div class="padding_s">

&nbsp;({$c_topic.name})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:531px;height:30px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})">({$c_topic.nickname})</a>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:531px;height:50px;" class="bg_02" align="left" valign="middle">

({if $c_topic.image_filename1||$c_topic.image_filename2||$c_topic.image_filename3})
<div class="padding_s">
({if $c_topic.image_filename1})<span class="padding_s"><a href="({t_img_url filename=$c_topic.image_filename1})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename1 w=120 h=120})"></a></span>({/if})
({if $c_topic.image_filename2})<span class="padding_s"><a href="({t_img_url filename=$c_topic.image_filename2})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename2 w=120 h=120})"></a></span>({/if})
({if $c_topic.image_filename3})<span class="padding_s"><a href="({t_img_url filename=$c_topic.image_filename3})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename3 w=120 h=120})"></a></span>({/if})
</div>
({/if})

<div class="padding_s lh_120">
({$c_topic.body|nl2br|t_url2cmd:'community'|t_cmd:'community'})
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:531px;height:50px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">
<a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})">
({$c_topic.original_filename})
</a>
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})

<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
({if $is_c_topic_admin || $is_c_commu_admin})
({if ($c_commu.topic_authority == 'public')||($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
<!-- ここから：トピック編集 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_05" align="center" valign="middle">

<div style="text-align:left;padding:10px 90px;">

<div style="text-align:center;">
({t_form _method=get m=pc a=page_c_topic_edit})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<input type="submit"  class="submit" value="編 集">
</form>
</div>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
({*********})
<!-- ここまで：トピック編集 -->
({/if})
({/if})

({*ここまで：footer*})
<!-- *ここまで：トピック表示＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：トピック表示****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $c_topic_write })

<!-- ******************************** -->
<!-- ******ここから：書き込み一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：書き込み一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">書き込み</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞表示件数切り替え -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $all})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">最新を表示</a>
({else})
({if $total_num > $page_size})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;all=1">すべて表示</a>　({/if})
({/if})
({if $is_next})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
 ({$start_num})番～({$end_num})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞表示件数切り替え -->
<!-- ここから：主内容＞＞書き込み内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({foreach from=$c_topic_write item=item})
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle" rowspan="3">

<div class="padding_s">

({$item.r_datetime|date_format:"%Y年%m月%d日"})<br>
({$item.r_datetime|date_format:"%H:%M"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:523px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<span class="b_b">({$item.number})</span>:&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>&nbsp;
({if $c_member_id == $item.c_member_id || $c_member_id == $c_commu.c_member_id_admin || $c_member_id == $c_commu.c_member_id_sub_admin})
<a href="({t_url m=pc a=page_c_topic_write_delete_confirm})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})">削除</a><br>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:525px;" class="bg_01" align="center" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle" style="width:523px;">

({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
<div class="padding_s">
({if $item.image_filename1})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename1})" target="_blank"><img src="({t_img_url filename=$item.image_filename1 w=120 h=120})"></a></span>({/if})
({if $item.image_filename2})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename2})" target="_blank"><img src="({t_img_url filename=$item.image_filename2 w=120 h=120})"></a></span>({/if})
({if $item.image_filename3})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename3})" target="_blank"><img src="({t_img_url filename=$item.image_filename3 w=120 h=120})"></a></span>({/if})
</div>
({/if})

<div class="padding_s lh_120">
({$item.body|nl2br|t_url2cmd:'community'|t_cmd:'community'})
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞書き込み内容 -->
<!-- ここから：主内容＞＞表示件数切り替え -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $all})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">最新を表示</a>
({else})
({if $total_num > $page_size})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;all=1">すべて表示</a>　({/if})
({/if})
({if $is_next})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
({$start_num})番～({$end_num})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞表示件数切り替え -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：書き込み一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：書き込み一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({/if})
({/if})

({if $is_c_commu_member})
<a name="write"></a>
<!-- ********************************** -->
<!-- ******ここから：新しく書き込む****** -->
({t_form _enctype=file m=pc a=page_c_topic_write_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：新しく書き込む＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">新しく書き込む</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

本　　文

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<textarea class="text" name="body" rows="10" cols="50" style="width: 510px">({$body})</textarea>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 1

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename1" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 2

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename2" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 3

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename3" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：決定欄 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_05" align="center" valign="middle">

<div style="text-align:left;padding:10px 90px;">

<div style="text-align:center;">
<input type="submit" class="submit" value="　確認画面　">
</div>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：決定欄 -->
({*ここまで：footer*})
<!-- *ここまで：新しく書き込む＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：新しく書き込む****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({/if})

<!-- **************************************** -->
<!-- ******ここから：コミュニティトップへ****** -->
<div class="content_footer" id="link_community_top" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>

</div>
<!-- ******ここまで：コミュニティトップへ****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
