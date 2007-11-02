({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：検索****** -->
({t_form _method=get m=pc a=page_h_search_result})

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
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
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
ニックネーム
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input class="text" name="nickname" size="30" type="text">

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
生年月日
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">
<input type="text" class="text" name="birth_year" size="4" maxlength="4">年
<input type="text" class="text" name="birth_month" size="2" maxlength="2">月
<input type="text" class="text" name="birth_day" size="2" maxlength="2">日
</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({foreach from=$profile_list item=profile})
({if $profile.disp_search})
<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
({$profile.caption})
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>

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
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input class="text" name="profile[({$profile.name})]" size="30" type="text">
({/if})

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
({/foreach})

<tr>
<td style="width:150px;" class="bg_05" align="left" valign="middle">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<span class="c_01" style="padding:5px;">
写真の有無
</span>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
</td>

<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>

<td style="width:421px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<input type="checkbox" name="image" value="1" class="no_bg">有のみ

</div>

</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">
<div style="padding:6px 100px;">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
<tr>
<td>

<div align="center" style="text-align:center;">

<input type="submit" class="submit" value="　　検　索　　">

</div>

</td>
</tr>
</table>

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：検索****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：検索項目の一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：検索項目の一覧* -->
({*ここから：header*})
<!-- 小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:150px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">検索項目の一覧</span></td>
<td style="width:378px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
</div>
({*ここまで：header*})
({*ここから：body*})
<!-- ここから: 主内容 -->

<div class="border_01 bg_09" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div style="width:490px;padding:20px 10px;margin:0px auto;" class="border_01 bg_03">
検索項目の一覧と各項目のメンバー数を表示します。<br>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({t_form _method=get m=pc a=page_h_search_list})
<input type="submit" class="submit" value="　一覧を見る　">
</form>
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで: 主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：検索項目の一覧* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

<!-- ******ここまで：検索項目の一覧****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
