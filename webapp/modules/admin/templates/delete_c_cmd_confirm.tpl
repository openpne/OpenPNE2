({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="CMD設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})({/capture})

({assign var="page_name" value="CMD削除確認画面"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD削除確認画面</h2>
<div class="contents">

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<td>({$c_cmd.c_cmd_id})</td>
</tr>
<tr>
<th>CMD名称</th>
<td>({$c_cmd.name})</td>
</tr>
<tr>
<th>使用範囲</th>
<td>

<table>
<tr>
<td>
({if $c_cmd.permit.community})○({else})×({/if}) : ({$WORD_COMMUNITY})<br />
({if $c_cmd.permit.diary})○({else})×({/if}) : ({$WORD_DIARY})<br />
({if $c_cmd.permit.profile})○({else})×({/if}) : プロフィール<br />
({if $c_cmd.permit.message})○({else})×({/if}) : メッセージ<br />
</td>
<td>
({if $c_cmd.permit.side_banner})○({else})×({/if}) : サイドバナー<br />
({if $c_cmd.permit.info})○({else})×({/if}) : お知らせ<br />
({if $c_cmd.permit.entry_point})○({else})×({/if}) : テンプレート挿入<br />
</td>
</tr>
</table>
</td>
</tr>
</thead>
</table>

<p>本当に削除してもよろしいですか？</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_cmd','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})" />
<p class="textBtn"><input type="submit" value=" は　い " />　<input type="button" value=" いいえ " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})'" /></p>
</form>

({$inc_footer|smarty:nodefaults})
