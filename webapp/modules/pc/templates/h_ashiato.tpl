({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $c_ashiato_list})

<!-- ************************************ -->
<!-- ******ここから：最近の足あと一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：最近の足あと一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">あしあと</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：あしあと文章 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;" class="bg_03" align="left">
<div style="padding:10px 30px;" class="lh_120">

({$c_member.nickname})さんのページを訪れた人たちです。最新30件までを表示、同一人物・同一日付のアクセスは最新の日時だけが表示されます。

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:564px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：あしあと文章 -->
<!-- ここから：主内容 -->
<div style="width:564px;" class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:500px;">
<tr>
<td style="width:500px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:143px;" class="bg_02" align="center" valign="middle"><img src="./skin/dummy.gif" alt="dummy" style="width:143px;height:1px;" class="dummy"></td>
<td style="width:350px;" class="bg_02" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

ページ全体のアクセス数：<span class="b_b">({$c_ashiato_num})</span> アクセス<br>
<br>

({foreach from=$c_ashiato_list item=c_ashiato})

({$c_ashiato.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_ashiato.c_member_id_from})">({$c_ashiato.nickname|default:"&nbsp;"})</a><br>
({/foreach})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:500px;height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：最近の足あと一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：最近の足あと一覧****** -->
<!-- ************************************ -->

({else})

<div align="center" style="width:580px;padding:20px 30px;" class="bg_02 border_01">

<div class="padding_w_s">

まだあしあとはありません。

</div>

</div>

({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
