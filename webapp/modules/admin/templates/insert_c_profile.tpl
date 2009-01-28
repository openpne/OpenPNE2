({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="プロフィール項目追加"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>プロフィール項目追加</h2>
<div class="contents">
<form action="./" method="post">
<table class="basicType2">
<tr>
<th><input type="hidden" name="m" value="({$module_name})" /><input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_profile','do')})" /><input type="hidden" name="sessid" value="({$PHPSESSID})" />項目名</th>
<td><input type="text" class="basic" name="caption" value="" size="30" /></td>
</tr>
<tr>
<th>識別名</th>
<td><input type="text" class="basic" name="name" value="" size="20" />　<span class="caution">※半角英数 と _ の組み合わせのみ（数値だけの入力は許容されません）</span></td>
</tr>
<tr>
<th>必須</th>
<td><input type="checkbox" name="is_required" value="1" /></td>
</tr>
<tr>
<th>公開設定の選択</th>
<td>
<label><input type="radio" name="public_flag_edit" value="0" checked="checked" />固定</label>
<label><input type="radio" name="public_flag_edit" value="1" />メンバー選択</label></td>
</tr>
<tr>
<th>公開設定<br>デフォルト値</th>
<td><select class="basic" name="public_flag_default">
<option value="public">全員に公開</option>
<option value="friend">({$WORD_MY_FRIEND})まで公開</option>
<option value="private">公開しない</option>
</select></td>
</tr>
<tr>
<th>並び順</th>
<td><input type="text" class="basic" name="sort_order" value="" size="10" /></td>
</tr>
<tr>
<th>新規登録</th>
<td>
<label><input type="radio" name="disp_regist" value="1" checked="checked" />表示する</label>
<label><input type="radio" name="disp_regist" value="0" />表示しない</label></td>
</tr>
<tr>
<th>プロフィール変更</th>
<td>
<label><input type="radio" name="disp_config" value="1" checked="checked" />表示する</label>
<label><input type="radio" name="disp_config" value="0" />表示しない</label></td>
</tr>
<tr>
<th>メンバー検索</th>
<td>
<label><input type="radio" name="disp_search" value="1" checked="checked" />表示する</label>
<label><input type="radio" name="disp_search" value="0" />表示しない</label></td>
</tr>
<tr>
<th>説明</th>
<td><input type="text" name="info" value="({$c_profile.info})" size="30"></td>
</tr>
<tr>
<th>フォームタイプ</th>
<td><select class="basic" name="form_type">
<option value="text" selected="selected">テキスト</option>
<option value="textlong">テキスト(長)</option>
<option value="textarea">テキスト(複数行)</option>
<option value="select">単一選択(プルダウン)</option>
<option value="radio">単一選択(ラジオボタン)</option>
<option value="checkbox">複数選択(チェックボックス)</option>
</select></td>
</tr>
<tr>
<td colspan="2" class="caution">以下の項目はフォームタイプが「テキスト」、「テキスト(長)」、「テキスト(複数行)」の場合のみ有効です。</td>
</tr>
<tr>
<th>入力値タイプ</th>
<td><select class="basic" name="val_type">
<option value="string"({if $c_profile.val_type == 'string'}) selected="selected"({/if})>文字列</option>
<option value="int"({if $c_profile.val_type == 'int'}) selected="selected"({/if})>数値</option>
<option value="regexp"({if $c_profile.val_type == 'regexp'}) selected="selected"({/if})>正規表現</option>
</select></td>
</tr>
<tr>
<th>最小値&#xff5e;最大値</th>
<td><input type="text" class="basic" name="val_min" value="({if $c_profile.val_min != 0})({$c_profile.val_min})({/if})" size="10" />&#xff5e;<input type="text" class="basic" name="val_max" value="({if $c_profile.val_max != 0})({$c_profile.val_max})({/if})" size="10" /><br />
<span class="caution">※入力値タイプが「数値」の場合は数値の範囲、それ以外の場合は(半角の)文字数</span></td>
</tr>
<tr>
<th>正規表現</th>
<td><input type="text" class="basic" name="val_regexp" value="({$c_profile.val_regexp})" size="30" /><br />
<span class="caution">※入力値タイプで「正規表現」を選んだ場合のみ有効(PHPのPerl互換(PCRE)正規表現関数を使用)<br />
例： /^[a-c]\d+$/</span></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="追加する" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定へ戻る</a></p>
({$inc_footer|smarty:nodefaults})
