({if $newlist})

<div class="parts bizSideScheduleList">
<div class="partsHeading"><h3>未読スケジュール</h3></div>
({foreach key=i item=value from=$newlist})
<dl>
<dt>({$value.begin_date|date_format:"%m月%d日"})</dt>
<dd><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$value.biz_schedule_id})&amp;target_id=({$target_id})">({$value.title})</a></dd>
</dl>
({/foreach})
</div>

({/if})
