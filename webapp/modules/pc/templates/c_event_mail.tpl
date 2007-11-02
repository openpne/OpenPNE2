({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- **************************************** -->
<!-- ******ここから：メッセージ送信先一覧****** -->
({t_form m=pc a=page_c_event_mail_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:240px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">一括メッセージを送る</span></td>
<td style="width:388px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $c_event_member_list})
<table border="0" cellspacing="1" cellpadding="3" style="width:574px;">
<tr>
<td class="bg_05" align="center">

<span class="c_01">名　　前</span>

</td>
<td  class="bg_02">

<table border="0" cellspacing="1" cellpadding="0">
({foreach from=$c_event_member_list item=c_member})
<tr>
<td>

<input type="checkbox" name="c_member_id[]" value="({$c_member.c_member_id})" checked="checked" class="no_bg">

</td>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a></td>
</tr>
({/foreach})
</table>
</td></tr>

<tr>
<td class="bg_05" align="center">

<span class="c_01">メッセージ</span>

</td>
<td  class="bg_02">

<textarea class="text" name="body" cols="40" rows="8"></textarea>

</td>
</tr>
<tr>
<td align="center" class="bg_02" colspan="2">

<br>
<input type="submit" class="submit" value="　確認画面　">
<br><br>

</td>
</tr>
</table>
({else})
<table border="0" cellspacing="1" cellpadding="3" style="width:574px;">
<tr>
<td class="bg_05" align="center">

<div class="padding_w_m">
送信するメンバーがいません。
</div>

</td>
</tr>
</table>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</form>
</table>
<!-- ******ここまで：メッセージ送信先一覧****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


<!-- **************************************** -->
<!-- ******ここから：コミュニティトップへ****** -->
<div class="content_footer" id="link_community_top" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})">イベントページへ戻る</a>

</div>
<!-- ******ここまで：コミュニティトップへ****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
