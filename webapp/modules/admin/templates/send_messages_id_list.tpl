({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メッセージ・メール送信先指定"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>メッセージ・メール送信先指定</h2>
<div class="contents">

<p>メッセージもしくはEメールを送信するメンバーのIDまたはメールアドレスを入力してください。</p>
<p class="caution">※複数指定する場合は改行もしくはスペースで区切ってください</p>
({if $msg})
<p class="caution">({$msg})</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_id_list')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<p>
<select name="specify_type">
<option value="c_member_id">ID指定</option>
<option value="mail_address">メールアドレス指定</option>
</select>
</p>

<p>
<textarea name="c_member_id_list" rows="6" cols="50"></textarea>
</p>
<p class="textBtn"><input type="submit" class="submit" value="決定"></p>
</form>

({$inc_footer|smarty:nodefaults})