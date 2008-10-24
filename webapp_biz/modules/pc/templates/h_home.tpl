({ext_include file="inc_header.tpl"})
({if $smarty.const.DISPLAY_SEARCH_HOME})
<tr>
<td class="container inc_search_box">
({**************************************})
({**ここから：旧inc_search_box.tplの内容**})
({**************************************})
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
<tr>
<td style="width:720px;height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:720px;height:2px;" class="dummy"></td>
</tr>
<tr>
<td align="center">

({*ここから：本体*})
<div class="color_19" style="width:680px;height:24px;border-left:none 0px;border-right:none 0px;border-top:none 0px;">
({t_form m=pc a=do_h_home_search})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table border="0" cellspacing="0" cellpadding="0" class="search_bar" style="width:680px;height:24px;">
<tr>
<td align="center" style="height:24px;">
<img src="({t_img_url_skin filename=icon_search})" alt="search" style="width:62px;height:20px;" class="icon">
<input type="text" size="30" name="q" class="text border_01" value="" style="width:180px;">
<input type="image" src="({t_img_url_skin filename=button_search_1})" value="diary" alt="日記" name="diary" class="button" style="width:62px;height:20px;border:none;">
<input type="image" src="({t_img_url_skin filename=button_search_2})" value="community" alt="コミュニティ" name="community" class="button" style="width:62px;height:20px;border:none;">
<input type="image" src="({t_img_url_skin filename=button_search_4})" value="message" alt="メッセージ" name="message" class="button" style="width:62px;height:20px;border:none;">
<input type="image" src="({t_img_url_skin filename=button_search_5})" value="group" alt="グループ" name="group" class="button" style="width:62px;height:20px;border:none;">

({if $smarty.const.USE_EXTRA_SERVICE})
<input type="image" src="({t_img_url_skin filename=button_search_3})" value="web" alt="web" name="web" class="button" style="width:62px;height:20px;border:none;">
({/if})
</td>
</tr>
</table>

</form>
</div>
({*ここまで：本体*})

</td>
</tr>
</table>
({**************************************})
({**ここまで：旧inc_search_box.tplの内容**})
({**************************************})
</td>
</tr>
({/if})
({if $birthday_flag})
<tr>
<td class="container" align="center">

<div class="padding_s">

<img src="({t_img_url_skin filename=birthday_h})">

</div>

</td>
</tr>
({/if})
<tr>
<td class="container inc_info">

({********************************})
({**ここから：旧inc_info.tplの内容**})
({********************************})
<!--　インフォメーション　＆　カレンダー　-->
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;" class="info">
<tr>
<td style="width:5px;"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
<td style="width:715px;" align="center" valign="middle">

<!--ここから：運営者からのお知らせ-->
<table border="0" cellspacing="0" cellpadding="0" style="width:715px;" class="info_body">
<tr>
<td align="center" class="border_07 bg_11" style="width:105px;border-right:none;"><img src="({t_img_url_skin filename=icon_information})" alt="お知らせ"></td>
<td class="border_07 bg_02" style="width:610px;">

<table border="0" cellspacing="0" cellpadding="0" style="width:610px;">
<tr>
<td class="padding_s">

({$site_info|smarty:nodefaults|default:"&nbsp;"|t_url2cmd:'info'|t_cmd:'info'})

</td>
</tr>
({if $num_f_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">承認待ちのメンバーが({$num_f_confirm_list})名います！</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
({if $num_message_not_is_read})
<tr>
<td class="padding_s">

★<span class="caution">新着メッセージが({$num_message_not_is_read})件あります！</span>&nbsp;<a href="({t_url m=pc a=page_h_message_box})"><span class="b_b">メッセージを読む</span></a>

</td>
</tr>
({/if})
({if $num_diary_not_is_read})
<tr>
<td class="padding_s">

★<span class="caution">({$num_diary_not_is_read})件の日記に対して新着コメントがあります！</span>&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})"><span class="caution">日記を見る</span></a>

