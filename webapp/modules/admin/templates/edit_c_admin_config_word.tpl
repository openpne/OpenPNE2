({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="SNS設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS内名称設定</h2>
<div class="contents">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_config_word','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="basicType2">
<tr>
<th rowspan="4">フレンド名称</th>
<th>フレンド</th>
<td>
<span class="info">SNS内「フレンド」を他の名称に設定します</span><br />
<input class="basic" name="WORD_FRIEND" type="text" value="({$WORD_FRIEND})" size="30" />
</td>
</tr>
<tr>
<th>マイフレンド</th>
<td>
<span class="info">SNS内「マイフレンド」を他の名称に設定します</span><br />
<input class="basic" name="WORD_MY_FRIEND" type="text" value="({$WORD_MY_FRIEND})" size="30" />
</td>
</tr>
<tr>
<th>ﾌﾚﾝﾄﾞ（携帯）</th>
<td>
<span class="info">SNS内「ﾌﾚﾝﾄﾞ」（携帯）を他の名称に設定します</span><br />
<input class="basic" name="WORD_FRIEND_HALF" type="text" value="({$WORD_FRIEND_HALF})" size="30" />
</td>
</tr>
<tr>
<th>ﾏｲﾌﾚﾝﾄﾞ（携帯）</th>
<td>
<span class="info">SNS内「ﾏｲﾌﾚﾝﾄﾞ」（携帯）を他の名称に設定します</span><br />
<input class="basic" name="WORD_MY_FRIEND_HALF" type="text" value="({$WORD_MY_FRIEND_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">日記名称</th>
<th>日記</th>
<td>
<span class="info">SNS内「日記」を他の名称に設定します</span><br />
<input class="basic" name="WORD_DIARY" type="text" value="({$WORD_DIARY})" size="30" />
</td>
</tr>
<tr>
<th>日記（携帯）</th>
<td>
<span class="info">SNS内「日記」（携帯）を他の名称に設定します</span><br />
<input class="basic" name="WORD_DIARY_HALF" type="text" value="({$WORD_DIARY_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">コミュニティ名称</th>
<th>コミュニティ</th>
<td>
<span class="info">SNS内「コミュニティ」を他の名称に設定します</span><br />
<input class="basic" name="WORD_COMMUNITY" type="text" value="({$WORD_COMMUNITY})" size="30" />
</td>
</tr>
<tr>
<th>ｺﾐｭﾆﾃｨ（携帯）</th>
<td>
<span class="info">SNS内「ｺﾐｭﾆﾃｨ」（携帯）を他の名称に設定します</span><br />
<input class="basic" name="WORD_COMMUNITY_HALF" type="text" value="({$WORD_COMMUNITY_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">ニックネーム名称</th>
<th>ニックネーム</th>
<td>
<span class="info">SNS内「ニックネーム」を他の名称に設定します</span><br />
<input class="basic" name="WORD_NICKNAME" type="text" value="({$WORD_NICKNAME})" size="30" />
</td>
</tr>
<tr>
<th>ﾆｯｸﾈｰﾑ（携帯）</th>
<td>
<span class="info">SNS内「ﾆｯｸﾈｰﾑ」（携帯）を他の名称に設定します</span><br />
<input class="basic" name="WORD_NICKNAME_HALF" type="text" value="({$WORD_NICKNAME_HALF})" size="30" />
</td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="設定変更する" /></p>
</form>

({$inc_footer|smarty:nodefaults})
