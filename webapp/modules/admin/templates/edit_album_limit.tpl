({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="アルバム容量制限設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$page_name})</h2>

<div class="contents">

<div id="info">
<p>アルバム機能でメンバーが使用することのできる容量をMB単位で制限します。</p>
<ul>
<li>メンバー一人あたりの容量です</li>
<li>メンバーは、ここで設定された容量を超えた写真の投稿ができなくなります</li>
<li>空欄か0が指定された場合は無制限になります</li>
</ul>
</div>

<div id="limitForm">
<h4>アルバム容量制限</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_album_limit','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input id="input_limit" class="basic" type="text" name="limit" value="({$smarty.const.OPENPNE_ALBUM_LIMIT})" /><label for="input_limit">MB</label>
<p class="textBtn"><input type="submit" value="　変　更　" /></p>
</form>
</div>

({$inc_footer|smarty:nodefaults})
