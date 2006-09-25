({$inc_html_header|smarty:nodefaults})
<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container main_content" align="center">
<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

({ext_include file="inc_alert_box.tpl"})({* エラーメッセージコンテナ *})

({if !$err_msg})

<!-- ******************************** -->
<!-- ******ここから：トピック表示****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:646px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
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
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_03" align="center" valign="middle" rowspan="5">

<div class="padding_s">

({$c_topic.r_datetime|date_format:"%Y年%m月%d日"})<br>({$c_topic.r_datetime|date_format:"%H:%M"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:531px;height:30px;" class="bg_05" align="left" valign="middle">
<div class="padding_s">

&nbsp;({$c_topic.name})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:531px;height:30px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})">({$c_topic.nickname})</a>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:533px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:531px;height:50px;" class="bg_02" align="left" valign="middle">
<div class="padding_s lh_120">
({if $c_topic.image_filename1||$c_topic.image_filename2||$c_topic.image_filename3})
({if $c_topic.image_filename1})<a href="({t_img_url filename=$c_topic.image_filename1})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename1 w=120 h=120})"></a>({/if})
({if $c_topic.image_filename2})<a href="({t_img_url filename=$c_topic.image_filename2})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename2 w=120 h=120})"></a>({/if})
({if $c_topic.image_filename3})<a href="({t_img_url filename=$c_topic.image_filename3})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename3 w=120 h=120})"></a>({/if})
<br>
({/if})
({$c_topic.body|nl2br|t_http2cmd|t_url2a|t_cmd})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：トピック表示＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：トピック表示****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({if $c_topic_write })

<!-- ******************************** -->
<!-- ******ここから：書き込み一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
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
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $all})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">最新を表示</a>
({else})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;all=1">すべて表示</a>
({/if})
({if $is_next})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
 ({$start_num})番～({$end_num})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞表示件数切り替え -->
<!-- ここから：主内容＞＞書き込み内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({foreach from=$c_topic_write item=item})
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle" rowspan="3">

<div class="padding_s">

({$item.r_datetime|date_format:"%Y年%m月%d日"})<br>
({$item.r_datetime|date_format:"%H:%M"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:523px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<span class="b_b">({$item.number})</span>:&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>&nbsp;
({if $c_member_id == $item.c_member_id || $c_member_id == $c_commu.c_member_id_admin})
<a href="({t_url m=pc a=page_c_topic_write_delete_confirm})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})">削除</a><br>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:525px;" class="bg_01" align="center" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s lh_120">

({if $item.image_filename1||$item.image_filename2||$item.image_filename3})
({if $item.image_filename1})<a href="({t_img_url filename=$item.image_filename1})" target="_blank"><img src="({t_img_url filename=$item.image_filename1 w=120 h=120})"></a>({/if})
({if $item.image_filename2})<a href="({t_img_url filename=$item.image_filename2})" target="_blank"><img src="({t_img_url filename=$item.image_filename2 w=120 h=120})"></a>({/if})
({if $item.image_filename3})<a href="({t_img_url filename=$item.image_filename3})" target="_blank"><img src="({t_img_url filename=$item.image_filename3 w=120 h=120})"></a>({/if})
<br>
({/if})
({$item.body|nl2br|t_http2cmd|t_url2a|t_cmd})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞書き込み内容 -->
<!-- ここから：主内容＞＞表示件数切り替え -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $all})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">最新を表示</a>
({else})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;all=1">すべて表示</a>
({/if})
({if $is_next})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=1&amp;page=({$page})">＜前</a> ({/if})
({if $is_prev})<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;direc=-1&amp;page=({$page})">次＞</a> ({/if})
({$start_num})番～({$end_num})番を表示

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******ここまで：書き込み一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({/if})
({/if})

({if $is_c_commu_member})

<!-- ********************************** -->
<!-- ******ここから：新しく書き込む****** -->
({t_form _enctype=file m=pc a=page_c_topic_write_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
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
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

本　　文

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<textarea name="body" rows="10" cols="50" style="width: 415px">({$body})</textarea>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 1

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename1" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 2

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename2" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:110px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

写　真 3

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:521px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="file" name="image_filename3" size="40">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:632px;" class="bg_05" align="center" valign="middle">

<div style="text-align:left;padding:10px 90px;">

<div style="text-align:center;">
<input type="submit" value="　確認画面　">
</div>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで：決定欄 -->
({*ここまで：footer*})
<!-- *ここまで：新しく書き込む＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>

</form>
<!-- ******ここまで：新しく書き込む****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({/if})

<!-- **************************************** -->
<!-- ******ここから：コミュニティトップへ****** -->
<div class="content_footer" id="link_community_top" align="center">

<img src="./skin/dummy.gif" class="icon arrow_1">&nbsp;
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>

</div>
<!-- ******ここまで：コミュニティトップへ****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
</td>
</tr>
</table>({*END:container*})
</td>
</tr>
<tr>
<td class="container inc_page_footer">
({$inc_page_footer|smarty:nodefaults})
</td>
</tr>
</table>
({ext_include file="inc_extension_pagelayout_bottom.tpl"})
</body>
</html>
