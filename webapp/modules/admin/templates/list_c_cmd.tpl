({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="CMD設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD設定</h2>
<div class="contents">

<p>※CMD名称記述例 : ファイル名から拡張子を取り除いたもの<br>youtube.js → youtube</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>CMD名称</th>
<th>使用範囲</th>
<th colspan='2'>操作</th>
</tr>
</thead>
<tbody>

({foreach from=$c_cmd_list item=c_cmd})
<tr>
<th>({$c_cmd.c_cmd_id})</th>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})" />

<td><input type="text" class="basic" name="name" value="({$c_cmd.name})" /></td>
<td>

<table>
<tr>
<td>
<input name="permit[]" type="checkbox" value="1" id="check_permit_({$c_cmd.c_cmd_id})_community" ({if $c_cmd.permit.community}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_community">コミュニティ</label><br />
<input name="permit[]" type="checkbox" value="2" id="check_permit_({$c_cmd.c_cmd_id})_diary"({if $c_cmd.permit.diary}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_diary">日記</label><br />
<input name="permit[]" type="checkbox" value="4" id="check_permit_({$c_cmd.c_cmd_id})_profile"({if $c_cmd.permit.profile}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_profile">プロフィール</label><br />
<input name="permit[]" type="checkbox" value="64" id="check_permit_({$c_cmd.c_cmd_id})_message"({if $c_cmd.permit.message}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_message">メッセージ</label><br />
</td>
<td>
<input name="permit[]" type="checkbox" value="8" id="check_permit_({$c_cmd.c_cmd_id})_side_banner"({if $c_cmd.permit.side_banner}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_side_banner">サイドバナー</label><br />
<input name="permit[]" type="checkbox" value="16" id="check_permit_({$c_cmd.c_cmd_id})_info"({if $c_cmd.permit.info}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_info">お知らせ</label><br />
<input name="permit[]" type="checkbox" value="32" id="check_permit_({$c_cmd.c_cmd_id})_entry_point"({if $c_cmd.permit.entry_point}) checked="checked"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_entry_point">テンプレート挿入</label><br />
</td>
</tr>
</table>

</td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　変　更　" /></span></td>
</form>
<td>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_c_cmd_confirm','page')})" />
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})" />
<span class="textBtnS"><input type="submit" class="submit" value="　削　除　" /></span>
</form>

</td>
</tr>
({foreachelse})
<tr>
<td colspan="5">小窓が登録されていません</td>
</tr>
({/foreach})
</tbody>

<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<td class="idnumber"></td>
<td><input type="text" class="basic" name="name" value="" /></td>
<td>

<table>
<tr>
<td>
<input name="permit[]" type="checkbox" value="1" id="check_permit_0_community" checked="checked" /><label for="check_permit_0_community">コミュニティ</label><br />
<input name="permit[]" type="checkbox" value="2" id="check_permit_0_diary" checked="checked" /><label for="check_permit_0_diary">日記</label><br />
<input name="permit[]" type="checkbox" value="4" id="check_permit_0_profile" checked="checked" /><label for="check_permit_0_profile">プロフィール</label><br />
<input name="permit[]" type="checkbox" value="64" id="check_permit_0_message" checked="checked" /><label for="check_permit_0_message">メッセージ</label><br />
</td>
<td>
<input name="permit[]" type="checkbox" value="8" id="check_permit_0_side_banner" checked="checked" /><label for="check_permit_0_side_banner">サイドバナー</label><br />
<input name="permit[]" type="checkbox" value="16" id="check_permit_0_info" checked="checked" /><label for="check_permit_0_info">お知らせ</label><br />
<input name="permit[]" type="checkbox" value="32" id="check_permit_0_entry_point" checked="checked" /><label for="check_permit_0_entry_point">テンプレート挿入</label><br />
</td>
</tr>
</table>

</td>
<td colspan='2' align='center'><span class="textBtnS"><input type="submit" class="submit" value="　追　加　" /></span></td>
</tr>
</form>

</table>

({$inc_footer|smarty:nodefaults})
