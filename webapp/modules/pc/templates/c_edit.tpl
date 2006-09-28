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

({ext_include file="inc_alert_box.tpl"})({* 繧ｨ繝ｩ繝ｼ繝｡繝・そ繝ｼ繧ｸ繧ｳ繝ｳ繝・リ *})

<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**縺薙％縺九ｉ・壹Γ繧､繝ｳ繧ｳ繝ｳ繝・Φ繝・*})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- **************************************** -->
<!-- ******縺薙％縺九ｉ・壹さ繝溘Η繝九ユ繧｣險ｭ螳壼､画峩****** -->
({t_form _enctype=file m=pc a=do_c_edit_update_c_commu})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:646px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *縺薙％縺九ｉ・壹さ繝溘Η繝九ユ繧｣險ｭ螳壼､画峩・槫・螳ｹ* -->
({*縺薙％縺九ｉ・喇eader*})
<!-- 縺薙％縺九ｉ・壼ｰ上ち繧､繝医Ν -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:168px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">繧ｳ繝溘Η繝九ユ繧｣險ｭ螳壼､画峩</span></td>
<td style="width:440px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
<!-- 縺薙％縺ｾ縺ｧ・壼ｰ上ち繧､繝医Ν -->
({*縺薙％縺ｾ縺ｧ・喇eader*})
({*縺薙％縺九ｉ・喘ody*})
<!-- 縺薙％縺九ｉ・壻ｸｻ蜀・ｮｹ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

繧ｳ繝溘Η繝九ユ繧｣蜷・

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:491px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="text" name="name" value="({$c_commu.name})" style="width:20em">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

繧ｫ繝・ざ繝ｪ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=cat})
<option value="({$cat.c_commu_category_id})"({if $cat.c_commu_category_id==$c_commu.c_commu_category_id}) selected="selected"({/if})>({$cat.name})</option>
({/foreach})
</select>
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蜿ょ刈譚｡莉ｶ縺ｨ<br>蜈ｬ髢狗ｯ・峇

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({html_radios name="public_flag" options=$public_flag_list class="no_bg" selected=$c_commu.public_flag separator="<br>"})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

繧ｳ繝溘Η繝九ユ繧｣隱ｬ譏取枚

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<textarea name="info" style="width:30em;height:6em;">({$c_commu.info})</textarea>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蜀・nbsp;逵・

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({if $c_commu.image_filename})
<img src="({t_img_url filename=$c_commu.image_filename w=76 h=76})"><br>
<a href="({t_url m=pc a=do_c_edit_image_delete_c_commu_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;sessid=({$PHPSESSID})">蜑企勁</a><br>
({/if})
<input type="file" size="40" name="image_filename">

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({if $smarty.const.OPENPNE_USE_COMMU_MAP})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蝨ｰ 蝗ｳ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
<input name="is_display_map" type="radio" value="1"({if $c_commu.is_display_map}) checked="checked"({/if})>陦ｨ遉ｺ縺吶ｋ<br>
<input name="is_display_map" type="radio" value="0"({if !$c_commu.is_display_map}) checked="checked"({/if})>陦ｨ遉ｺ縺励↑縺・
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蝨ｰ蝗ｳ諠・ｱ縺ｮ險ｭ螳・br>
・磯・驕灘ｺ懃恁繧帝∈謚橸ｼ・

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<select name="map_pref_id">
<option value="0">驕ｸ謚槭＠縺ｦ縺上□縺輔＞</option>
<option value="-1"({if !$pref_id && $c_commu.is_display_map}) selected="selected"({/if})>縺昴・莉厄ｼ域焔蜍戊ｨｭ螳夲ｼ・/option>
({foreach from=$pref_list item=item})
<option value="({$item.c_profile_pref_id})"({if $pref_id == $item.c_profile_pref_id}) selected="selected"({/if})>({$item.pref})</option>
({/foreach})
</select>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蝨ｰ蝗ｳ諠・ｱ縺ｮ險ｭ螳・br>
・域焔蜍戊ｨｭ螳夲ｼ・

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">
邱ｯ蠎ｦ・・input name="map_latitude" type="text" size="14" value="({$c_commu.map_latitude})">&nbsp;
邨悟ｺｦ・・input name="map_longitude" type="text" size="14" value="({$c_commu.map_longitude})">&nbsp;
諡｡螟ｧ邇・ｼ・input name="map_zoom" type="text" size="4" value="({$c_commu.map_zoom})" maxlength="2"><br>

窶ｻ謇句虚險ｭ螳壹・蝣ｴ蜷医・縲・・驕灘ｺ懃恁縺ｮ驕ｸ謚槭〒縲後◎縺ｮ莉厄ｼ域焔蜍戊ｨｭ螳夲ｼ峨阪ｒ驕ｸ繧薙〒縺上□縺輔＞縲・
</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({if !$is_unused_join_commu})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">

<div class="padding_s">

