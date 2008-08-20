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
function insertAlbumImageURLToTextarea(album_image_id) {
    var albumURLBase = "({t_url _absolute=1 _html=0 m=pc a=page_fh_album_image_show})";
    var replace = " " + albumURLBase + "&target_c_album_image_id=" + album_image_id + " ";

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

<div id="Center" style="width : 580px; margin: 0 auto; padding: 10px 0;">

<h1 style="font-weight: bold; font-size: 1.2em;">アルバム写真の挿入</h1>
<p>アルバム写真を記事に挿入することができます。</p>

({if $total_num})
({* {{{ photoTable *})
<div class="dparts photoTable"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_image_insert_dialog})&amp;page=({$page-1})({if $target_c_album_id})&amp;target_c_album_id=({$target_c_album_id})({/if})">前を表示</a></p>({/if})
<p class="number">
({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({if $page_size > $album_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_album_image_insert_dialog})&amp;page=({$page+1})({if $target_c_album_id})&amp;target_c_album_id=({$target_c_album_id})({/if})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
<tr class="photo">
({t_loop from=$target_album_image start=0 num=5})
<td>({if $item})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" />({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_album_image start=0 num=5})
<td>({if $item})({$item.image_description})<br /><a href="#" onclick="insertAlbumImageURLToTextarea(({$item.c_album_image_id}))">写真を挿入</a>({/if})</td>
({/t_loop})
</tr>

({if $target_album_image[5]})
<tr class="photo">
({t_loop from=$target_album_image start=5 num=5})
<td>({if $item})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" />({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_album_image start=5 num=5})
<td>({if $item})({$item.image_description})<br /><a href="#" onclick="insertAlbumImageURLToTextarea(({$item.c_album_image_id}))">写真を挿入</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_album_image[10]})
<tr class="photo">
({t_loop from=$target_album_image start=10 num=5})
<td>({if $item})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" />({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_album_image start=10 num=5})
<td>({if $item})({$item.image_description})<br /><a href="#" onclick="insertAlbumImageURLToTextarea(({$item.c_album_image_id}))">写真を挿入</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_album_image[15]})
<tr class="photo">
({t_loop from=$target_album_image start=15 num=5})
<td>({if $item})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" />({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_album_image start=15 num=5})
<td>({if $item})({$item.image_description})<br /><a href="#" onclick="insertAlbumImageURLToTextarea(({$item.c_album_image_id}))">写真を挿入</a>({/if})</td>
({/t_loop})
</tr>
({/if})

({if $target_album_image[20]})
<tr class="photo">
({t_loop from=$target_album_image start=20 num=5})
<td>({if $item})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" />({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$target_album_image start=20 num=5})
<td>({if $item})({$item.image_description})<br /><a href="#" onclick="insertAlbumImageURLToTextarea(({$item.c_album_image_id}))">写真を挿入</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})のアルバム</h3></div>
<div class="block">
<p>まだアルバム写真がありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="#" onclick="window.close()">ウィンドウを閉じる</a></li>
<li><a href="({t_url m=pc a=page_h_album_insert_dialog})">アルバム選択に戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- Container -->
</div><!-- Body -->


</body>
</html>
