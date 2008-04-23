({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="CMDキャスター設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $errors})
<p class="actionMsg">
({foreach name=err from=$errors item=i})({$i})<br />({/foreach})
</p>
({/if})
({if $msg})
<p class="actionMsg">
({$msg})<br />
</p>
({/if})

<h2>({$page_name})</h2>
<div class="contents">

<p>※各小窓の使用設定は、<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('list_c_cmd', 'page')})">[CMD設定]</a>からおこなうことができます。</p>

<table class="basicType2">
<thead>
<tr>
<th>CMDキャストURL</th>
<th colspan='2'>操作</th>
</tr>
</thead>
<tbody>

({foreach from=$c_cmd_caster_list item=item})
<tr>

({t_form_block m=$module_name})
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd_caster','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_cmd_caster_id" value="({$item.c_cmd_caster_id})" />
<td>
<input type="text" name="url" class="url" value="({$item.url})" />
</td>
<td>
<span class="textBtnS"><input type="submit" class="submit" value="　変　更　" /></span>
</td>
({/t_form_block})
<td>
({t_form_block m=$module_name})
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_cmd_caster','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_cmd_caster_id" value="({$item.c_cmd_caster_id})" />
<span class="textBtnS"><input type="submit" class="submit" value="　削　除　" /></span>
({/t_form_block})
</td>

</tr>
({/foreach})

<tr>
({t_form_block m=$module_name})
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_cmd_caster','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<td>
<input type="text" name="url" class="url" value="" />
</td>
<td colspan="2">
<span class="textBtnS"><input type="submit" class="submit" value="　追　加　" /></span>
</td>
({/t_form_block})
</tr>

</tbody>

</table>

({$inc_footer|smarty:nodefaults})
