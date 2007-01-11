({$inc_header|smarty:nodefaults})

<h2>スキン画像変更</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<ol>
<li><a href="#skin1">ログインページ</a></li>
<li><a href="#skin2">メニュー等、画面上部画像１</a></li>
<li><a href="#skin3">メニュー等、画面上部画像２</a></li>
<li><a href="#skin4">画面下部画像</a></li>
<li><a href="#skin5">NoImage画像</a></li>
<li><a href="#skin6">画像ボタン</a></li>
<li><a href="#skin7">レビュー用画像</a></li>
<li><a href="#skin8">小物画像１</a></li>
<li><a href="#skin9">小物画像２</a></li>
<li><a href="#skin10">小物画像３</a></li>
<li><a href="#skin11">小物画像４</a></li>
</ol>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config')})">配色・CSS変更</a> (別ページ)</li>
</ul>

<hr>

<h3><a name="skin">スキン画像設定</a></h3>

<p>ナビゲーションボタンの位置を旧バージョンのものに変更できます。<br>
1.8.x 以前のスキン画像をそのまま使いたい場合は、1.8形式を選択してください。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_version','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<select name="version">
<option value="2.0"({if $smarty.const.SKIN_VERSION=='2.0'}) selected="selected"({/if})>2.0形式を使用する(デフォルト)</option>
<option value="1.8"({if $smarty.const.SKIN_VERSION=='1.8'}) selected="selected"({/if})>1.8形式を使用する</option>
</select>
<input type="submit" class="submit" value="変更">
</form>

<hr>

<p class="caution">※規定のサイズと異なる画像を設定した場合、レイアウトが崩れてしまう可能性があります。</p>
<p class="caution">※ロールオーバー機能を使用する場合は「SNS設定変更」でメニューロールオーバーを「使用する」に設定してください</p>

<style type="text/css">
<!--
.skin_image_categry {
	background-color:#A3BFF6;
}
.skin_image {
	text-align:center;
	vertical-align:middle;
}
-->
</style>

<table>
({*******})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin1">１.ログインページ</a></th>
</tr>
<tr>
<th>ログイン画面</th>
<td colspan="2" rowspan="4">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_login})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_login">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td align="right"><a href="modules/admin/img/01.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin2">２.メニュー等、画面上部画像１</a></th>
</tr>
<tr>
<th>ログイン後ヘッダ</th>
<td colspan="2" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_after_header})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_after_header">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})
<tr>
<th>自分ページメニュー</th>
<th>他人ページメニュー</th>
<th>コミュニティメニュー</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_navi_h})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=skin_navi_f})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=skin_navi_c})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_h">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_f">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_c">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})
<tr>
<th>ログイン後ヘッダ(ロールオーバー)</th>
<td colspan="2" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_after_header_2"})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_after_header_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})
<tr>
<th>自分ページメニュー(ロールオーバー)</th>
<th>他人ページメニュー(ロールオーバー)</th>
<th>コミュニティメニュー(ロールオーバー)</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_navi_h_2})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=skin_navi_f_2})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=skin_navi_c_2})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>


<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_h_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_f_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_navi_c_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
({********})

<tr>
<th>サーチアイコン</th>
<td colspan="2" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_search})
<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_search">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<th>サーチボタン１</th>
<th>サーチボタン２</th>
<th>サーチボタン３</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=button_search_1})
<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_search_2})
<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_search_3})
<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_search_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_search_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_search_3">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<th>サーチボタン４</th>
<td colspan="2" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=button_search_4})
<img src="({t_img_url_skin_biz filename=$skinname})" style="width:62px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_search_4">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td colspan="3" align="right"><a href="modules/admin/img/02.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin3">３.メニュー等、画面上部画像２</a></th>
</tr>

<tr>
<th>誕生日画像</th>
<th>もうすぐ誕生日画像</th>
<th>自分の誕生日画像</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=birthday_f})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=birthday_f_2})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=birthday_h})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="birthday_f">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="birthday_f_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="birthday_h">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>インフォメーション欄アイコン</th>
<td colspan="2" rowspan="6">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_information})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_information">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>ログイン前ヘッダ</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_before_header})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_before_header">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

<tr>
<td align="right" colspan="3"><a href="modules/admin/img/03.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin4">４.画面下部画像</a></th>
</tr>

<tr>
<th>共通フッタ</th>
<td colspan="2" rowspan="4">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=skin_footer})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a>
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="skin_footer">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

<tr>
<td align="right"><a href="modules/admin/img/04.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin5">５.NoImage画像</a></th>
</tr>

