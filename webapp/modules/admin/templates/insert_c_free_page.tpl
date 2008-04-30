({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="parent_page_name" value="フリーページ管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})({/capture})

({assign var="page_name" value="フリーページ追加"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>フリーページ追加</h2>
<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})"></textarea><br>
<p class="textBtn"><input type="submit" value="追加する" /></p>
</form><br>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a></p>
({$inc_footer|smarty:nodefaults})