蜿ょ刈縺顔衍繧峨○<br>
繝｡繝ｼ繝ｫ蜿嶺ｿ｡險ｭ螳・

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="radio" class="no_bg" name="is_send_join_mail" value="1"({if $c_commu.is_send_join_mail}) checked="checked"({/if})>蜿嶺ｿ｡縺吶ｋ<br>
<input type="radio" class="no_bg" name="is_send_join_mail" value="0"({if !$c_commu.is_send_join_mail}) checked="checked"({/if})>蜿嶺ｿ｡縺励↑縺・br>
窶ｻ繧ｳ繝溘Η繝九ユ繧｣縺ｫ譁ｰ縺励￥蜿ょ刈閠・′蜉繧上▲縺滓凾縺ｫ縲∫ｮ｡逅・・縺ゅ↑縺・縺ｫ繝｡繝ｼ繝ｫ繧帝√ｊ縺ｾ縺吶・

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({/if})
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<div class="padding_w_m">

<div align="center" style="text-align:center;">
<input type="submit" value="縲縲螟峨譖ｴ縲縲">
</div>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- 縺薙％縺ｾ縺ｧ・壻ｸｻ蜀・ｮｹ -->
({*縺薙％縺ｾ縺ｧ・喘ody*})
({*縺薙％縺九ｉ・喃ooter*})
<!-- 辟｡縺・-->
({*縺薙％縺ｾ縺ｧ・喃ooter*})
<!-- *縺薙％縺ｾ縺ｧ・壹さ繝溘Η繝九ユ繧｣險ｭ螳壼､画峩・橸ｼ槫・螳ｹ* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>

</form>
<!-- ******縺薙％縺ｾ縺ｧ・壹さ繝溘Η繝九ユ繧｣險ｭ螳壼､画峩****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ****************************************** -->
<!-- ******縺薙％縺九ｉ・壹さ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:646px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *縺薙％縺九ｉ・壹さ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ・槫・螳ｹ* -->
({*縺薙％縺九ｉ・喇eader*})
<!-- 縺薙％縺九ｉ・壼ｰ上ち繧､繝医Ν -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:168px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">繧ｳ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ</span></td>
<td style="width:440px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
<!-- 縺薙％縺ｾ縺ｧ・壼ｰ上ち繧､繝医Ν -->
({*縺薙％縺ｾ縺ｧ・喇eader*})
({*縺薙％縺九ｉ・喘ody*})
<!-- 縺薙％縺九ｉ・壻ｸｻ蜀・ｮｹ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:642px;" class="bg_03" align="left" valign="middle">

<div class="padding_w_m">

({if $is_topic})

繧ｳ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ縺ｫ縺ｯ縲√ヨ繝斐ャ繧ｯ繧偵☆縺ｹ縺ｦ蜑企勁縺吶ｋ蠢・ｦ√′縺ゅｊ縺ｾ縺吶・br>
繝医ヴ繝・け縺後≠繧句ｴ蜷医・縲√◎繧後ｉ繧貞炎髯､縺励◆蠕後√％縺ｮ繝壹・繧ｸ縺ｫ蜀榊ｺｦ繧｢繧ｯ繧ｻ繧ｹ縺励※縺上□縺輔＞縲・br>
(蜑企勁繝懊ち繝ｳ縺瑚｡ｨ遉ｺ縺輔ｌ縺ｾ縺・<br>
<br>
蜑企勁縺ｮ髫帙・繝医Λ繝悶Ν遲峨ｒ驕ｿ縺代ｋ縺溘ａ縲√≠繧峨°縺倥ａ蜿ょ刈閠・∈蜑企勁繧貞相遏･縺励※縺上□縺輔＞縲・

({else})

縺薙・繧ｳ繝溘Η繝九ユ繧｣繧貞炎髯､縺励∪縺吶ょ炎髯､縺ｮ髫帙・繝医Λ繝悶Ν遲峨ｒ驕ｿ縺代ｋ縺溘ａ縲√≠繧峨°縺倥ａ蜿ょ刈閠・∈蜑企勁繧貞相遏･縺励※縺上□縺輔＞縲・

<img src="./skin/dummy.gif" class="v_spacer_l">

({t_form m=pc a=do_c_edit_delete_c_commu})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<div align="center" syyle="text-align:center;">
<input type="submit" value="縲縲蜑翫髯､縲縲">
</div>
</form>

<img src="./skin/dummy.gif" class="v_spacer_l">

({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- 縺薙％縺ｾ縺ｧ・壻ｸｻ蜀・ｮｹ -->
({*縺薙％縺ｾ縺ｧ・喘ody*})
({*縺薙％縺九ｉ・喃ooter*})
<!-- 辟｡縺・-->
({*縺薙％縺ｾ縺ｧ・喃ooter*})
<!-- *縺薙％縺ｾ縺ｧ・壹さ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ・橸ｼ槫・螳ｹ* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
<!-- ******縺薙％縺ｾ縺ｧ・壹さ繝溘Η繝九ユ繧｣繧貞炎髯､縺吶ｋ****** -->
<!-- ****************************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({***************************})
({**縺薙％縺ｾ縺ｧ・壹Γ繧､繝ｳ繧ｳ繝ｳ繝・Φ繝・*})
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
