({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="プロフィール項目設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})({/capture})

({assign var="page_name" value="プロフィール項目編集"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>プロフィール項目編集</h2>
<div class="contents">

<form action="./" method="post">
<table class="basicType2">
<tr>
<th><input type="hidden" name="m" value="({$module_name})" /><input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_profile','do')})" /><input type="hidden" name="sessid" value="({$PHPSESSID})" /><input type="hidden" name="c_profile_id" value="({$requests.c_profile_id})" />項目名</th>
<td><input type="text" class="basic" name="caption" value="({$c_profile.caption})" size="30" /></td>
</tr>
<tr>
<th>識別名</th>
<td><input type="text" class="basic" name="name" value="({$c_profile.name})" size="20" />　<span class="caution">※半角英数 と _ のみ（数値のみも不可）</span></td>
</tr>
<tr>
<th>必須</th>
<td><input type="checkbox" name="is_required" value="1"({if $c_profile.is_required}) checked="checked"({/if}) /></td>
</tr>
<tr>
<th>公開設定の選択</th>
<td>
<label><input type="radio" name="public_flag_edit" value="0"({if !$c_profile.public_flag_edit}) checked="checked"({/if}) />固定</label>
<label><input type="radio" name="public_flag_edit" value="1"({if $c_profile.public_flag_edit}) checked="checked"({/if}) />メンバー選択</label></td>
</tr>
<tr>
<th>公開設定<br>デフォルト値</th>
<td><select class="basic" name="public_flag_default">
<option value="public"({if $c_profile.public_flag_default == 'public'}) selected="selected"({/if})>全員に公開</option>
<option value="friend"({if $c_profile.public_flag_default == 'friend'}) selected="selected"({/if})>({$WORD_MY_FRIEND})まで公開</option>
<option value="private"({if $c_profile.public_flag_default == 'private'}) selected="selected"({/if})>公開しない</option>
</select></td>
</tr>
<tr>
<th>並び順</th>
<td><input type="text" class="basic" name="sort_order" value="({$c_profile.sort_order})" size="10" /></td>
</tr>
<tr>
<th>新規登録</th>
<td>
<label><input type="radio" name="disp_regist" value="1"({if $c_profile.disp_regist}) checked="checked"({/if}) />表示する</label>
<label><input type="radio" name="disp_regist" value="0"({if !$c_profile.disp_regist}) checked="checked"({/if}) />表示しない</label></td>
</tr>
<tr>
<th>プロフィール変更</th>
<td>
<label><input type="radio" name="disp_config" value="1"({if $c_profile.disp_config}) checked="checked"({/if}) />表示する</label>
<label><input type="radio" name="disp_config" value="0"({if !$c_profile.disp_config}) checked="checked"({/if}) />表示しない</label></td>
</tr>
<tr>
<th>メンバー検索</th>
<td>
<label><input type="radio" name="disp_search" value="1"({if $c_profile.disp_search}) checked="checked"({/if}) />表示する</label>
<label><input type="radio" name="disp_search" value="0"({if !$c_profile.disp_search}) checked="checked"({/if}) />表示しない</label></td>
</tr>
<tr>
<th>説明</th>
<td><input type="text" name="info" value="({$c_profile.info})" size="30"></td>
</tr>
<tr>
<th>フォームタイプ</th>
<td><select class="basic" name="form_type">
<option value="text"({if $c_profile.form_type == 'text'}) selected="selected"({/if})>テキスト</option>
<option value="textlong"({if $c_profile.form_type == 'textlong'}) selected="selected"({/if})>テキスト(長)</option>
<option value="textarea"({if $c_profile.form_type == 'textarea'}) selected="selected"({/if})>テキスト(複数行)</option>
<option value="select"({if $c_profile.form_type == 'select'}) selected="selected"({/if})>単一選択(プルダウン)</option>
<option value="radio"({if $c_profile.form_type == 'radio'}) selected="selected"({/if})>単一選択(ラジオボタン)</option>
<option value="checkbox"({if $c_profile.form_type == 'checkbox'}) selected="selected"({/if})>複数選択(チェックボックス)</option>
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
<td><input type="text" class="basic" name="val_min" value="({if $c_profile.val_min != 0})({$c_profile.val_min})({/if})" size="10">&#xff5e;<input type="text" class="basic" name="val_max" value="({if $c_profile.val_max != 0})({$c_profile.val_max})({/if})" size="10" /><br />
<span class="caution">※入力値タイプが「数値」の場合は数値の範囲、それ以外の場合は(半角の)文字数</span></td>
</tr>
<tr>
<th>正規表現</th>
<td><input type="text" class="basic" name="val_regexp" value="({$c_profile.val_regexp})" size="30" /><br />
<span class="caution">※入力値タイプで「正規表現」を選んだ場合のみ有効(PHPのPerl互換(PCRE)正規表現関数を使用)<br />例： /^[a-c]\d+$/</span></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="編集する" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定へ戻る</a></p>
({$inc_footer|smarty:nodefaults})
