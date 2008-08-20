<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<script type="text/javascript" src="./js/Selection.js?r7140"></script>
<script type="text/javascript" src="./js/tiny_mce/tiny_mce_popup.js?r7140"></script>
<script type="text/javascript" src="./js/pne_decoration.js"></script>
<title>({$INC_HEADER_title})</title>
({t_url_style})
<script type="text/javascript">
//<![CDATA[
function insertAlbumURLToTextarea(album_id) {
    var albumURLBase = "({t_url _absolute=1 _html=0 m=pc a=page_fh_album})";
    var replace = " " + albumURLBase + "&target_c_album_id=" + album_id + " ";

    var elm = window.opener.document.getElementById('mce_editor_textarea');

    if (elm.style.display == "none") {
        tinyMCEPopup.execCommand('mceInsertContent', false, replace);
    } else {
        pne_insert_str_to_selection(elm, replace);
    }
}
//]]>
</script>
</head>
<body id="pc_page_({$INC_HEADER_page_name})"><div id="Body">
<div id="Container" style="width: 600px">

<div id="Center" style="width: 580px; margin: 0 auto; padding: 10px 0;">

<h1 style="font-weight: bold; font-size: 1.2em;">アルバム・アルバム写真の挿入</h1>
<p>アルバム・アルバム写真を記事に挿入することができます。</p>

({if $total_num})
({* {{{ albumList *})
<div class="dparts albumList"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})のアルバム</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_h_album_insert_dialog})&amp;page=({$page-1})">前を表示</a></p>
({/if})
<p class="number">
({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({if $page_size > $album_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_h_album_insert_dialog})&amp;page=({$page+1})">次を表示</a></p>
({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_album_list item=item})
<table>
<tr>
<td class="photo" rowspan="4">
<img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})" alt="" />
<p><a href="#" onclick="insertAlbumURLToTextarea(({$item.c_album_id}))">アルバムを挿入</a></p>
</td>
<th>タイトル</th>
<td colspan="2">({$item.subject})</td>
</tr>
<tr>
<th>説明文</th>
<td colspan="2">({$item.description|t_truncate:36:"":3})</td>
</tr>
<tr>
<th>公開範囲</th>
<td colspan="2">
({if $item.public_flag == "public"})
全員に公開
({elseif $item.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $item.public_flag == "private"})
公開しない
({/if})
</td>
</tr>
<tr>
<th>作成日時</th>
<td>({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</td>
<td class="operation"><a href="({t_url m=pc a=page_h_album_image_insert_dialog})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></td>
</tr>
</table>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})のアルバム</h3></div>
<div class="block">
<p>まだアルバムがありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="#" onclick="window.close()">ウィンドウを閉じる</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- Container -->
</div><!-- Body -->


</body>
</html>
