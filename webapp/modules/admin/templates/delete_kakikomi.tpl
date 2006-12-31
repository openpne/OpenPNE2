({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="投稿記事削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">投稿記事削除</h2>
<div class="contents">
<p class="info">URL内のIDを指定し確認後、削除することが出来ます。</p>
<p class="sampleID">※それぞれURL例の<strong>***</strong>（数字）部分がIDです</p>



({* 日記 *})
<div class="deleteKakikomiDiary">

<h3>【日記】</h3>
<dl class="sampleID">
<dt>URL例：</dt>
<dd>({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=<strong>***</strong></dd>
</dl>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})" />
<strong class="item">ID</strong>： <input class="basic" type="text" name="target_c_diary_id" value="({$requests.target_c_diary_id})" size="6" />
<span class="textBtnS"><input type="submit" value="確認" /></span>
</p>
</form>
({if $c_diary})
<table class="diaryDetailTable">
	<tr>
		<th>タイトル</th>
		<td>({$c_diary.subject})　（<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary.c_diary_id})" target="_blank">この記事を開く</a>）</td>
	</tr>
	<tr>
		<th>本文</th>
		<td>({$c_diary.body|t_url2a|nl2br})</td>
	</tr>
</table>
<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_diary','do')})" />
<input type="hidden" name="target_c_diary_id" value="({$c_diary.c_diary_id})" />
<p class="textBtn"><input type="submit" value="この記事を削除する" /></p>
</form>
({/if})

</div>({*/div class="deleteKakikomiDiary"*})

({* コミュニティ *})
<div class="deleteKakikomiCommu">

<h3>【コミュニティ】</h3>
<dl class="sampleID">
<dt>URL例：</dt>
<dd>({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=<strong>***</strong></dd>
</dl>
<form action="./" method="get">
<p>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})" />
<strong class="item">ID</strong>： <input class="basic" type="text" name="target_c_commu_id" value="({$requests.target_c_commu_id})" size="6" />
<span class="textBtnS"><input type="submit" value="確認" /></span>
</p>
</form>
({if $c_commu})
<table class="diaryDetailTable">
	<tr>
		<th>コミュニティ名</th>
		<td>({$c_commu.name})　（<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})" target="_blank">このコミュニティを開く</a>）</td>
	</tr>
	<tr>
		<th>説明</th>
		<td>({$c_commu.info|t_url2a|nl2br})</td>
	</tr>
</table>
<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu','do')})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<p class="textBtn"><input type="submit" value="このコミュニティを削除する" /></p>
</form>
({/if})

</div>({*/div class="deleteKakikomiCommu"*})


({* コミュニティトピック *})
<div class="deleteKakikomiCommuTopic">

<h3>【コミュニティトピック・イベント】</h3>
<dl class="sampleID">
<dt>URL例：</dt>
<dd>({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=<strong>***</strong></dd>
<dd>({t_url _absolute=1 m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=<strong>***</strong></dd>
</dl>
<form action="./" method="post">
<p>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_kakikomi')})" />
<strong class="item">ID</strong>： <input class="basic" type="text" name="target_c_commu_topic_id" value="({$requests.target_c_commu_topic_id})" size="6" />
<span class="textBtnS"><input type="submit" value="確認" /></span>
</p>
</form>
({if $c_commu_topic})
<table class="diaryDetailTable">
	<tr>
		<th>トピック(イベント)名</th>
		<td>({$c_commu_topic.name})　（<a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})" target="_blank">このトピック(イベント)を開く</a>）</td>
	</tr>
	<tr>
		<th>本文</th>
		<td>({$c_commu_topic.body|t_url2a|nl2br})</td>
	</tr>
</table>
<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu_topic','do')})" />
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic.c_commu_topic_id})" />
<p class="textBtn"><input type="submit" value="このトピック(イベント)を削除する" /></p>
</form>
({/if})

</div>({*/div class="deleteKakikomiCommuTopic"*})

({$inc_footer|smarty:nodefaults})
