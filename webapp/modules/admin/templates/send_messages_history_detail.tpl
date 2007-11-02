({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メンバーリスト"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>一括メッセージ送信履歴詳細</h2>
<div class="contents">
<p>
管理画面から送信したメッセージ履歴を表示します</p>

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

({if $history})
<table class="basicType2">

<tr>
<th>送信日時</th>
<td>({$history.r_datetime|date_format:"%Y/%m/%d"})</td>
</tr>

<tr>
<th>送信数</th>
<td>({$history.send_num})</td>
</tr>

<tr>
<th>タイトル    </th>
<td>({$history.subject|nl2br})</td>
</tr>

<tr>
<th>本文</th>
<td>({$history.body|nl2br})</td>
</tr>


<tr>
<th>送信先<br>メンバーID</th>
<td>
<textarea name="body" cols="6" rows="10" readonly="readonly">({foreach from=$history.c_member_ids item=c_member_id})({$c_member_id})
({/foreach})</textarea>
</td>
</tr>

</table>

({else})
送信履歴がありません<br>
({/if})

<br>

({$inc_footer|smarty:nodefaults})
