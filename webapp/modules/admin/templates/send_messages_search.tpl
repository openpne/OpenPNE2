({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メッセージ・メール送信"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>メッセージ・メール送信</h2>
<div class="contents">

<p>条件に合致するユーザにメッセージもしくはEメールを送信します。タイトルと本文を入力してください。</p>
<p class="caution">※このメッセージは、ID1番のユーザから送信されます。<br>
※送るユーザの数によっては大きな負荷がかかる可能性がありますのでご注意ください。</p>

<div id="page_navi">
<h3>◆送信先</h3>
<ul>
({if $cond_list.s_year||$cond_list.e_year})
生年月日<br>
({$cond_list.s_year})年～({$cond_list.e_year})年<br>
({/if})
({if $cond_list.s_point||$cond_list.e_point})
ポイント<br>
({$cond_list.s_point})～({$cond_list.e_point})<br>
({/if})
({foreach from=$profile_value_list key=key item=item})
({$item.caption}):({$item.value})<br>
({/foreach})
のメンバー
</ul>
</div>({*/div class="page_navi"*})

<div class="edit_message">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_search','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<dl>
<dt class="label">送信種別</dt>
<dd><select class="basic" name="send_type">
<option value="message"({if $send_type=='message'}) selected="selected"({/if})>メッセージ送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>Eメール送信</option>
</option>
</select>
</dd>
<dt class="label">タイトル</dt>
<dd><input type="text" class="basic" name="subject" size="50" value="({$requests.subject})"></dd>
<dt class="label">本文</dt>
<dd><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
<dd><p class="textBtn"><input type="submit" class="submit" value="メッセージ送信"></p></dd>
</dl>
</form>
<br>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>

</div>

</div>

({$inc_footer|smarty:nodefaults})
