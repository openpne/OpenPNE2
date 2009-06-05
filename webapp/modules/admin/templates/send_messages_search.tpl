({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メッセージ・メール送信"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2>メッセージ・メール送信</h2>
<div class="contents">

<p>条件に合致するメンバーにメッセージもしくはEメールを送信します。</p>
<p class="caution">※このメッセージは、ID No.1のメンバーから送信されます。<br />
※送るメンバーの数によっては大きな負荷がかかる可能性がありますのでご注意ください。</p>

<div id="page_navi">
<h3>◆送信先</h3>
<p>以下の条件に当てはまるメンバー全て</p>
<ul>
({if $cond_list.id})
<li> ID : ({$cond_list.id})</li>
({/if})
({if $cond_list.nickname})
<li>({$WORD_NICKNAME}) : 「({$cond_list.nickname})」を含む</li>
({/if})
({if $cond_list.last_login})
<li>最終ログイン : ({$select_last_login[$cond_list.last_login]})</li>
({/if})
({if $cond_list.s_year||$cond_list.e_year})
<li>生年月日 : ({if $cond_list.s_year})({$cond_list.s_year})年({/if})～({if $cond_list.e_year})({$cond_list.e_year})年({/if})</li>
({/if})
({if $cond_list.s_rank||$cond_list.e_rank})
<li>ランク : ({$s_rank.name}) ～ ({$e_rank.name})</li>
({/if})
({foreach from=$profile_value_list item=item})
<li>({$item.caption}) : ({$item.value})</li>
({/foreach})
({if $cond_list.mail_address})
<li>メールアドレス : ({$cond_list.mail_address})</li>
({/if})
({if $cond_list.is_pc_address})
<li>PCメールアドレス : ({if $cond_list.is_pc_address == 1})登録している({else})登録していない({/if})</li>
({/if})
({if $cond_list.is_ktai_address})
<li>携帯メールアドレス : ({if $cond_list.is_ktai_address == 1})登録している({else})登録していない({/if})</li>
({/if})
</ul>
</div>({*/div class="page_navi"*})

<div class="edit_message">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_search','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="cond[({$key})]" value="({$item})" />
({/foreach})
({foreach from=$profile_cond_list key=key item=item})
({if is_array($item)})
  ({foreach from=$item item=check})
    <input type="hidden" name="profile[({$key})][]" value="({$check})" />
  ({/foreach})
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item})" />
({/if})
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
<dd><input type="text" class="basic" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="label">本文</dt>
<dd><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
<dd><p class="textBtn"><input type="submit" class="submit" value="メッセージ送信" /></p></dd>
</dl>
</form>
<br />
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>

</div>

({$inc_footer|smarty:nodefaults})
