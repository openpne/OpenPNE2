({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="`$WORD_DIARY`管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_DIARY})管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_list','page')})" />
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_list','page')})" />
<h3 class="item">ID検索</h3>
<input class="basic" type="text" name="target_c_diary_id" value="({$target_c_diary_id})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</form>

({if !$diary_list})

<p class="info">該当する({$WORD_DIARY})が存在しません</p>

({else})

<script type="text/javascript" src="./js/select_delete.js"></script>

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({foreach from=$diary_list item=item})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
<input type="checkbox" name="del" value="({$item.c_diary_id})" />
({$item.c_diary_id})
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" target="_blank">({$item.subject})</a> (({if $item.count_comments})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list','page')})&amp;target_c_diary_id=({$item.c_diary_id})">({/if})コメント({$item.count_comments})件({if $item.count_comments})</a>({/if}))
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail','page')})&amp;target_c_member_id=({$item.c_member_id})">({$item.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>公開範囲</th>
<td>
({if $item.public_flag == "public"})
全員に公開
({elseif $item.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $item.public_flag == "private"})
公開しない
({/if})
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
<th>({$WORD_DIARY})本文</th>
<td class="textbody">
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
<div>
({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'|t_decoration:1})
({else})
({$item.body|nl2br|t_decoration:1})
({/if})
</td>
</tr>
({****})
<tr>
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_diary')})" />
<input type="hidden" name="target_c_diary_id" value="({$item.c_diary_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

<form id="select-delete-form" action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_diary_selected')})" />
<input type="hidden" id="del-ids" name="target_c_diary_ids" value="" />
<span class="textBtnS"><input type="button" id="select-delete" value="選択した({$WORD_DIARY})を削除" /></span>
</form>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({/if})

({$inc_footer|smarty:nodefaults})
