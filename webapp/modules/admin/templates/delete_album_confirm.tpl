({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="アルバム削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>アルバム削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

<table class="basicType2 album">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$album.c_album_id})
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_album})&amp;target_c_album_id=({$album.c_album_id})" target="_blank">({$album.subject})</a>
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$album.c_member_id})" target="_blank">({$album.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>アルバムの説明</th>
<td class="textbody">
({$album.description|nl2br})
</td>
</tr>
({****})
<tr>
<th>表紙</th>
<td>
<img src="({if $album.album_cover_image})({t_img_url filename=$album.album_cover_image w=120 h=120})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})">
</td>
</tr>
({****})
<tr>
<th>公開範囲</th>
<td>
({if $album.public_flag == "public"})
全員に公開
({elseif $album.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $album.public_flag == "private"})
公開しない
({/if})
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$album.r_datetime})
</td>
</tr>
({****})
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_album','do')})" />
<input type="hidden" name="target_c_album_id" value="({$album.c_album_id})" />
<span class="textBtnS"><input type="submit" value="削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
