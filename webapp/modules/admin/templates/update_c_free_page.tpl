({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})
({assign var="page_name" value="フリーページ編集"})
({ext_include file="inc_tree_adminInfoKiyaku.tpl"})
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
タイトル<br>
<input type="text" name="title" value="({$c_free_page.title})" size="({$cols|default:72})"><br><br>
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_free_page.body})</textarea><br>

<table>
<tr>
<td>
<input type="radio" name="auth" value="1" ({if $c_free_page.auth}) checked="checked"({/if})>認証あり
</td>
<td>
<input type="radio" name="auth" value="0" ({if !$c_free_page.auth}) checked="checked"({/if})>認証なし(ログインしなくても見ることが出来ます)
</td>
</tr>
<tr>
<td>
<input type="radio" name="type" value="pc" ({if $c_free_page.type == 'pc'}) checked="checked"({/if})>PC
</td>
<td>
<input type="radio" name="type" value="ktai" ({if $c_free_page.type == 'ktai'}) checked="checked"({/if})>携帯<br>
</td>
</tr>
</table>
<p class="textBtn"><input type="submit" class="submit" value="編集"></p>
</form>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a></p>
({$inc_footer|smarty:nodefaults})
