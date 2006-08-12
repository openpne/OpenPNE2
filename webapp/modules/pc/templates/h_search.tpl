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
<td class="container main_content">
<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：検索****** -->
({t_form _method=get m=pc a=page_h_search_result})

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：検索* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">検&nbsp;索</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから: 検索フォーム レイアウトテーブル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
生年月日
</span>
<img src="./skin/dummy.gif" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">
<input name="birth_year" size="4" maxlength="4">年
<input name="birth_month" size="2" maxlength="2">月
<input name="birth_day" size="2" maxlength="2">日
</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})

({foreach from=$profile_list item=profile})
({if $profile.disp_search})
<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
({$profile.caption})
</span>
<img src="./skin/dummy.gif" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
({* 単一選択パターン *})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({* 複数選択パターン *})
    ({*
    ({foreach from=$profile_list[$profile.name].options item=item})
    <input type="checkbox" name="profile[({$profile.name})][]" value="({$item.c_profile_option_id})">({$item.value})
    ({/foreach})
    *})
({elseif $profile.form_type == 'text' || $profile.form_type == 'textarea'})
    <input name="profile[({$profile.name})]" size="30" type="text">
({/if})

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
({/foreach})

<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
項目の一覧
</span>
<img src="./skin/dummy.gif" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">
検索項目を一覧表示します&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_search_list})">一覧を見る</a>
</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
写真の有無
</span>
<img src="./skin/dummy.gif" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="checkbox" name="image" value="1" class="no_bg">有のみ

</div>

</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">
<div style="padding:6px 100px;">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
<tr>
<td>

<div align="center" style="text-align:center;">

<input type="submit" value="　　検　索　　">

</div>

</td>
</tr>
</table>

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
</table>
<!-- ここまで: 検索フォーム レイアウトテーブル -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：検索* -->
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
<!-- ******ここまで：検索****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ***************************** -->
<!-- ******ここから：ニックネーム検索****** -->
({t_form _method=get m=pc a=page_h_search_result})
<input type="hidden" name="is_n" value="1">

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：ニックネーム検索* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">ニックネームで検索する</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<!-- ここから：主内容 -->
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:564px;height:50px;" class="bg_03" align="center" valign="middle">

<!--  ここから： ニックネーム検索フォーム レイアウトテーブル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">

<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" class="v_spacer_s">
<span class="c_01" style="padding:5px;">ニックネーム</span>
<img src="./skin/dummy.gif" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input name="nickname" size="30" type="text">

</div>
</td>
</tr>

<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>

<tr>
<td style="width:562px;" class="bg_03" align="center" valign="middle" colspan="3">
<div style="padding:6px 100px;">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
<tr><td>
<div align="center" style="text-align:center;">
<input type="submit" value="　　検　索　　">
</div>
</td></tr>
</table>

</div>
</td>
</tr>

</form>

</table>
<!--  ここまで： ニックネーム検索フォーム レイアウトテーブル -->

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<!-- ここまで：主内容 -->
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：ニックネーム検索* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>

</div>
<!-- ******ここまで：ニックネーム検索****** -->
<!-- *********************************************** -->


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
