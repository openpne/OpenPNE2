({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="`$WORD_DIARY`コメント管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_DIARY})コメント管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_comment_list','page')})" />
<h3 class="item">検索キーワード</h3>
<p id="c01">
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</p>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_comment_list','page')})" />
<h3 class="item">({$WORD_DIARY})ID検索</h3>
<input class="basic" type="text" name="target_c_diary_id" value="({$target_c_diary_id})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_comment_list','page')})" />
<h3 class="item">({$WORD_DIARY})コメントID検索</h3>
<input class="basic" type="text" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

({if !$diary_comment_list})

<p class="info">該当する({$WORD_DIARY})コメントが存在しません</p>

({else})

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています 
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})&amp;target_c_diary_id=({$target_c_diary_id})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})&amp;target_c_diary_id=({$target_c_diary_id})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})&amp;target_c_diary_id=({$target_c_diary_id})">次＞＞</a>({/if})
</p>
</div>({*/div class="listControl"*})
({/capture})

({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$diary_comment_list item=item})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_diary_comment_id})
</td>
</tr>
({****})
<tr>
<th>({$WORD_DIARY})タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" target="_blank">({$item.subject})</a> (コメント({$item.count_comments})件)
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.c_member.nickname})</a>
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
<th>({$WORD_DIARY})コメント本文</th>
<td class="textbody">
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
<div>
({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$item.body|nl2br|t_url2cmd:'diary'|t_cmd:'diary'})
({else})
({$item.body|nl2br})
({/if})
</td>
</tr>
({****})
<tr>
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_diary_comment')})" />
<input type="hidden" name="target_c_diary_comment_id" value="({$item.c_diary_comment_id})" />
<span class="textBtnS"><input type="submit" value="削除" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

({/if})

({$inc_footer|smarty:nodefaults})
