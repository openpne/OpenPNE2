({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="カテゴリ別画像容量表示"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>カテゴリ別画像容量表示</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<table class="basicType2">
<thead>
({****})
<tr>
<th>
カテゴリ
</th>
<th>
画像容量
</th>
<th>
平均容量(1人当り)
</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$analysis_image_category item=item})
<tr>
	<th>({$item.category})</th>
	<td>({$item.sum})MB</td>
	<td>({$item.avg})MB</td>
</tr>
({/foreach})
({****})
</tbody>
<tfoot>
({****})
<tr>
	<th width="100">({$analysis_image_category_sum.category})</th>
	<td>({$analysis_image_category_sum.sum})MB</td>
	<td>({$analysis_image_category_sum.avg})MB</td>
</tr>
({****})
</tfoot>
</table>

({$inc_footer|smarty:nodefaults})
