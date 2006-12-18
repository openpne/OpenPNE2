({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;デザインカスタマイズ：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定</a>&nbsp;＞&nbsp;プロフィール項目編集</div>
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
</div>
({$inc_footer|smarty:nodefaults})
