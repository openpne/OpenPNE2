({ext_include file="inc_header.tpl"})
({if $is_h_prof})({* -------- 自分のプロフィール確認時:ここから -------- *})

<tr>
<td class="container" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：プロフィール確認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:680px;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:666px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:666px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：主内容* -->

<table class="container" border="0" cellspacing="0" cellpadding="0" style="width:666px;">
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:664px;" class="bg_02">

<div class="padding_l">

<span class="c_01">
※他のメンバーから見たあなたのページはこのようになります。<br>
<br>
他のメンバーにあなたのページを教える場合には、以下のURLを使ってください。<br>
({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member_id})<br>
<br>
プロフィールを変更する場合は 「<a href="({t_url m=pc a=page_h_config_prof})">プロフィール変更</a>」 よりおこなえます。</span>

</div>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>

<!-- *ここまで：主内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
</table>
<!-- ******ここまで：プロフィール確認****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</td>
</tr>

({* -------- 自分のプロフィール確認時:ここまで -------- *})

({else})({* -------- 他メンバーのプロフィール:ここから -------- *})


({if $days_birthday == 0})({* 誕生日当日 *})
<!-- ********************************** -->
<!-- ******ここから：お誕生日にメッセージを贈りましょう****** -->
<tr>
<td class="container" align="center">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})">
<img src="({t_img_url_skin filename=birthday_f})"></a>

</div>

</td>
</tr>
<!-- ******ここまで：お誕生日にメッセージを贈りましょう****** -->
<!-- ********************************** -->

({elseif $days_birthday > 0 && $days_birthday <= 3})({* 誕生日3日以内 *})
<!-- ********************************** -->
<!-- ******ここから：もうすぐ誕生日****** -->
<tr>
<td class="container" align="center">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})">
<img src="({t_img_url_skin filename=birthday_f_2})"></a>

</div>

</td>
</tr>
<!-- ******ここまで：もうすぐ誕生日****** -->
<!-- ********************************** -->
({/if})

({if !$is_friend})
<tr>
<td class="container f_link_request_box" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<!-- ********************************** -->
<!-- ******ここから：マイフレンドリストに追加****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:680px;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:666px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:666px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：主内容* -->

<table class="container" border="0" cellspacing="0" cellpadding="0" style="width:666px;">
<tr>
<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:460px;" class="bg_09 padding_s">
<span class="c_01">&nbsp;・&nbsp;({$target_c_member.nickname})さんと直接の知り合いの場合、({$WORD_MY_FRIEND})に追加しましょう！</span>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:20px;padding-left:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td style="width:183px;" class="bg_02">
<a href="({t_url m=pc a=do_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;sessid=({$PHPSESSID})">({$WORD_MY_FRIEND})に追加</a>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>

<!-- *ここまで：主内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:666px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
</table>
<!-- ******ここまで：マイフレンドリストに追加****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
</tr>
({/if})
({if $is_friend && $my_friend_intro==''})
<tr>
<td class="container" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<!-- ********************************** -->
<!-- ******ここから：紹介文のススメ****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:680px;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:666px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：主内容* -->

<table class="container" border="0" cellspacing="0" cellpadding="0" style="width:666px;">
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:460px;" class="bg_09 padding_s">

<span class="c_01">&nbsp;・&nbsp;({$target_c_member.nickname})さんをみんなに紹介しましょう！</span>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:203px;" class="bg_02 padding_s">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"><a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})">紹介文を書く</a>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>

<!-- *ここまで：主内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
</table>
<!-- ******ここまで：紹介文のススメ****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</td>
</tr>
({/if})

({/if})({* -------- 他メンバーのプロフィール:ここまで -------- *})

({ext_include file="inc_layoutcolumn_top_270px.tpl"})

({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

({if $inc_entry_point[3]})
({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) 
({/if})

<!-- **************************************** -->
<!-- ******ここから：メンバーの写真及びニックネーム覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:270px;margin:0px auto;" class="border_07" id="main_image_and_name">
<tr>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:254px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="dummy" style="width:254px;height:7px;" class="dummy"></td>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center" class="bg_02">
<!-- *ここから：メンバーの写真及びニックネーム覧＞＞内容* -->
({*ここから：header*})
({if !$is_h_prof})
<!-- ここから：メンバーとの関係 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:254px;">
<tr>
<td align="center" class="bg_05">
({if ($is_friend || $friend_path)})
({$c_member.nickname})
({if $friend_path}) ⇒ <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$friend_path.c_member_id})">({$friend_path.nickname})</a>({/if})
⇒ <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})">({$target_c_member.nickname})</a>
({else})
&nbsp;
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>
</tr>
</table>
<!-- ここまで：メンバーとの関係 -->
({/if})
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：写真 -->
<div class="border_07 bg_02" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:252px;">
<tr>
<td align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<img src="({t_img_url filename=$target_c_member.image_filename w=180 h=180 noimg=no_image})" class="pict">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $target_c_member.image_filename})
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({if $is_h_prof})
<a href="({t_url m=pc a=page_h_config_image})">
<img src="({t_img_url_skin filename=button_edit_photo})"></a>
({else})
<a href="({t_url m=pc a=page_f_show_image})&amp;target_c_member_id=({$target_c_member.c_member_id})">
<img src="({t_img_url_skin filename=button_show_photo})"></a>
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>
</tr>
</table>
({/if})