</td>
</tr>
({/if})
({if $num_h_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">コミュニティ参加承認待ちのメンバーが({$num_h_confirm_list})名います！</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">コミュニティ管理者交代依頼が({$num_anatani_c_commu_admin_confirm_list})件きています。</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})
({if $anatani_c_commu_sub_admin_confirm_list})
<tr>
<td class="padding_s">

★<span class="caution">コミュニティ副管理者依頼が({$num_anatani_c_commu_sub_admin_confirm_list})件きています。</span>&nbsp;<a href="({t_url m=pc a=page_h_confirm_list})"><span class="b_b">承認・拒否</span></a>

</td>
</tr>
({/if})</table>

</td>
</tr>
</table>
<!--ここまで：運営者からのお知らせ-->

</td>
</tr>
</table>
({********************************})
({**ここまで：旧inc_info.tplの内容**})
({********************************})

</td>
</tr>
({if $inc_entry_point[3]})
<tr>
<td class="container">
({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
</td>
</tr>
({/if})

<!-- ******************************** -->
<!-- ******ここから：bizモジュール::スケジュール****** -->
({if $calendar_biz})
<tr>
<td class="container">
({$calendar_biz|smarty:nodefaults})
</td>
</tr>
({/if})
<!-- ******ここまで：bizモジュール::スケジュール****** -->
<!-- ******************************** -->

({ext_include file="inc_layoutcolumn_top_270px.tpl"})

({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

({if $inc_entry_point[4]})
({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({capture name=mydata})
<!-- **************************************** -->
<!-- ******ここから：自分の写真及びニックネーム覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:270px;margin:0px auto;" class="border_07" id="main_image_and_name">
<tr>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:254px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="dummy" style="width:254px;height:7px;" class="dummy"></td>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center" class="bg_02">
<!-- *ここから：自分の写真及びニックネーム覧＞＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：写真 -->
<div class="border_07 bg_02" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:252px;">
<tr>
<td align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<img src="({t_img_url filename=$c_member.image_filename w=180 h=180 noimg=no_image})" class="pict" alt="写真" style="margin:2px">

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<a href="({t_url m=pc a=page_h_config_image})">
<img src="({t_img_url_skin filename=button_edit_photo})"></a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>
</tr>
<tr>
<td>
<a href="({t_url m=pc a=page_h_prof})">
<img src="({t_img_url_skin filename=button_prof_conf})"></a>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>
</tr>
</table>

</td>
</tr>
</table>

</div>
<!-- ここまで：写真 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：自分のニックネーム -->
<table border="0" cellspacing="0" cellpadding="0" style="width:254px;">
<tr>
<td align="center" class="bg_05 c_04">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({$c_member.nickname})さん (({$c_friend_count}))
</td>
</tr>
</table>
<!-- ここまで：自分のニックネーム -->
({*ここから：footer*})
<!-- *ここまで：自分の写真及びニックネーム覧＞＞内容* -->
</td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：自分の写真及びニックネーム覧****** -->
<!-- **************************************** -->
({/capture})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[5]})
({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({if $c_friend_list})
<!-- ********************************** -->
<!-- ******ここから：マイフレンドリスト****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：マイフレンドリスト＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">({$WORD_MY_FRIEND})リスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
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

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px">
<tr>
<td style="width:1px;" class="bg_07" rowspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
<td style="width:1px;" class="bg_07" rowspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:125px;" class="bg_02" rowspan="2"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_fh_friend_list})">全てを見る(({$c_friend_count})人)</a>
</td>
<td style="width:5px;" class="bg_02" rowspan="2"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
</tr>
<tr>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_h_manage_friend})">({$WORD_MY_FRIEND})管理</a>
</td>
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
<!-- *ここまで：マイフレンドリスト＞＞内容* -->
</td>
</tr>
</table>
<!-- ******ここまで：マイフレンドリスト****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if})

({if $inc_entry_point[6]})
({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- ********************************** -->
<!-- ******ここから：bizモジュール::グループ****** -->
({if $group_list })
({$group_list|smarty:nodefaults})
({/if})
<!-- ******ここまで：bizモジュール::グループ****** -->
<!-- ********************************** -->

<!-- ************************************ -->
<!-- ******ここから：コミュニティ一覧****** -->
({if $c_commu_user_list})
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
<!-- ここから：主内容 -->
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
<table border="0" cellspacing="0" cellpadding="0" style="width:266px;" class="bg_07">
<tr>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
<td class="bg_03" align="center">

({capture assign=flashvars})({strip})
({foreach from=$c_commu_user_list item=item key=key})
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

({if $c_commu_user_list[0]})
({*１行目img*})
<tr>

({t_loop from=$c_commu_user_list start=0 num=3})
({if $item})
<td style="width:88px;" class="bg_03" align="center">
({if $item.c_member_id_admin == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" class="pict"></a>
</td>
({else})
<td style="width:88px;" class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({*１行目name*})
<tr>

({t_loop from=$c_commu_user_list start=0 num=3})
({if $item})
<td class="bg_02" align="center">
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

({if $c_commu_user_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$c_commu_user_list start=3 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id_admin == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
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

({t_loop from=$c_commu_user_list start=3 num=3})
({if $item})
<td class="bg_02" align="center">
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

({if $c_commu_user_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$c_commu_user_list start=6 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id_admin == $c_member.c_member_id })<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
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

({t_loop from=$c_commu_user_list start=6 num=3})
({if $item})
<td class="bg_02" align="center">
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

<!-- ここまで：主内容 -->
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
<a href="({t_url m=pc a=page_fh_com_list})">全てを見る(({$fh_com_count_user}))</a>
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
<!-- *ここまで：コミュニティ一覧＞＞内容* -->
</td>
</tr>
</table>
({/if})
<!-- ******ここまで：コミュニティ一覧****** -->
<!-- ************************************ -->

({if $bookmark_member_list})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<!-- **************************************** -->
<!-- ******ここから：お気に入りメンバー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：お気に入りメンバー一覧＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">お気に入りリスト</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
<table border="0" cellspacing="0" cellpadding="0" style="width:266px;" class="bg_07">
<tr>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
<td class="bg_03" align="center">

({capture assign=flashvars})({strip})
({foreach from=$bookmark_member_list item=item key=key})
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

({if $bookmark_member_list[0]})
({*１行目img*})
<tr>

({t_loop from=$bookmark_member_list start=0 num=3})
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

({t_loop from=$bookmark_member_list start=0 num=3})
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

({if $bookmark_member_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$bookmark_member_list start=3 num=3})
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

({t_loop from=$bookmark_member_list start=3 num=3})
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

({if $bookmark_member_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$bookmark_member_list start=6 num=3})
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

({t_loop from=$bookmark_member_list start=6 num=3})
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

<!-- ここまで：主内容 -->
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
<a href="({t_url m=pc a=page_h_bookmark_list})">全てを見る(({$bookmark_count}))</a>
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
<!-- *ここまで：お気に入りメンバー一覧＞＞内容* -->
</td>
</tr>
</table>

<!-- ******ここまで：お気に入りメンバー一覧****** -->
<!-- **************************************** -->
({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[7]})
({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_270px.tpl"})
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

({if $inc_entry_point[8]})
({$inc_entry_point[8]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({if $calendar})
<!-- ***************************** -->
<!-- ******ここから：週間予定****** -->
({t_form m=pc a=do_h_home_insert_c_schedule})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="w" value="({$w})">

<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" style="width:424px;">
<!-- ここから：主内容＞＞カレンダー -->
({if $msg})
<div class="border_01 bg_02">

<div class="padding_s" align="left">
<span class="caution">({$msg})</span>
</div>

</div>
({/if})
<div class="border_01 bg_02 padding_s" align="left">

予定 <input type="text" class="text" name="title" value="" size="24">
<select name="start_date">
({foreach from=$calendar item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="submit" value="追加">

&nbsp;
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w-1})" title="前の週">＜</a>
<a href="({t_url m=pc a=page_h_home})" title="今週">■</a>
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w+1})" title="次の週">＞</a>

</div>
<table border="0" cellspacing="0" cellpadding="0" style="width:424px;">
<tr>
({foreach from=$calendar item=item name=calendar})
<td style="width:({if $smarty.foreach.calendar.last})64({else})60({/if})px;({if !$smarty.foreach.calendar.last})border-right:none;({/if})" align="left" valign="top" class="border_01 bg_0({if $item.now})9({else})2({/if})({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({/if}) padding_s">
({if $item.now})<span class="b_b">({/if})

({if $smarty.foreach.calendar.first || $item.day == 1})
({$item.month})/({/if})

({$item.day})<br>
(({$item.dayofweek}))<br>

({if $item.now})</span>({/if})

<div>
({* 祝日 *})
({foreach from=$item.holiday item=item_holiday})
({$item_holiday})<br>
({/foreach})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<img src="({t_img_url_skin filename=icon_birthday})" class="icon"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a><br>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
<img src="({t_img_url_skin filename=icon_pen})" class="icon"><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a><br>
({/foreach})
</div>

</td>
({/foreach})
</tr>
</table>

<div style="text-align:right;padding-right:20px;" class="border_01 bg_02 padding_s">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_calendar})">月別カレンダー</a>

</div>

<!-- ここまで：主内容＞＞カレンダー -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：週間予定****** -->
<!-- ***************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({/if})

({if $inc_entry_point[9]})
({$inc_entry_point[9]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- ******************************** -->
<!-- ******ここから：最新情報一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：最新情報一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:100px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">最新情報</span></td>
<td style="width:286px;" align="right" class="bg_06">&nbsp;</td>
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
<!-- ここから：主内容＞フレンド最新日記 -->
({if $c_diary_friend_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">({$WORD_MY_FRIEND})<br>最新日記</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_diary_friend_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|default:"&nbsp;"}) (({$item.count_comments|default:0}))</a>
(({$item.nickname|default:"&nbsp;"}))
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞フレンド最新日記＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_diary_list_friend})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞フレンド最新日記＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞フレンド最新日記 -->
<!-- ここから：主内容＞マイフレンド最新Blog -->
({if $c_rss_cache_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">({$WORD_MY_FRIEND})<br>最新Blog</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_rss_cache_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"})</a>
(({$item.c_member.nickname|default:"&nbsp;"}))<br>
({/foreach})

<!-- ここから：主内容＞マイフレンド最新Blog＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_diary_list_friend})#blog">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞マイフレンド最新Blog＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞マイフレンド最新Blog -->

<!-- ここから：主内容＞日記へのコメント -->
({if $c_diary_my_comment_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">日記コメント<br>記入履歴</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_diary_my_comment_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_3">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">({$item.subject}) (({$item.num_comment}))</a>
(({$item.nickname}))<br>
({/foreach})

<!-- ここから：主内容＞日記へのコメント＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_diary_comment_list})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞日記へのコメント＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞日記へのコメント -->

<!-- ********************************** -->
<!-- ******ここから：bizモジュール::Todo****** -->
({if $posted_list })
({$posted_list|smarty:nodefaults})
({/if})
<!-- ******ここまで：bizモジュール::Todo****** -->
<!-- ********************************** -->

<!-- ここから：主内容＞コミュニティ最新書き込み -->
({if $c_commu_topic_comment_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ<br>最新書き込み</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_commu_topic_comment_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.number})">({$item.c_commu_topic_name}) (({$item.number}))</a>
(({$item.c_commu_name}))
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞コミュニティ最新書き込み＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_com_comment_list})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞コミュニティ最新書き込み＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞コミュニティ最新書き込み -->
<!-- ここから：主内容＞マイフレンド最新レビュー -->
({if $c_friend_review_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">({$WORD_MY_FRIEND})<br>最新レビュー</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_friend_review_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a>
(({$item.nickname}))<br>
({/foreach})

<!-- ここから：主内容＞マイフレンド最新レビュー＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_friend_review_list})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞マイフレンド最新レビュー＞フッターメニュー -->
</td>
</tr>
({/if})
<!-- ここまで：主内容＞マイフレンド最新レビュー -->

<!-- ここから：主内容＞お気に入りの最新日記 -->
({if $bookmark_diary_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">お気に入り<br>最新日記</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$bookmark_diary_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|default:"&nbsp;"}) (({$item.count_comments}))</a>
(({$item.nickname}))
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞お気に入りの最新日記＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞お気に入りの最新日記＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞お気に入りの最新日記 -->

<!-- ここから：主内容＞お気に入りの最新Blog -->
({if $bookmark_blog_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">お気に入り<br>最新Blog</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$bookmark_blog_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"})</a>
(({$item.nickname}))<br>
({/foreach})

<!-- ここから：主内容＞お気に入りの最新Blog＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})#blog">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞お気に入りの最新Blog＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞お気に入りの最新Blog -->

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
<!-- *ここまで：自己情報一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：最新情報一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[10]})
({$inc_entry_point[10]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- ******************************** -->
<!-- ******ここから：自己情報一覧****** -->
({if $c_diary_list || $c_blog_list || $c_review_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：自己情報一覧＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:386px;padding:2px 0px;" class="bg_06"><b class="c_00">最新日記・レビュー</b></td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<!-- ここから：主内容＞最新日記 -->
({if $c_diary_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新日記</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_diary_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.comment_count})">({$item.subject|t_truncate:40}) (({$item.comment_count}))</a>
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞最新日記＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_diary_list})">もっと読む</a>

</td>
</tr>
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_diary_add})">日記を書く</a>

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
({if $c_blog_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新Blog</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_blog_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({$item.link})" target="_blank">({$item.subject|t_truncate:40})</a><br>
({/foreach})

<!-- ここから：主内容＞最新Blog＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_diary_list})#blog">もっと読む</a>

</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞最新Blog＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞最新最新Blog -->


<!-- ここから：主内容＞最新レビュー -->
({if $c_review_list})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">最新レビュー</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$c_review_list item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_3">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a><br>
({/foreach})

<!-- ここから：主内容＞最新レビュー＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_review_list_member})">もっと読む</a>

</td>
</tr>
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_review_add})">レビューを書く</a>

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
<!-- *ここまで：自己情報一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：自己情報一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if})

({if $inc_entry_point[11]})
({$inc_entry_point[11]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({if $c_friend_intro_list})
<!-- ******************************** -->
<!-- ******ここから：他者評価一覧****** -->
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
<td style="width:386px;" class="bg_06"><span class="b_b">({$WORD_MY_FRIEND})からの紹介文</span></td>
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
({foreach from=$c_friend_intro_list item=item})
<tr>
<td style="width:124px;border-right:none;" class="bg_03 border_01 padding_l" align="center">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" border="0"><br>({$item.nickname})</a>

</td>
<td style="width:298px;" class="bg_02 border_01 padding_l">

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
<td style="width:290px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:290px;height:1px;" class="dummy"></td>
<td style="width:130px;" class="bg_02 lh_140 padding_s">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_intro})">全て見る</a>
<br>
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_manage_friend})">紹介文を書く</a>
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
<!-- ******ここまで：他者評価一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if})

({if $inc_entry_point[12]})
({$inc_entry_point[12]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
