({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="？？？"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2></h2>
<div class="contents">

({$inc_user_analysis_navi|smarty:nodefaults})

<p>({$profile_caption})</p>

<table class="basicType2">
({foreach from=$analysis_profile item=item})
<tr>
	<td width="100">({$item.value})</td>
	<td>({$item.count})人</td>
</tr>
({/foreach})
<tr>
	<td width="100">合計</td>
	<td>({$count_profile_all})人</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})
