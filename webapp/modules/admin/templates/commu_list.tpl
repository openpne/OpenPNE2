({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="`$WORD_COMMUNITY`管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('commu_list','page')})" />
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('commu_list','page')})" />
<h3 class="item">ID検索</h3>
<input class="basic" type="text" name="target_c_commu_id" value="({$target_c_commu_id})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
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
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_list','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_list','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_list','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({foreach from=$commu_list item=item})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_commu_id})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" target="_blank">({$item.name})</a>
</td>
</tr>
({****})
<tr>
<th>管理者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})" target="_blank">({$item.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$item.r_datetime})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})説明文</th>
<td class="textbody">
({if $item.image_filename})
<div>
({if $item.image_filename})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename})" target="_blank"><img src="({t_img_url filename=$item.image_filename w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$item.info|nl2br|t_url2cmd:'community':$item.c_member_id_admin|t_cmd:'community'})
({else})
({$item.info|nl2br})
({/if})
</td>
</tr>
({****})
<tr>
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_commu')})" />
<input type="hidden" name="target_c_commu_id" value="({$item.c_commu_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({/if})

({$inc_footer|smarty:nodefaults})
