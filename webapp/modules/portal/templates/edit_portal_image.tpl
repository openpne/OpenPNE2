({assign var="title" value="`$smarty.const.SNS_NAME`管理画面"})
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>({$title})</title>
<meta content="text/css" http-equiv="content-style-type" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="modules/admin/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/portal/admin/default.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="./js/prototype.js?r7140"></script>
<script type="text/javascript" src="./modules/admin/default.js"></script>
<script type="text/javascript">
<!--

var target_area_id = "({$target_area})";
var target_area = parent.document.getElementById(target_area_id);
var page = "({$pager.page})";

// 親ウィンドウの特定のテキストエリアに画像表示用タグを挿入する
function insertImageTagToParentWindow(imagefilename)
{
    // 挿入する画像表示用タグを生成
    var imgPathBase = '({t_img_url filename=dummy})';
    var imgPathDummyPos = imgPathBase.lastIndexOf("dummy");
    var textToInsert = '<img src="' + imgPathBase.substring(0, imgPathDummyPos) + imagefilename + '" />';

    // 文字列を挿入する
    target_area.value += textToInsert;

    // メッセージを変更
    var messageArea = document.getElementsByClassName("actionMsg");
    var message = document.createTextNode("画像を挿入しました");
    messageArea[0].replaceChild(message, messageArea[0].firstChild);
}

// 選択したポータル用画像を削除する
function deletePortalImage(imagefilename)
{
    if (window.confirm("本当にこの画像を削除しますか？")) {
        window.location.href = "?m=({$module_name})&a=do_delete_portal_image"
            + "&filename=" + imagefilename
            + "&target_area=({$target_area})"
            + "&sessid=({$PHPSESSID})";
    }
}

//-->
</script>
</head>
<body id="admin_page_edit_portal_image">

<div class="contents">

<p class="actionMsg">
({if $msg})
({$msg})
({elseif $pager.total_num})
挿入したい画像を選択してください
({else})
挿入したい画像を追加してください
({/if})
</p>

<div class="imageListTable">

({foreach name=c_image from=$portal_image_list item=item})
<div class="cell">
<dl>
<dt class="upImage"><img src="({t_img_url filename=$item.image_filename w=76 h=76})" /></dt>
<dd class="insert">
<span class="textBtnS"><button type="button" onclick="insertImageTagToParentWindow('({$item.image_filename})')">　挿　入　</button></span>
<span class="textBtnS"><button type="button" onclick="deletePortalImage('({$item.image_filename})')">　削　除　</button></span>
</dd>
</dl>
</div>
({/foreach})

<br class="clear" />
</div>({*/div class="imageListTable"*})

({if $pager.total_num})
<div class="listControl" id="pager02">
<p class="listMove">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_portal_image')})&amp;page=({$pager.prev_page})&amp;target_area=({$target_area})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page}) | <strong>({$i})</strong>({else}) | <a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_portal_image')})&amp;page=({$i})&amp;target_area=({$target_area})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page}) | <a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_portal_image')})&amp;page=({$pager.next_page})&amp;target_area=({$target_area})">次へ</a>({/if})
</p>
</div>({*/div class="listControlBtm"*})
({/if})
</div>({*/div class="contents"*})

<div class="container">

<div class="contents">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_portal_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_area" value="({$target_area})" />
<dl class="upload">
<dt class="upfile"><strong class="title">画像の追加</strong></dt>
<dd class="upfile"><input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="　追　加　" /></span></dd>
</dl>
</form>
</div>({*/div class="contents"*})

</div>

</body>
</html>
