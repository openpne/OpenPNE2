({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="世代別メンバー数表示"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>世代別メンバー数表示</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>SNSメンバーの世代別メンバー分布を表示します。</p>
<table class="basicType2">
({****})
<thead>
<tr>
<th>
年齢
</th>
<th>
人数
</th>
</tr>
</thead>
({****})
<tbody>
({****})
({foreach from=$analysis_generation key=key item=item})
<tr>
	<th>({$key})</th>
	<td>({$item})人</td>
</tr>
({/foreach})
</tbody>
<tfoot>
<tr>
	<th width="100">合計</th>
	<td>({$analysis_generation_sum})人</td>
</tr>
</tfoot>
</table>

<h3 class="item">ダウンロード</h3>
<p>CSV形式でダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_user_analysis_generation','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

({$inc_footer|smarty:nodefaults})
