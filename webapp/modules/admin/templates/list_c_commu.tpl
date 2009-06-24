({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="$WORD_COMMUNITYリスト"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})リスト</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_commu','page')})" />
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_commu','page')})" />
<h3 class="item">ID検索</h3>
<input class="basic" type="text" name="target_c_commu_id" value="({$target_c_commu_id})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

({if !$commu_list})

<p class="info">該当する({$WORD_COMMUNITY})が存在しません</p>

({else})

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<form id="formDeleteCommunitys" action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_commu')})" />

<table class="basicType2">
<tr>
    <th></th>
    <th>ID</th>
    <th>({$WORD_COMMUNITY})名</th>
    <th>({$WORD_COMMUNITY})管理者</th>
    <th>({$WORD_COMMUNITY})作成日</th>
    <th colspan="3">操作</th>
</tr>

({foreach from=$commu_list item=commu})
<tr>
    <td><input type="checkbox" name="target_c_commu_ids[]" value="({$commu.c_commu_id})" /></td>
    <td>({$commu.c_commu_id})</td>
    <td><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})" target="_blank">({$commu.name|truncate:60})</a></td>
    <td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$commu.c_member.c_member_id})">({$commu.c_member.nickname|truncate:60})</a></td>
    <td>({$commu.u_datetime})</td>
    <td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_commu_member_list')})&amp;target_c_commu_id=({$commu.c_commu_id})">メンバーリスト</a></td>
    <td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_commu_detail')})&amp;target_c_commu_id=({$commu.c_commu_id})">詳細</a></td>
    <td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_commu')})&amp;target_c_commu_id=({$commu.c_commu_id})">削除</a></td>
</tr>
({/foreach})

<tr>
    <th></th>
    <th>ID</th>
    <th>({$WORD_COMMUNITY})名</th>
    <th>({$WORD_COMMUNITY})管理者</th>
    <th>({$WORD_COMMUNITY})作成日</th>
    <th colspan="3">操作</th>
</tr>
</table>
<div class="listControlBtm">
<div class="msgTransmit">
<p class="msgCheck"><img src="modules/admin/img/icn_msgtransmit.gif" alt="dummy" /><a href="#" onClick="return checkAll('formDeleteCommunitys');" onKeyPress="return checkAll('formDeleteCommunitys');">全てをチェック</a>&nbsp;|&nbsp;<a href="#" onClick="return clearAll('formDeleteCommunitys');" onKeyPress="return clearAll('formDeleteCommunitys');">全てのチェックをはずす</a></p>

<div class="delTransmitBtn">
<span class="textBtnS">
<input type="submit" id="btnSelTransmit" value="選択した({$WORD_COMMUNITY})を削除" />
</span>
</form>

</div>({*/div class="msgTransmitBtn"*})
</div>({*/div class="msgTransmit"*})

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({/if})

({$inc_footer|smarty:nodefaults})
