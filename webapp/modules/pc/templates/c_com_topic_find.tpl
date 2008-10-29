({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})
({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：トピック検索****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：トピック検索＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({if $c_commu_id})[({$c_commu.name})] ({/if})トピック検索</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:562px;margin:0px auto;">
({*********})
<tr>
<td style="width:562px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:560px;" class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<!-- ここから：主内容＞＞検索 -->

({t_form _method=get m=pc a=page_c_com_topic_find})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

キーワード<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

<input type="text" class="text" name="keyword" size="15" value="({$keyword})">
({if $c_commu_id})
<select name="target_commu">
<option value="in_commu">コミュニティ内</option>
<option value="all">コミュニティ全体</option>
</select>
<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
({/if})
<input type="submit" class="submit" value=" 検 索 ">
<br>

絞りこみ<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">すべて</a>
|
<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">トピック</a>
|
<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">イベント</a>

</form>

<!-- ここまで：主内容＞＞検索 -->

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

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：トピック検索＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：トピック検索****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：トピック一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：トピック一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="c_00"><span class="b_b">({if $c_commu_id})[({$c_commu.name})] ({/if})トピック一覧</span>&nbsp;&nbsp;***&nbsp;

({if $total_num})
    ({$total_num})
({else})
    0
({/if})

件&nbsp;が該当しました。</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $c_commu_topic_search_list})
({if $total_num})
<!-- ここから：主内容＞＞トピック一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})
<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">前を表示</a>&nbsp;&nbsp;
({/if})
({if $total_num})
({$start_num})件～({$end_num})件を表示
({/if})
({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">次を表示</a>
({/if})

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
<!-- ここまで：主内容＞＞トピック一覧件数表示タブ -->
({/if})
<!-- ここから：主内容＞＞トピック一覧本体 -->
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞トピック一覧本体＞＞のループ部分 -->
({foreach from=$c_commu_topic_search_list item=c_topic_search})
<div class="border_01 bg_09" style="width:562px;margin:0px auto;" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">

トピック名

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:461px;" class="bg_02" align="left" valign="middle" colspan="3">

<div class="padding_s">

({$c_topic_search.name}) (({$c_topic_search.max_number}))

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

本文

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle" colspan="3">

<div class="padding_s">

({$c_topic_search.body|t_truncate:36:"":3})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

コミュニティ名

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle" colspan="3">

<div class="padding_s">

({$c_topic_search.commu_name})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

投稿日

</div>

</td>
<td class="bg_01" align="center" rowspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:249px;" class="bg_02" align="left">
<div class="padding_s">

({$c_topic_search.max_datetime|date_format:"%m月%d日 %H:%M"})

</div>
</td>
<td class="bg_01" align="center" rowspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="center" valign="middle" rowspan="3">

<table border="0" cellspacing="0" cellpadding="0" style="width:212px;">
<tr>
<td style="width:271px;" class="bg_03" align="center">

<div class="padding_s">

<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic_search.c_commu_topic_id})"><img src="({t_img_url_skin filename=button_shosai})" class="icon"></a>

</div>

</td>
</tr>
</table>

</td>
<td class="bg_01" align="center" rowspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/foreach})
<!-- ここまで：主内容＞＞トピック一覧本体＞＞のループ部分 -->

</div>
<!-- ここまで：＞＞トピック一覧本体 -->
({if $total_num})
<!-- ここから：主内容＞＞トピック一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})
<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;direc=-1&amp;page=({$page})&amp;type=({$search_val_list.type})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">前を表示</a>&nbsp;&nbsp;
({/if})
({if $total_num})
({$start_num})件～({$end_num})件を表示
({/if})
({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;direc=1&amp;page=({$page})&amp;type=({$search_val_list.type})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">次を表示</a>
({/if})

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
<!-- ここまで：主内容＞＞トピック一覧件数表示タブ -->
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：トピック一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：トピック一覧****** -->
<!-- ************************************ -->
({else})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</table>

({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
