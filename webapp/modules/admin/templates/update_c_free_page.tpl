({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;お知らせ・規約設定：フリーページ編集</div>
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>フリーページ編集</h2>
<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_free_page_id" value="({$c_free_page.c_free_page_id})">
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_free_page.body})</textarea>
<p class="textBtn"><input type="submit" class="submit" value="編集"></p>
</form>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a></p>
</div>
({$inc_footer|smarty:nodefaults})
