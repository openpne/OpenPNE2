({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="スキン画像変更"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>スキン画像変更</h2>
<div class="contents">

<a name="skin"></a>
<p>ナビゲーションボタンの位置を旧バージョンのものに変更できます。<br />
1.8.x 以前のスキン画像をそのまま使いたい場合は、1.8形式を選択してください。<br />
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_version','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<select class="basic" name="version">
<option value="2.0"({if $smarty.const.SKIN_VERSION=='2.0'}) selected="selected"({/if})>2.0形式を使用する(デフォルト)</option>
<option value="1.8"({if $smarty.const.SKIN_VERSION=='1.8'}) selected="selected"({/if})>1.8形式を使用する</option>
</select>
<span class="textBtnS"><input type="submit" value="変更" /></span>
</form>
</p>
<p class="pageNavi"><a href="#skin1">ログインページ</a>|　<a href="#skin2">メニュー等、画面上部画像&nbsp;[1]</a>|　<a href="#skin3">メニュー等、画面上部画像&nbsp;[2]</a>|　<a href="#skin4">画面下部画像</a>|　<a href="#skin5">NoImage画像</a>|　<a href="#skin6">画像ボタン</a>|　<a href="#skin7">レビュー用画像</a>|　<a href="#skin8">小物画像&nbsp;[1]</a>|　<a href="#skin9">小物画像&nbsp;[2]</a>|　<a href="#skin10">小物画像&nbsp;[3]</a>|　<a href="#skin11">小物画像&nbsp;[4]</a></p>
<p class="caution" id="c01">※規定のサイズと異なる画像を設定した場合、レイアウトが崩れてしまう可能性があります。</p>


<table class="basicType2">
({*******})
<tr class="skin1">
<th><a name="skin1">ログインページ</a></th>
</tr>
<tr class="skin1">
<td>
<dl class="box">
<dt><strong>ログイン画面</strong></dt>
<dd class="image">({assign var=skinname value=skin_login})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})"/>
<input type="hidden" name="skinname" value="skin_login" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/01.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin2">
<th><a name="skin2">メニュー等、画面上部画像&nbsp;[1]</a></th>
</tr>
<tr class="skin2">
<td>
<dl class="box">
<dt><strong>ログイン後ヘッダ</strong></dt>
<dd class="image">({assign var=skinname value=skin_after_header})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_after_header" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>ログイン後ヘッダ(ロールオーバー)</strong></dt>
<dd class="image">({assign var=skinname value=skin_after_header_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_after_header_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>自分ページメニュー</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_h})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>他人ページメニュー</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_f})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>コミュニティメニュー</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_c})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>自分ページメニュー(ロールオーバー)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_h_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>他人ページメニュー(ロールオーバー)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_f_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>コミュニティメニュー(ロールオーバー)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_c_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>サーチアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_search})<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_search" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>サーチボタン１</strong></dt>
<dd class="image">({assign var=skinname value=button_search_1})<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>サーチボタン２</strong></dt>
<dd class="image">({assign var=skinname value=button_search_2})<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>サーチボタン３</strong></dt>
<dd class="image">({assign var=skinname value=button_search_3})<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/02.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin3">
<th><a name="skin3">メニュー等、画面上部画像&nbsp;[2]</a></th>
</tr>
<tr class="skin3">
<td>
<dl class="box">
<dt><strong>誕生日画像</strong></dt>
<dd class="image">({assign var=skinname value=birthday_f})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_f" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>もうすぐ誕生日画像</strong></dt>
<dd class="image">({assign var=skinname value=birthday_f_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_f_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>自分の誕生日画像</strong></dt>
<dd class="image">({assign var=skinname value=birthday_h})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_h" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>インフォメーション欄アイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_information})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_information" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>ログイン前ヘッダ</strong></dt>
<dd class="image">({assign var=skinname value=skin_before_header})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_before_header" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/03.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin4">
<th><a name="skin4">画面下部画像</a></th>
</tr>
<tr class="skin4">
<td>
<dl class="box">
<dt><strong>共通フッタ</strong></dt>
<dd class="image">({assign var=skinname value=skin_footer})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_footer"/>
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/04.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin5">
<th><a name="skin5">NoImage画像</a></th>
</tr>
<tr class="skin5">
<td>
<dl class="box">
<dt><strong>no_image</strong></dt>
<dd class="image">({assign var=skinname value=no_image})<img src="({t_img_url_skin filename=$skinname w=180 h=180})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_image" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>no_logo</strong></dt>
<dd class="image">({assign var=skinname value=no_logo})<img src="({t_img_url_skin filename=$skinname w=180 h=180})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_logo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>no_logo_small</strong></dt>
<dd class="image">({assign var=skinname value=no_logo_small})<img src="({t_img_url_skin filename=$skinname w=76 h=76})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_logo_small" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/05.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin6">
<th><a name="skin6">画像ボタン</a></th>
</tr>
<tr class="skin6">
<td>
<dl class="box">
<dt><strong>「写真を編集」</strong></dt>
<dd class="image">({assign var=skinname value=button_edit_photo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_edit_photo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「プロフィール確認」</strong></dt>
<dd class="image">({assign var=skinname value=button_prof_conf})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_prof_conf" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「もっと写真を見る」</strong></dt>
<dd class="image">({assign var=skinname value=button_show_photo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_show_photo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>「拒否」</strong></dt>
<dd class="image">({assign var=skinname value=button_kyohi})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_kyohi" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「削除する」</strong></dt>
<dd class="image">({assign var=skinname value=button_sakujo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_sakujo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「承認」</strong></dt>
<dd class="image">({assign var=skinname value=button_shonin})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_shonin" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「詳細を見る」</strong></dt>
<dd class="image">({assign var=skinname value=button_shosai})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_shosai" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>それ以外のボタン背景画像</strong></dt>
<dd class="image">({assign var=skinname value=bg_button})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_shosai" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/06.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin7">
<th><a name="skin7">レビュー用画像</a></th>
</tr>
<tr class="skin7">
<td>
<dl class="box">
<dt><strong>レビュー満足度１</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>レビュー満足度２</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>レビュー満足度３</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_3})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>レビュー満足度４</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_4})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_4" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>レビュー満足度５</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_5})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_5" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/07.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin8">
<th><a name="skin8">小物画像&nbsp;[1]</a></th>
</tr>
<tr class="skin8">
<td>
<dl class="box">
<dt><strong>見出し１</strong></dt>
<dd class="image">({assign var=skinname value=icon_title_1})<img src="({t_img_url_skin filename=$skinname})" style="width:25px;height:19px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_title_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>見出し２</strong></dt>
<dd class="image">({assign var=skinname value=content_header_1})<img src="({t_img_url_skin filename=$skinname})" style="width:30px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="content_header_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>矢印アイコン１</strong></dt>
<dd class="image">({assign var=skinname value=icon_arrow_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_arrow_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>矢印アイコン２</strong></dt>
<dd class="image">({assign var=skinname value=icon_arrow_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_arrow_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>リストアイコン１</strong></dt>
<dd class="image">({assign var=skinname value=icon_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>リストアイコン２</strong></dt>
<dd class="image">({assign var=skinname value=icon_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>リストアイコン３</strong></dt>
<dd class="image">({assign var=skinname value=icon_3})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/08.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin9">
<th><a name="skin9">小物画像&nbsp;[2]</a></th>
</tr>
<tr class="skin9">
<td>
<dl class="box">
<dt><strong>アラートアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_alert_l})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_alert_l" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>管理者アイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_crown})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_crown" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>画像有りアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_camera})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_camera" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/09.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin10">
<th><a name="skin10">小物画像&nbsp;[3]</a></th>
</tr>
<tr class="skin10">
<td>
<dl class="box">
<dt><strong>バースデイアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_birthday})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_birthday" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>イベントアイコン１</strong></dt>
<dd class="image">({assign var=skinname value=icon_event_B})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_event_B" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>イベントアイコン２</strong></dt>
<dd class="image">({assign var=skinname value=icon_event_R})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_event_R" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>スケジュール有りアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_pen})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_pen" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>お天気アイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_weather_FC})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_weather_FC" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>スケジュールタイトル</strong></dt>
<dd class="image">({assign var=skinname value=icon_schedule})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_schedule" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/10.gif" target="preview">詳細を確認する</a></p>
</td>
</tr>
({*******})
<tr class="skin11">
<th><a name="skin11">小物画像&nbsp;[4]</a></th>
</tr>
<tr class="skin11">
<td>
<dl class="box">
<dt><strong>未読メールアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_1})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>既読メールアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_2})<img src="({t_img_url_skin filename=$skinname})"/></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>送信済みメールアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_3})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>返信済みメールアイコン</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_4})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_4" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="変更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/11.gif" target="preview">詳細を確認する</a></p>

</td>
</tr>
</table> 
({$inc_footer|smarty:nodefaults})
