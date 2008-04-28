<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<script type="text/javascript" src="./js/Selection.js"></script>
<script type="text/javascript" src="./js/tiny_mce/tiny_mce_popup.js"></script>
<title>({$INC_HEADER_title})</title>
<link rel="stylesheet" href="./xhtml_style.php" type="text/css" />
<script type="text/javascript">
//<![CDATA[
function insertAlbumURLToTextarea(album_id) {
    var albumURLBase = "({t_url _absolute=1 _html=0 m=pc a=page_fh_album})";
    var replace = " " + albumURLBase + "&target_c_album_id=" + album_id + " ";

    var elm = window.opener.document.getElementById('mce_editor_textarea');

    if (elm.style.display == "none") {
        tinyMCEPopup.execCommand('mceInsertContent', false, replace);
    } else {
        var selection = new Selection(elm);

        var pos = selection.create(); 

        var head = elm.value.substring(0, pos.start);
        var tail = elm.value.substring(pos.end, elm.value.length);
        elm.value =  head + replace + tail;
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
({* unknown *})<div class="dparts" style="margin-top: 1em;"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>({$target_member.nickname})のアルバム</h3></div>
({* unknown *})
({* unknown *})({capture name=pager})({strip})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})
({* unknown *})<p class="prev"><a href="({t_url m=pc a=page_h_album_insert_dialog})&amp;page=({$page-1})">前を表示</a></p>
({* unknown *})({/if})
({* unknown *})<p class="number">
({* unknown *})({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({* unknown *})({if $page_size > $album_list_count})
({* unknown *})({$album_list_count+$page*$page_size-$page_size})
({* unknown *})({else})
({* unknown *})({$page*$page_size})
({* unknown *})({/if})
({* unknown *})件を表示
({* unknown *})</p>
({* unknown *})({if $is_next})
({* unknown *})<p class="next"><a href="({t_url m=pc a=page_h_album_insert_dialog})&amp;page=({$page+1})">次を表示</a></p>
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})({/strip})({/capture})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})({foreach from=$target_album_list item=item})
({* unknown *})<table>
({* unknown *})<tr>
({* unknown *})<td rowspan="4" align="center" style="width: 190px; padding: 5px;">
({* unknown *})<img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})" alt="" />
({* unknown *})<p style="text-align:center; padding: 2px;"><a href="#" onclick="insertAlbumURLToTextarea(({$item.c_album_id}))">アルバムを挿入</a></p>
({* unknown *})</td>
({* unknown *})<th style="width:75px; padding: 5px;">タイトル</th>
({* unknown *})<td style="padding: 5px;" colspan="2">({$item.subject})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">説明文</th>
({* unknown *})<td style="padding: 5px;" colspan="2">({$item.description|t_truncate:36:"":3})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">公開範囲</th>
({* unknown *})<td style="padding: 5px;" colspan="2">
({* unknown *})({if $item.public_flag == "public"})
({* unknown *})全員に公開
({* unknown *})({elseif $item.public_flag == "friend"})
({* unknown *})({$WORD_MY_FRIEND})まで公開
({* unknown *})({elseif $item.public_flag == "private"})
({* unknown *})公開しない
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<th style="border-left-width: 1px; padding: 5px;">作成日時</th>
({* unknown *})<td style="padding: 5px;">({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</td>
({* unknown *})<td style="padding: 5px; text-align: center;"><a href="({t_url m=pc a=page_h_album_image_insert_dialog})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({$smarty.capture.pager|smarty:nodefaults})
({* unknown *})
({* unknown *})</div></div>
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
