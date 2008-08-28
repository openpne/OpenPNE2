({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="アップロード画像リスト"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2 id="ttl01">アップロード画像リスト</h2>
<div class="contents">
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_image')})" />
<strong>表示件数</strong>：
<select class="basic" name="page_size">
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
<option value="500"({if $pager.page_size==500}) selected="selected"({/if})>500件</option>
</select>
<span class="textBtnS"><input type="submit" value="　変　更　"></span><span class="btnCaution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</span>
</p>
</form>


<div class="listControl" id="pager01">
<p class="display">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています</p>
({capture name="pager"})
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>({/if})
</p>
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
</div>({*/div class="listControl"*})



<div class="imageListTable">

({foreach name=c_image from=$c_image_list item=item})
<div class="cell">
<dl>
<dt class="day">({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})</dt>
<dd class="upImage"><a href="({t_img_url filename=$item.filename})" target="_blank"><img src="({t_img_url filename=$item.filename w=120 h=120})" /></a></dd>
<dd class="fileName">({$item.filename})</dd>
<dd class="delete">&nbsp;
({if strpos($item.filename, 'skin_') !== 0 && strpos($item.filename, 'no_') !== 0})
[&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_image_confirm')})&amp;target_c_image_id=({$item.c_image_id})">削除</a>&nbsp;]
({/if})
({if $item.param})
&nbsp;[<a href="({t_url _absolute=1 m=pc})({$item.param})" target="_blank">リンク</a>]
({/if})
&nbsp;</dd>
</dl>
</div>
({/foreach})

<br class="clear" />
</div>({*/div class="imageListTable"*})



<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
<p class="display">({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています</p>
</div>({*/div class="listControlBtm"*})
</div>({*/div class="contents"*})

<h2 id="ttl02">画像管理</h2>

<div class="contents">

<div class="otherControl">
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">画像のアップロードページへ</a></p>
</div>({*/div class="otherControl"*})
({$inc_footer|smarty:nodefaults})
