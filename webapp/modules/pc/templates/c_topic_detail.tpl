<div id="LayoutC">
({ext_include file="inc_c_com_topic_find.tpl"})

<div id="Center">

({if !$err_msg || !$is_writable_comment})

({* {{{ topicDetailBox *})
<div class="dparts topicDetailBox"><div class="parts">
<div class="partsHeading"><h3>[({$c_commu.name})] トピック</h3></div>
<dl>
<dt>({$c_topic.r_datetime|date_format:"%Y年%m月%d日"})<br />({$c_topic.r_datetime|date_format:"%H:%M"})</dt>
<dd>
<div class="title">
<p>({$c_topic.name})</p>
</div>
<div class="name">
<p><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})">({$c_topic.nickname})</a></p>
</div>
<div class="body">
({if $c_topic.image_filename1||$c_topic.image_filename2||$c_topic.image_filename3})
<ul class="photo">
({if $c_topic.image_filename1})<li><a href="({t_img_url filename=$c_topic.image_filename1})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename1 w=120 h=120})" alt="" /></a></li>({/if})
({if $c_topic.image_filename2})<li><a href="({t_img_url filename=$c_topic.image_filename2})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename2 w=120 h=120})" alt="" /></a></li>({/if})
({if $c_topic.image_filename3})<li><a href="({t_img_url filename=$c_topic.image_filename3})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">
({$c_topic.body|nl2br|t_url2cmd:'community':$c_topic.c_member_id|t_cmd:'community'})
</p>
</div>
({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div class="block attachFile"><ul>
<li><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">({$c_topic.original_filename})</a></li>
</ul></div>
({/if})
</dd>
</dl>
({if $is_c_commu_admin || ($is_c_topic_admin && $c_commu.is_topic !== 'admin_only')})
({if $is_c_commu_member || $c_commu.is_topic == 'public'})
<div class="operation">
({t_form_block _method=get m=pc a=page_c_topic_edit})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　編　集　" /></li>
</ul>
({/t_form_block})
</div>
({/if})
({/if})
</div></div>
({* }}} *})

({if $c_topic_write})
({* {{{ commentList *})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>書き込み</h3></div>

({if $pager.total_num > 20 || $pager.total_page_num > 1})
({strip})
<div class="pagerRelative">

({if $pager.total_num > 20})
({if $requests.page_size == 100})
<p><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">20件ずつ表示</a></p>
({else})
<p><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page_size=100#commentList">100件ずつ表示</a></p>
({/if})
({/if})

({if $pager.total_page_num > 1})
({if $requests.order == 'asc'})
<p><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})#commentList">最新を表示</a></p>
({else})
<p><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})&amp;order=asc#commentList">最初から表示</a></p>
({/if})
({/if})

</div>
({/strip})
({/if})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page=({$pager.page_prev})">前を表示</a></p>({/if})
<p class="number">({$pager.start_num})番～({$pager.end_num})番を表示</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page=({$pager.page_next})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./js/comment.js"></script>
({/if})
({foreach from=$c_topic_write item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年<br />%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading"><strong>({$item.number})</strong>:
 <a id="comment-({$item.number})-member" title="({$item.nickname})" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>
({if $c_member_id == $item.c_member_id || $c_member_id == $c_commu.c_member_id_admin || $c_member_id == $c_commu.c_member_id_sub_admin}) <a href="({t_url m=pc a=page_c_topic_write_delete_confirm})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})">削除</a>({/if})
({if $is_c_commu_member && $is_writable_comment && $smarty.const.USE_RESPONSE_COMMENT}) <a href="javascript:void(0);" onclick="response_comment_format($('comment-({$item.number})-member').getAttribute('title'), '({$item.number})', 'comment_box');return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a>({/if})
</p>
</div>
<div class="body">
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
<ul class="photo">
({if $item.image_filename1})<li><a href="({t_img_url filename=$item.image_filename1})" target="_blank"><img src="({t_img_url filename=$item.image_filename1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename2})<li><a href="({t_img_url filename=$item.image_filename2})" target="_blank"><img src="({t_img_url filename=$item.image_filename2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename3})<li><a href="({t_img_url filename=$item.image_filename3})" target="_blank"><img src="({t_img_url filename=$item.image_filename3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'community':$item.c_member_id|t_cmd:'community'})</p>
</div>
({if $item.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div class="block attachFile"><ul>
<li><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">({$item.original_filename})</a></li>
</ul></div>
({/if})
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({/if})

({if $is_c_commu_member || ($c_commu.is_comment == 'public')})
({if $is_writable_comment})
({* {{{ formTable *})
<div class="dparts formTable" id="commentForm"><div class="parts">
<div class="partsHeading"><h3>新しく書き込む</h3></div>
({t_form_block _enctype=file m=pc a=page_c_topic_write_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<table>
<tr>
<th>本文</th>
<td><textarea name="body" id="comment_box" rows="10" cols="50">({$body})</textarea></td>
</tr>
<tr>
<th>写真1</th>
<td><input type="file" class="input_file" name="image_filename1" size="40" /></td>
</tr>
<tr>
<th>写真2</th>
<td><input type="file" class="input_file" name="image_filename2" size="40" /></td>
</tr>
<tr>
<th>写真3</th>
<td><input type="file" class="input_file" name="image_filename3" size="40" /></td>
</tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>ファイル</th>
<td>
<input type="file" class="input_file" name="uploadfile" size="40" />
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>コメントを書く</h3></div>
<div class="block">
<p>コメントが1000番に達したので、このトピックにはコメントできません。</p>
</div>
</div></div>
({* }}} *})
({/if})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]({$WORD_COMMUNITY})トップへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
