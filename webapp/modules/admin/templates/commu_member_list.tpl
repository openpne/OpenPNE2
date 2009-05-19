({$inc_header|smarty:nodefaults})
</div>

({*ここまで:navi*})

<h2><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})" target="_blank">({$c_commu.name|t_truncate:60})</a>&nbsp;({$WORD_COMMUNITY})メンバーリスト</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

({capture name="pager"})
<div class="listControlTop">
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_member_list')})&amp;target_c_commu_id=({$target_c_commu_id})&amp;page=({$pager.prev_page})&amp;page_size=({$page_size})})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_member_list')})&amp;target_c_commu_id=({$target_c_commu_id})&amp;page=({$i})&amp;page_size=({$page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_member_list')})&amp;target_c_commu_id=({$target_c_commu_id})&amp;page=({$pager.next_page})&amp;page_size=({$page_size})">次へ</a>
({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_commu_member')})" />
<input type="hidden" name="target_c_commu_id" value=({$target_c_commu_id}) />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="basicType2">
<tr>
    <th>ID</th>
    <th>({$WORD_NICKNAME})</th>
    <th>コミュニティ入会日時</th>
</tr>
({foreach from=$c_member_list item=item})
    <tr>
    <td>({$item.c_member_id})</td>
    <td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname|t_truncate:60})</a></td>
    <td>({$item.r_datetime})</td>
    </tr>
({/foreach})
<tr>
    <th>ID</th>
    <th>({$WORD_NICKNAME})</th>
    <th>コミュニティ入会日時</th>
</tr>
</table>
<div class="listControlBtm">
<div class="msgTransmit">
<div class="msgTransmitBtn">
<input type="submit" id="btnAllTransmit" value="すべてのメンバーにメッセージ／Eメールを送る" />
</div>
</div>
</div>
</form>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({$inc_footer|smarty:nodefaults})