</td>
</tr>
</table>

</div>
<!-- ここまで：写真 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：メンバーのニックネーム -->
<table border="0" cellspacing="0" cellpadding="0" style="width:254px;">
<tr>
<td align="center" class="bg_05 c_04">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({$target_c_member.nickname})さん(({$c_friend_count}))<br>
(最終ログインは({$target_c_member.last_login}))<br>
</td>
</tr>
</table>
<!-- ここまで：メンバーのニックネーム -->
({*ここから：footer*})
<!-- *ここまで：メンバーの写真及びニックネーム覧＞＞内容* -->
</td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メンバーの写真及びニックネーム覧****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[4]})
({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- ********************************** -->
<!-- ******ここから：フレンドリスト****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：フレンドリスト＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">({$WORD_FRIEND})リスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：サムネイルとニックネーム -->
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
<table border="0" cellspacing="0" cellpadding="0" style="width:266px;" class="bg_07">
<tr>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
<td class="bg_03" align="center">

({capture assign=flashvars})({strip})
({foreach from=$c_friend_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>

</td>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
</tr>
</table>
({else})
<table border="0" cellspacing="1" cellpadding="2" style="width:268px" class="bg_07">

({if $c_friend_list[0]})
({*１行目img*})
<tr>

({t_loop from=$c_friend_list start=0 num=3})
({if $item})
<td style="width:88px;" class="bg_03" align="center">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>

</td>
({else})
<td style="width:88px;" class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({*１行目name*})
<tr>

({t_loop from=$c_friend_list start=0 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_friend_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$c_friend_list start=3 num=3})
({if $item})
<td class="bg_03" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ２行目name -->
<tr>

({t_loop from=$c_friend_list start=3 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_friend_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$c_friend_list start=6 num=3})
({if $item})
<td class="bg_03" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ３行目name -->
<tr>

({t_loop from=$c_friend_list start=6 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

</table>
({/if})

<!-- ここまで：サムネイルとニックネーム -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px">
<tr>
<td style="width:1px;" class="bg_07" rowspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
<td style="width:1px;" class="bg_07" rowspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member_id})">全てを見る(({$c_friend_count})人)</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
</tr>
<tr>
<td style="width:268px;" class="bg_07" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
<!-- *ここまで：フレンドリスト＞＞内容* -->
</td>
</tr>
</table>
<!-- ******ここまで：フレンドリスト****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[5]})
({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) 
({/if})

<!-- ************************************ -->
<!-- ******ここから：コミュニティ一覧****** -->
({if $c_commu_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：コミュニティ一覧＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">コミュニティリスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：サムネイルとニックネーム -->
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
<table border="0" cellspacing="0" cellpadding="0" style="width:266px;" class="bg_07">
<tr>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
<td class="bg_03" align="center">

({capture assign=flashvars})({strip})
({foreach from=$c_commu_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_commu_id})
&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_c_home _urlencode=true _html=false})%26target_c_commu_id=({$item.c_commu_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.count_commu_members})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>

</td>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
</tr>
</table>
({else})
<table border="0" cellspacing="1" cellpadding="2" style="width:268px" class="bg_07">

({if $c_commu_list[0]})
<!-- １行目img -->
<tr>

({t_loop from=$c_commu_list start=0 num=3})
({if $item})
<td style="width:88px;" class="bg_03" align="center">
({if $item.c_member_id_admin == $target_c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if}) 
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" class="pict"></a>
</td>
({else})
<td style="width:88px;" class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- １行目name -->
<tr>

({t_loop from=$c_commu_list start=0 num=3})
({if $item})
<td class="bg_02" align="center" style="width:88px;">
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
({$item.name}) (({$item.count_commu_members}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_commu_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$c_commu_list start=3 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id_admin == $target_c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ２行目name -->
<tr>

({t_loop from=$c_commu_list start=3 num=3})
({if $item})
<td class="bg_02" align="center" style="width:88px;">
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
({$item.name}) (({$item.count_commu_members}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_commu_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$c_commu_list start=6 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id_admin == $target_c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" class="pict"></a>
</td>
({else})
<td class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- ３行目name -->
<tr>

({t_loop from=$c_commu_list start=6 num=3})
({if $item})
<td class="bg_02" align="center" style="width:88px;">
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
({$item.name}) (({$item.count_commu_members}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})

({/t_loop})

</tr>

({/if})

</table>
({/if})

<!-- ここまで：サムネイルとニックネーム -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px">
<tr>
<td style="width:1px;" class="bg_07" rowspan="({if $common_commu_count})4({else})3({/if})"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
<td style="width:1px;" class="bg_07" rowspan="({if $common_commu_count})4({else})3({/if})"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member_id})">全てを見る(({$user_count}))</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
</tr>
({if $common_commu_count})
<tr>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member_id})">共通コミュニティ(({$common_commu_count}))</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
</tr>
({/if})
<tr>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
</tr>
<tr>
<td style="width:268px;" class="bg_07" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
<!-- *ここまで：コミュニティ一覧＞＞内容* -->
</td>
</tr>
</table>
({/if})
<!-- ******ここまで：コミュニティ一覧****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[6]})
({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) 
({/if})

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_270px.tpl"})
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

({if $inc_entry_point[7]})
({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) 
({/if})

<!-- ************************************ -->
<!-- ******ここから：プロフィール一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：プロフィール一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:100px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">プロフィール</span></td>
<td style="width:286px;" align="right" class="bg_06">({if $is_h_prof})<a href="({t_url m=pc a=page_h_config_prof})">プロフィール変更</a>&nbsp;&nbsp;({else})&nbsp;({/if})</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
({capture name="nick"})
<!-- ここから：主内容＞ニックネーム -->
({if $target_c_member.nickname})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">ニックネーム</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$target_c_member.nickname})

</td>
</tr>
({/if})
<!-- ここまで：主内容＞ニックネーム -->
({/capture})
({capture name="birth"})
<!-- ここから：主内容＞年齢 -->
({if $target_c_member.age !== NULL && ($target_c_member.public_flag_birth_year == 'public' || ($target_c_member.public_flag_birth_year == 'friend' && ($is_friend || $is_h_prof)))})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">年&nbsp;齢</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$target_c_member.age})歳

({if $is_h_prof && $target_c_member.public_flag_birth_year == 'friend'})<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>({/if})

</td>
</tr>
({/if})
<!-- ここまで：主内容＞年齢 -->
<!-- ここから：主内容＞誕生日 -->
({if $target_c_member.birth_month && $target_c_member.birth_day})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">誕生日</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$target_c_member.birth_month})月({$target_c_member.birth_day})日

</td>
</tr>
({/if})
<!-- ここまで：主内容＞誕生日 -->
({/capture})
({foreach from=$target_c_member.profile key=key item=item})
({if $item.public_flag != "private" && ($item.public_flag == "public" || ($item.public_flag == "friend" && ($is_friend || $is_h_prof)))})
({strip})

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
<!-- ここから：主内容＞({$item.caption}) -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">({$item.caption})</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({if $item.form_type == 'textarea'})
    ({$item.value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({elseif $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({else})
    ({$item.value})
({/if})

({if $is_h_prof && $item.public_flag == 'friend'})
<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>
({/if})

</td>
</tr>
({/if})
<!-- ここまで：主内容＞({$item.caption}) -->
({/foreach})

({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})

<!-- ここから：主内容＞最新日記 -->
({if $c_diary_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新日記</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_diary_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_date|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})">({$item.subject|default:"&nbsp;"}) (({$item.comment_count}))</a>
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})

({if $is_h_prof && $item.public_flag == "friend"})
<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>
({/if})

<br>
({/foreach})

<!-- ここから：主内容＞最新日記＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞最新日記＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞最新日記 -->
<!-- ここから：主内容＞最新Blog -->
({if $c_rss_cache_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新Blog</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_rss_cache_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"})</a><br>
({/foreach})

<!-- ここから：主内容＞最新Blog＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})#blog">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞最新Blog＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞最新Blog -->
<!-- ここから：主内容＞最新レビュー -->
({if $c_review_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新レビュー</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_review_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:40})</a><br>
({/foreach})

<!-- ここから：主内容＞最新レビュー＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$target_c_member_id})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞最新レビュー＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞最新レビュー -->
</table>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="height:1px;" class="dummy"></td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：プロフィール一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：プロフィール一覧****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[8]})
({$inc_entry_point[8]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) 
({/if})

<!-- ******************************** -->
<!-- ******ここから：他者評価一覧****** -->
({if $c_friend_comment_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：他者評価一覧＞＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:386px;" class="bg_06"><span class="b_b c_00">({$WORD_FRIEND})からの紹介文</span></td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- 主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
({foreach from=$c_friend_comment_list item=item})
<tr>
<td style="width:124px;border-right:none;" class="bg_03 border_01 padding_l" align="center">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"><br>({$item.nickname})</a>

</td>
<td style="width:268px;" class="bg_02 border_01 padding_l">

({$item.intro|t_truncate:36:"":3})

</td>
</tr>
({/foreach})
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- 小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:321px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="dummy"></td>
<td style="width:99px;padding:5px 0px;" class="bg_02 lh_140">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_intro})&amp;target_c_member_id=({$target_c_member_id})">全て見る</a>
</td>
<td style="width:1px;" class="bg_04"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;height:1px;" class="bg_04" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
({*ここまで：footer*})
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- *ここまで：他者評価一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
({/if})
<!-- ******ここまで：他者評価一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[9]})
({$inc_entry_point[9]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
