({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="プロフィール項目設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>プロフィール項目設定</h2>
<div class="contents">
<h3 class="item" id="ttl01">プロフィール項目一覧</h3>
<p id="itemAdd"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_profile')})">プロフィール項目追加</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_profile_sort_order','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2" id="itemList">
<thead>
<tr>
<th colspan="2">操作</th>
<th>ID</th>
<th>項目名</th>
<th>識別名</th>
<th>必須</th>
<th>公開設定<br />変更の可否</th>
<th>公開設定<br />デフォルト値</th>
<th>フォームタイプ</th>
<th>並び順<br />(昇順)</th>
<th>選択肢</th>
<th>登録</th>
<th>変更</th>
<th>検索</th>
</tr>
</thead>
<tbody>
({capture name="nick"})
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">({$WORD_NICKNAME})</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">×</td>
<td class="cell07">全員に公開</td>
<td class="cell08">テキスト</td>
<td class="cell09"><input type="text" class="basic" name="sort_order_nick" size="5" value="({$smarty.const.SORT_ORDER_NICK})" /></td>
<td class="cell10">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
</tr>
({/capture})
({capture name="birth"})
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">生まれた年</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">○</td>
<td class="cell07">全員に公開</td>
<td class="cell08">テキスト</td>
<td class="cell09" rowspan="2"><input type="text" class="basic" name="sort_order_birth" size="5" value="({$smarty.const.SORT_ORDER_BIRTH})" /></td>
<td class="cell10">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
</tr>
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">誕生日</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">○</td>
<td class="cell07">全員に公開</td>
<td class="cell08">単一選択(プルダウン)</td>
<td class="cell09">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
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
<td class="cell01A"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">変更</a></td>
<td class="cell01B"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">削除</a></td>
<td class="cell02">({$item.c_profile_id})</td>
<td class="cell03">({$item.caption})</td>
<td class="cell04">({$item.name})</td>
<td class="cell05">({if $item.is_required})○({else})×({/if})</td>
<td class="cell06">({if $item.public_flag_edit})○({else})×({/if})</td>
<td class="cell07">({if $item.public_flag_default == 'private'})公開しない({elseif $item.public_flag_default == 'friend'})({$WORD_MY_FRIEND})まで公開({else})全員に公開({/if})</td>
<td class="cell08">({if $item.form_type == 'text'})テキスト({elseif $item.form_type == 'textlong'})テキスト(長)({elseif $item.form_type == 'textarea'})テキスト(複数行)({elseif $item.form_type == 'select'})単一選択(プルダウン)({elseif $item.form_type == 'radio'})単一選択(ラジオボタン)({elseif $item.form_type == 'checkbox'})複数選択(チェックボックス)({/if})</td>
<td class="cell09">({$item.sort_order})</td>
<td class="cell10">({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})<a href="#opt_({$item.name})">一覧</a>({else})&nbsp;({/if})</td>
<td class="cell11">({if $item.disp_regist})○({else})×({/if})</td>
<td class="cell12">({if $item.disp_config})○({else})×({/if})</td>
<td class="cell13">({if $item.disp_search})○({else})×({/if})</td>
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
<td class="cell09"><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
<td colspan="4">&nbsp;</td
></tr>
</table>
</form>

<h3 class="item" id="ttl02">プロフィール選択肢一覧</h3>
<ul class="caution" id="c01">
	<li>一項目ずつしか変更できません。</li>
	<li>選択肢を削除するとその選択肢を選択していたメンバーの値が(たとえ必須項目であっても)空になります。</li>
</ul>

({foreach from=$c_profile_list item=item})
({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})

<h4><a name="opt_({$item.name})">({$item.caption})</a></h4>

<table class="basicType2">
<tr>
<th>ID</th>
<th>項目名</th>
<th>並び順</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$item.options item=option})
<tr>
<form action="./" method="post">
<td>({$option.c_profile_option_id})</td>
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})" />
<input type="text" class="basic" name="value" value="({$option.value})" size="20" /></td>
<td><input type="text" class="basic" name="sort_order" value="({$option.sort_order})" size="5" /></td>
<td><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
</td>
</form>
</tr>
({/foreach})
<tr>
<form action="./" method="post">
<td>-</td>
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_id" value="({$item.c_profile_id})" />
<input type="text" class="basic" name="value" value="" size="20" /></td>
<td><input type="text" class="basic" name="sort_order" value="" size="5" /></td>
<td colspan="2"><span class="textBtnS"><input type="submit" value="項目追加" /></span></td>
</form>
</tr>
</table>

({/if})
({/foreach})

({$inc_footer|smarty:nodefaults})
