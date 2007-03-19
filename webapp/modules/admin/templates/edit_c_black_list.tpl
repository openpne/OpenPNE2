({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="ブラックリスト設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})({/capture})

({assign var="page_name" value="ブラックリスト編集"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリスト編集</h2>
<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_black_list','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_black_list_id" value="({$c_black_list.c_black_list_id})">
<table class="basicType2">
<tr>
<th>アドレス</th>
<th>備考</th>
<th>操作</th>
</tr>
<tr>
<td>
<input type="text" class="basic" name="address" value="({$c_black_list.address})">
</td>
<td>
<input type="text" class="basic" name="memo" value="({$c_black_list.memo})">
</td>
<td>
<span class="textBtnS"><input type="submit" value=" 編　集 ">　<input type="button" value=" 戻　る " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})'"></span>
</td>
</tr>
</table>
</form>
({$inc_footer|smarty:nodefaults})
