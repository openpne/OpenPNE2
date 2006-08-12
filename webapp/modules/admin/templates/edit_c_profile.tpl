({$inc_header|smarty:nodefaults})

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<h2>プロフィール項目一覧</h2>

<p>★<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_profile')})">プロフィール項目追加</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_profile_sort_order','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table style="font-size:small">
<tr>
<th colspan="2">操作</th>
<th>ID</th>
<th>項目名</th>
<th>識別名</th>
<th>必須</th>
<th>公開設定<br>できるか</th>
<th>公開設定<br>デフォルト値</th>
<th>フォーム<br>タイプ</th>
<th>並び順<br>(昇順)</th>
<th>選択肢</th>
<th>登録</th>
<th>変更</th>
<th>検索</th>
</tr>

({capture name="nick"})
<tr style="background:#eee">
<td>&nbsp;</td>
<td>&nbsp;</td>
<td class="idnumber">-</td>
<td>ニックネーム</td>
<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">×</td>
<td>全員に公開</td>
<td>テキスト</td>
<td class="number"><input type="text" name="sort_order_nick" size="5" value="({$smarty.const.SORT_ORDER_NICK})"></td>
<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
</tr>
({/capture})
({capture name="birth"})
<tr style="background:#eee">
<td>&nbsp;</td>
<td>&nbsp;</td>
<td class="idnumber">-</td>
<td>生まれた年</td>
<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
<td>全員に公開</td>
<td>テキスト</td>
<td class="number" rowspan="2"><input type="text" name="sort_order_birth" size="5" value="({$smarty.const.SORT_ORDER_BIRTH})"></td>
<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
</tr>
<tr style="background:#eee">
<td>&nbsp;</td>
<td>&nbsp;</td>
<td class="idnumber">-</td>
<td>誕生日</td>
<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">×</td>
<td>全員に公開</td>
<td>単一選択(プルダウン)</td>

<td>&nbsp;</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
<td style="text-align:center">○</td>
</tr>
({/capture})

({foreach name=prof from=$c_profile_list item=item})
({strip})

({if !$_cnt_nick && $item.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $item.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $item.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $item.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
<tr>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">変更</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">削除</a></td>
<td class="idnumber">({$item.c_profile_id})</td>
<td>({$item.caption})</td>
<td>({$item.name})</td>
<td style="text-align:center">({if $item.is_required})○({else})×({/if})</td>
<td style="text-align:center">({if $item.public_flag_edit})○({else})×({/if})</td>
<td>({if $item.public_flag_default == 'private'})公開しない({elseif $item.public_flag_default == 'friend'})({$smarty.const.WORD_MY_FRIEND})まで公開({else})全員に公開({/if})</td>
<td>({if $item.form_type == 'text'})テキスト({elseif $item.form_type == 'textarea'})テキスト(複数行)({elseif $item.form_type == 'select'})単一選択(プルダウン)({elseif $item.form_type == 'radio'})単一選択(ラジオボタン)({elseif $item.form_type == 'checkbox'})複数選択(チェックボックス)({/if})</td>
<td class="number">({$item.sort_order})</td>
<td>({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})<a href="#opt_({$item.name})">一覧</a>({else})&nbsp;({/if})</td>
<td style="text-align:center">({if $item.disp_regist})○({else})×({/if})</td>
<td style="text-align:center">({if $item.disp_config})○({else})×({/if})</td>
<td style="text-align:center">({if $item.disp_search})○({else})×({/if})</td>
</tr>
({/foreach})

({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})

<tr>
<td colspan="9">&nbsp;</td>
<td class="number"><input class="submit" type="submit" value="変更"></td>
<td colspan="4">&nbsp;</td
</tr>
</table>
</form>

<h2>プロフィール選択肢一覧</h2>

<ul class="caution">
<li>一項目ずつしか変更できません。</li>
<li>選択肢を削除するとその選択肢を選択していたユーザーの値が(たとえ必須項目であっても)空になります。</li>
</ul>

({foreach from=$c_profile_list item=item})
({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})

<h3><a name="opt_({$item.name})">({$item.caption})</a></h3>

<table>
<tr>
<th>項目名</th>
<th>並び順</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$item.options item=option})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_profile_option','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})">
<input type="text" name="value" value="({$option.value})" size="20"></td>
<td><input type="text" name="sort_order" value="({$option.sort_order})" size="5"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile_option','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})">
<input type="submit" class="submit" value="削除">
</td>
</form>
</tr>
</form>
({/foreach})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_profile_option','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_profile_id" value="({$item.c_profile_id})">
<input type="text" name="value" value="" size="20"></td>
<td><input type="text" name="sort_order" value="" size="5"></td>
<td colspan="2"><input type="submit" class="submit" value="項目追加"></td>
</form>
</tr>
</table>

({/if})
({/foreach})

({$inc_footer|smarty:nodefaults})
