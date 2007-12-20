({ext_include file="inc_header.tpl"})
({ext_include file="inc_c_com_topic_find.tpl"})
({if !$is_c_commu_member})
<tr>
<td class="container inc_c_join_commu_box" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<!-- ******************************************* -->
<!-- ******ここから：このコミュニティに参加****** -->
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
<td style="width:300px;" class="bg_09 padding_s">
<span class="c_01">&nbsp;・このコミュニティに参加しますか？</span>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:20px;padding-left:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td style="width:343px;" class="bg_02">
<a href="({t_url m=pc a=page_c_join_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})">({$c_commu.name})に参加する</a>
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
<!-- ******ここまで：このコミュニティに参加****** -->
<!-- ******************************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
</tr>
({/if})
({ext_include file="inc_layoutcolumn_top_270px.tpl"})

({********************************})
({**ここから：メインコンテンツ（左）**})
({********************************})

({if $inc_entry_point[3]})
({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- *********************************************** -->
<!-- ******ここから：コミュニティの写真及び名前覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:270px;margin:0px auto;" class="border_07" id="main_image_and_name">
<tr>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:254px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="dummy" style="width:254px;height:7px;" class="dummy"></td>
<td style="width:7px;height:7px;" class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center" class="bg_01">
<!-- *ここから：コミュニティの写真及び名前覧＞＞内容* -->
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

<img src="({t_img_url filename=$c_commu.image_filename w=180 h=180 noimg=no_logo})" class="pict">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

</td>
</tr>
</table>

</div>
<!-- ここまで：写真 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：自分の名前 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:254px;">
<tr>
<td align="center" class="bg_05 c_04">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({$c_commu.name})
</td>
</tr>
</table>
<!-- ここまで：コミュニティの名前 -->
({*ここから：footer*})
<!-- *ここまで：コミュニティの写真及び名前覧＞＞内容* -->
</td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティの写真及び名前覧****** -->
<!-- *********************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[4]})
({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- ******************************** -->
<!-- ******ここから：メンバー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px;margin:0px auto;" class="border_07">
<tr>
<td>
<!-- *ここから：メンバー一覧＞＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px" class="border_07">
<tr>
<td style="width:25px;" class="bg_06"><img src="({t_img_url_skin filename=icon_title_1})" style="width:25px;height:19px;" class="dummy"></td>
<td style="width:241px;" class="bg_06"><span class="b_b c_00">コミュニティメンバー</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：サムネイルと名前 -->
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
<table border="0" cellspacing="0" cellpadding="0" style="width:266px;" class="bg_07">
<tr>
<td class="bg_07"><img src="./skin/dummy.gif" alt="dummy" style="width:1px;"></td>
<td class="bg_03" align="center">

({capture assign=flashvars})({strip})
({foreach from=$c_commu_member_list item=item key=key})
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

({if $c_commu_member_list[0]})
<!-- １行目img -->
<tr>

({t_loop from=$c_commu_member_list start=0 num=3})
({if $item})
<td style="width:88px;" class="bg_03" align="center">
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"></a>
</td>
({else})
<td style="width:88px;" class="bg_03"><img src="./skin/dummy.gif" alt="dummy" style="width:84px;height:84px;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

<!-- １行目name -->
<tr>

({t_loop from=$c_commu_member_list start=0 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count|default:"0"}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_commu_member_list[3]})
<!-- ２行目img -->
<tr>

({t_loop from=$c_commu_member_list start=3 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
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

({t_loop from=$c_commu_member_list start=3 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count|default:"0"}))
</a>
</td>
({else})
<td class="bg_02" align="center"><img src="./skin/dummy.gif" alt="dummy" style="height:1em;" class="dummy"></td>
({/if})
({/t_loop})

</tr>

({/if})

({*************************************************************})

({if $c_commu_member_list[6]})
<!-- ３行目img -->
<tr>

({t_loop from=$c_commu_member_list start=6 num=3})
({if $item})
<td class="bg_03" align="center">
({if $item.c_member_id == $c_commu.c_member_id_admin})<img src="({t_img_url_skin filename=icon_crown})" class="icon"><br>({/if})
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

({t_loop from=$c_commu_member_list start=6 num=3})
({if $item})
<td class="bg_02" align="center">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({$item.nickname}) (({$item.friend_count|default:"0"}))
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

<!-- ここまで：サムネイルと名前 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:268px">
<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">全てを見る(({$c_commu.member_count})人)</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({if $is_c_commu_admin})
({if $c_commu.member_count != 1})
<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_c_send_message})&amp;target_c_commu_id=({$c_commu.c_commu_id})">参加者にメッセージを送る</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:125px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:125px;height:1px;" class="dummy"></td>
<td style="width:20px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1"></td>
<td align="left" style="width:116px;padding:2px 0px;" class="bg_02 lh_110">
<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})">メンバー管理</a>
</td>
<td style="width:5px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
<tr>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:266px;" class="bg_02" colspan="4"><img src="./skin/dummy.gif" alt="dummy" style="width:266px;height:5px;" class="dummy"></td>
<td style="width:1px;" class="bg_07"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:268px;" class="bg_07" colspan="6"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
<!-- *ここまで：メンバー一覧＞＞内容* -->
</td>
</tr>
</table>
<!-- ******ここまで：メンバー一覧****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[5]})
({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({if $smarty.const.OPENPNE_USE_COMMU_MAP && $c_commu.is_display_map}) 
<table border="0" cellspacing="0" cellpadding="10" style="width:270px;margin:0px auto;" class="border_07">
<tr>
<td style="width:268px;" class="bg_00">
<div id="map" style="width: 248px; height: 300px"></div>
</td>
</tr>
</table>
({/if})

({********************************})
({**ここまで：メインコンテンツ（左）**})
({********************************})
({ext_include file="inc_layoutcolumn_middle_270px.tpl"})
({********************************})
({**ここから：メインコンテンツ（右）**})
({********************************})

({if $inc_entry_point[6]})
({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

<!-- **************************************** -->
<!-- ******ここから：コミュニティ情報一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:440px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:424px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01">
<!-- *ここから：コミュニティ情報一覧＞内容* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:300px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">コミュニティ</span></td>
<td style="width:86px;" align="right" class="bg_06">&nbsp;</td>
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
<!-- ここから：主内容＞コミュニティの名前 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ名</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$c_commu.name})

</td>
</tr>
<!-- ここまで：主内容＞コミュニティの名前 -->
<!-- ここから：主内容＞開設日 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">開設日</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})

</td>
</tr>
<!-- ここまで：主内容＞開設日 -->
<!-- ここから：主内容＞管理者 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">管理者</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})">({$c_commu.c_member_admin.nickname})</a>

</td>
</tr>
<!-- ここまで：主内容＞管理者 -->
({if $sub_admin})
<!-- ここから：主内容＞副管理者 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">副管理者</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$sub_admin.c_member_id})">({$sub_admin.nickname})</a>

</td>
</tr>
<!-- ここまで：主内容＞副管理者 -->
({/if})
<!-- ここから：主内容＞カテゴリ -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">カテゴリ</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$c_commu.c_commu_category.name|default:"&nbsp;"})

</td>
</tr>
<!-- ここまで：主内容＞カテゴリ -->
<!-- ここから：主内容＞メンバー数 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">メンバー数</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$c_commu.member_count|default:"０"})人

</td>
</tr>
<!-- ここまで：主内容＞メンバー数 -->
<!-- ここから：主内容＞参加条件と公開レベル -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">参加条件と<br>公開範囲</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({if $c_commu.public_flag == 'public'})
だれでも参加できる(公開)
({elseif $c_commu.public_flag == 'auth_public'})
管理者の承認が必要(公開)
({elseif $c_commu.public_flag == 'auth_sns'})
管理者の承認が必要(公開)
({elseif $c_commu.public_flag == 'auth_commu_member'})
管理者の承認が必要(非公開)
({/if})

</td>
</tr>
<!-- ここまで：主内容＞参加条件と公開レベル -->
<!-- ここから：主内容＞コミュニティの説明 -->
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ<br>説明文</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({$c_commu.info|t_url2a|nl2br})

</td>
</tr>
<!-- ここまで：主内容＞コミュニティの説明 -->
({if $is_c_commu_member || $c_commu.public_flag != "auth_commu_member"})
<!-- ここから：主内容＞新着のトピック書き込み -->
({if $new_topic_comment})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ<br>掲示板</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$new_topic_comment item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">({$item.name})(({$item.count_comments}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞新着のトピック書き込み＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a>
</td>
</tr>
({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">トピックを作成</a>
</td>
</tr>
({/if})
</table>
</div>
<!-- ここまで：主内容＞新着のトピック書き込み＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞新着のトピック書き込み -->
<!-- ここから：主内容＞新着のイベント書き込み -->
({if $new_topic_comment_event})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">新着の<br>イベント<br>書き込み</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$new_topic_comment_event item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_1">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">({$item.name})(({$item.count_comments}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" class="icon">({/if})<br>
({/foreach})

<!-- ここから：主内容＞新着のイベント書き込み＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a>
</td>
</tr>
({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">イベントを作成</a>
</td>
</tr>
({/if})
</table>
</div>
<!-- ここまで：主内容＞新着のイベント書き込み＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞新着のイベント書き込み -->
<!-- ここから：主内容＞新着のおすすめレビュー -->
({if $new_commu_review})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">新着の<br>おすすめ<br>レビュー</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

({foreach from=$new_commu_review item=item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;" class="icon icon_2">({$item.r_datetime|date_format:"%m月%d日"})…&nbsp;<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|truncate:40})</a><br>
({/foreach})

<!-- ここから：主内容＞新着のおすすめレビュー＞フッターメニュー -->
<div align="right">
<table border="0" cellspacing="0" cellpadding="0" style="width:130px;">
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a>
</td>
</tr>
<tr>
<td style="width:130px;text-align:left;padding:1px 0px;">
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">レビューを掲載</a>
</td>
</tr>
</table>
</div>
<!-- ここまで：主内容＞新着のおすすめレビュー＞フッターメニュー -->

</td>
</tr>
({/if})
<!-- ここまで：主内容＞新着のおすすめレビュー -->
({/if})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：小メニュー -->
({if !$new_topic_comment || !$new_topic_comment_event || $is_c_commu_admin})
<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:260px;" class="bg_02"><img src="./skin/dummy.gif" alt="dummy" style="width:260px;height:1px;" class="dummy"></td>
<td style="width:160px;padding:5px 0px;" class="bg_02 lh_140">
({if $is_c_commu_member || $c_commu.public_flag != "auth_commu_member"})
({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
({if !$new_topic_comment})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">トピックを作成</a>
<br>
({/if})
({if !$new_topic_comment_event})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">イベントを作成</a>
<br>
({/if})
({/if})
({/if})
({if $is_c_commu_admin})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})">コミュニティ設定変更</a>
<br>
({/if})
<br>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="4"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
({/if})
<!-- ここまで：小メニュー -->
({*ここまで：footer*})
({*ここから：*})

({if $is_c_commu_member && !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
<!-- ここから：主内容 -->
({t_form m=pc a=do_c_home_update_is_receive_mail})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:422px;">
({if !$is_c_commu_admin})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">管理者からの<br>メッセージを</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<input type="radio" value="1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if}) class="no_bg">受け取る<br>
<input type="radio" value="0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if}) class="no_bg">受け取らない

</td>
</tr>
({/if})
({if $smarty.const.OPENPNE_ENABLE_KTAI && !$is_unused_ktai_bbs && $is_registered_ktai_address})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ<br>書き込みを<br>携帯メールで</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<input type="radio" value="1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if}) class="no_bg">受け取る<br>
<input type="radio" value="0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if}) class="no_bg">受け取らない

</td>
</tr>
({/if})
({if !$is_unused_pc_bbs})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">コミュニティ<br>書き込みを<br>PCメールで</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<input type="radio" value="1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if}) class="no_bg">受け取る<br>
<input type="radio" value="0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if}) class="no_bg">受け取らない

</td>
</tr>
({/if})
<tr>
<td class="border_01 bg_09 padding_s" style="width:90px;border-right:none;border-top:none;">

<span class="c_01">&nbsp;</span>

</td>
<td class="border_01 bg_02 padding_s" style="width:332px;border-top:none;">

<input type="submit" class="submit" value="メール受信設定変更">

</td>
</tr>
</table>

</form>
({/if})
({*ここまで：*})

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="height:1px;" class="dummy"></td>
</tr>
</table>
<!-- *ここまで：コミュニティ情報一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:424px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：コミュニティ情報一覧****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $inc_entry_point[7]})
({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
({/if})

({********************************})
({**ここまで：メインコンテンツ（右）**})
({********************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
