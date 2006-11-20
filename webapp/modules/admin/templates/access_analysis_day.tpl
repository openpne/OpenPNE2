({$inc_header|smarty:nodefaults})

<b>({$item_str}) 日次集計</b>
<br>
({foreach from=$access_analysis_day item=item})

({$item.ymd|date_format:"%d日"})-->({$item.count}) &nbsp;&nbsp;
<a href="?m=admin&a=page_access_analysis_page&ymd=({$item.ymd})&month_flag=0&ktai_flag=({$ktai_flag})">ページ毎の詳細</a>
<br>

({/foreach})

({$inc_footer|smarty:nodefaults})