<tr>
<th>no_image</th>
<th>no_logo</th>
<th>no_logo_small</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=no_image})
<img src="({t_img_url_skin filename=$skinname w=180 h=180})">
</td>
<td class="skin_image">
({assign var=skinname value=no_logo})
<img src="({t_img_url_skin filename=$skinname w=180 h=180})">
</td>
<td class="skin_image">
({assign var=skinname value=no_logo_small})
<img src="({t_img_url_skin filename=$skinname w=76 h=76})">
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="no_image">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="no_logo">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="no_logo_small">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>


<tr>
<td align="right" colspan="3"><a href="modules/admin/img/05.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin6">６.画像ボタン</a</th>
</tr>

<tr>
<th>「写真を編集」</th>
<th>「プロフィール確認」</th>
<th>「もっと写真を見る」</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=button_edit_photo})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_prof_conf})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_show_photo})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_edit_photo">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_prof_conf">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_show_photo">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>「拒否」</th>
<th>「削除する」</th>
<th>「承認」</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=button_kyohi})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_sakujo})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=button_shonin})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_kyohi">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_sakujo">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_shonin">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>「詳細を見る」</th>
<th> それ以外のボタン背景画像</th>
<td colspan="1" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=button_shosai})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=bg_button})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="button_shosai">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="bg_button">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

<tr>
<td align="right" colspan="3"><a href="modules/admin/img/06.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin7">７.レビュー用画像</a></th>
</tr>
<tr>
<th>レビュー満足度１</th>
<th>レビュー満足度２</th>
<th>レビュー満足度３</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=satisfaction_level_1})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=satisfaction_level_2})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=satisfaction_level_3})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="satisfaction_level_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="satisfaction_level_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="satisfaction_level_3">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({*******})

<tr>
<th>レビュー満足度４</th>
<th>レビュー満足度５</th>
<td rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=satisfaction_level_4})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=satisfaction_level_5})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="satisfaction_level_4">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="satisfaction_level_5">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td colspan="3" align="right"><a href="modules/admin/img/07.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin8">８.小物画像１</a></th>
</tr>

<tr>
<th>見出し１</th>
<th>見出し２</th>
<td rowspan="6">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_title_1})
<img src="({t_img_url_skin filename=$skinname})" style="width:25px;height:19px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=content_header_1})
<img src="({t_img_url_skin filename=$skinname})" style="width:30px;height:20px;">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_title_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="content_header_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
({********})

<tr>
<th>矢印アイコン１</th>
<th>矢印アイコン２</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_arrow_1})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_arrow_2})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_arrow_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_arrow_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>リストアイコン１</th>
<th>リストアイコン２</th>
<th>リストアイコン３</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_1})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_2})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_3})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_3">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td colspan="3" align="right"><a href="modules/admin/img/08.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin9">９.小物画像２</a></th>
</tr>

<tr>
<th>アラートアイコン</th>
<th>管理者アイコン</th>
<th>画像有りアイコン</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_alert_l})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_crown})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_camera})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_alert_l">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_crown">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_camera">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td align="right" colspan="3"><a href="modules/admin/img/09.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin10">１０.小物画像３</a></th>
</tr>

<tr>
<th>バースデイアイコン</th>
<th>イベントアイコン１</th>
<th>イベントアイコン２</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_birthday})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_event_B})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_event_R})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_birthday">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_event_B">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_event_R">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>

({********})

<tr>
<th>スケジュール有りアイコン</th>
<th>お天気アイコン</th>
<th>スケジュールタイトル</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_pen})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_weather_FC})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_schedule})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_pen">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_weather_FC">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_schedule">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td colspan="3" align="right"><a href="modules/admin/img/10.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr>
<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
<tr>
<th colspan="3" class="skin_image_categry"><a name="skin11">１１.小物画像４</a></th>
</tr>

<tr>
<th>未読メールアイコン</th>
<th>既読メールアイコン</th>
<th>送信済みメールアイコン</th>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_mail_1})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_mail_2})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
<td class="skin_image">
({assign var=skinname value=icon_mail_3})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_mail_1">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_mail_2">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_mail_3">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<th>返信済みメールアイコン</th>
<td colspan="2" rowspan="3">&nbsp;</td>
</tr>
<tr>
<td class="skin_image">
({assign var=skinname value=icon_mail_4})
<img src="({t_img_url_skin filename=$skinname})">
({if $skin_list[$skinname]})<br><br>[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})
</td>
</tr>
<tr>
<td>
<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="skinname" value="icon_mail_4">
<input type="file" name="upfile">
<input type="submit" class="submit" value="変更">
</form>
</td>
</tr>
<tr>
<td colspan="3" align="right"><a href="modules/admin/img/11.gif" target="preview">詳細を確認する</a></td>
</tr>

<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
({********})
</table>

({$inc_footer|smarty:nodefaults})
