({$inc_header|smarty:nodefaults})

<script type="text/javascript">
<!--
function checkAll(){
    var sm = document.formSendMessages;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}

function clearAll(){
    var sm = document.formSendMessages;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}

function Link(linkLoc)
{ if(linkLoc !="") { window.location.href=linkLoc;} }

//-->
</script>

({if $msg})
<p class="caution">({$msg})</p>
({/if})


<form action="./" method="get">
<p style="margin-top:0">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})">
メールアドレス検索(完全一致)：
<input type="text" name="mail_address" value="({$requests.mail_address})" size="30">
<input type="submit" class="submit" value="検索">
</p>
</form>

({if $pager})
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})">
<input type="hidden" name="cond" value=({$cond})>
表示件数：
<select name="page_size">
<option value="10"({if $pager.page_size==10}) selected="selected"({/if})>10件</option>
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
</select>
<input type="submit" class="submit" value="変更">
<div class="caution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</div>
</form>
({/if})

({if $pager})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({if !$c_member_list})
<br>
<span style="color: red">※該当するメンバーは存在しません</span>
<br><br>
({/if})

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table style="font-size:small">

({capture name="table_header"})
<tr>
<th colspan="4">操作</th>
<th>ID</th>
<th>ニックネーム</th>
<th>最終ログイン</th>
<th>登録日</th>
<th>招待者</th>
<th colspan="3">画像</th>
<th colspan="3">生年月日</th>
({foreach from=$c_profile_list item=prof})
<th>({$prof.caption})</th>
({/foreach})
<th>ID</th>
<th>PCアドレス</th>
<th>携帯アドレス</th>
<th>登録時アドレス</th>
</tr>
({/capture})

<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tfoot>
({$smarty.capture.table_header|smarty:nodefaults})
</tfoot>
<tbody>

<tr>
<td colspan="3" align=center><br></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td colspan="3">
<select onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})({$cond})&amp;s_year='+this.options[this.selectedIndex].value);">
<option value="">選択してください</option>
({foreach from=$years item=item})
<option ({if $cond_list.s_year==$item})selected({/if}) value="({$item})">({$item})</option>
({/foreach})
</select>
～
<select onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})({$cond})&amp;e_year='+this.options[this.selectedIndex].value);">
<option value="">選択してください</option>
({foreach from=$years item=item})
<option ({if $cond_list.e_year==$item})selected({/if}) value="({$item})">({$item})</option>
({/foreach})
</select>
</td>


({foreach from=$profile_list item=prof})
<td>
({if $prof.form_type == radio || $prof.form_type == select})

<select onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})({$cond})&amp;({$prof.name})='+this.options[this.selectedIndex].value);">

<option value="">選択してください</option>
({foreach item=item from=$prof.options})
<option ({if $cond_list[$prof.name]==$item.c_profile_option_id})selected({/if}) value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})</option>
({/foreach})
</select>

({/if})
</td>

({/foreach})
<td></td>
<td></td>
<td></td>
<td></td>
</tr>


({foreach from=$c_member_list item=item})
<tr>
<td>({if $item.c_member_id != 1})<input type="checkbox" name="c_member_ids[]" value="({$item.c_member_id})">({else})&nbsp;({/if})</td>
<td>({if $item.c_member_id != 1})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_member_confirm')})&amp;target_c_member_id=({$item.c_member_id})">強制退会</a>({else})&nbsp;({/if})</td>
<td><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_is_login_rejected','do')})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">
({if $item.is_login_rejected})
<span class="caution">ログイン停止中</span>
({else})
ログイン停止
({/if})
</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('passwd')})&amp;target_c_member_id=({$item.c_member_id})">パスワード再発行</a></td>
<td class="idnumber">({$item.c_member_id})</td>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></td>
<td>({if $item.access_date != '0000-00-00 00:00:00'})({$item.access_date|date_format:"%y-%m-%d %H:%M"})({else})未ログイン({/if})</td>
<td>({if $item.r_date != '0000-00-00 00:00:00'})({$item.r_date|date_format:"%y-%m-%d"})({else})&nbsp;({/if})</td>
<td>({if $item.c_member_id_invite})({$item.c_member_id_invite}):<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_invite})" target="_blank">({$item.c_member_invite.nickname})</a>({else})&nbsp;({/if})</td>
<td>({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" target="_blank">●</a>({else})×({/if})</td>
<td>({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" target="_blank">●</a>({else})×({/if})</td>
<td>({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" target="_blank">●</a>({else})×({/if})</td>
<td class="number">({if $item.birth_year})({$item.birth_year})年({else})&nbsp;({/if})</td>
<td class="number">({if $item.birth_month})({$item.birth_month})月({else})&nbsp;({/if})</td>
<td class="number">({if $item.birth_day})({$item.birth_day})日({else})&nbsp;({/if})</td>
({foreach from=$c_profile_list item=prof})
<td>({strip})
({if $prof.form_type == "checkbox"})
    ({$item.profile[$prof.name].value|@t_implode:","|t_truncate:30})
({else})
    ({$item.profile[$prof.name].value|t_truncate:30})
({/if})
({/strip})</td>
({/foreach})
<td class="idnumber">({$item.c_member_id})</td>
<td>({if $item.secure.pc_address})<a href="mailto:({$item.secure.pc_address|escape:"hexentity"})">({$item.secure.pc_address|t_truncate:"30"|escape:"hexentity"})</a>({else})&nbsp;({/if})</td>
<td>({if $item.secure.ktai_address})<a href="mailto:({$item.secure.ktai_address})">({$item.secure.ktai_address|t_truncate:"30"})</a>({else})&nbsp;({/if})</td>
<td>({if $item.secure.regist_address})({$item.secure.regist_address})({else})&nbsp;({/if})</td>
</tr>
({/foreach})
</tbody>

</table>

<p>
<a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a> / <a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a>
</p>
メッセージ／Eメール送信<br>
<input type="submit" class="submit" value="選択したメンバー　">
</form>

<form action="./" method="post" name="formSendMessagesSearch">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
({if $cond})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_search')})">
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="hidden" name="cond" value="({$cond})">
({else})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})">
({/if})
<input type="submit" class="submit" value="絞り込んだメンバー">
</form>
<form action="./" method="post" name="formSendMessagesAll">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="submit" class="submit" value="すべてのメンバー　">
</form>

({if $pager})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

<div class="caution">※パスワード、秘密の質問の答えは不可逆な暗号化を施してデータベースへ保存しているため、元の文字列を知ることができません。</div>

({$inc_footer|smarty:nodefaults})
