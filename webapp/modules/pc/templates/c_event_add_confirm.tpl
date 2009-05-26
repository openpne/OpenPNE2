<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>イベントを作成する</h3></div>
<div class="partsInfo">
<p>以下の内容で作成します。よろしいですか？</p>
</div>
<table>
<tr><th>タイトル</th><td>({$event.title})</td></tr>
<tr><th>開催日時</th><td>({$event.open_date_year})年({$event.open_date_month})月({$event.open_date_day})日 ({$event.open_date_comment})</td></tr>
<tr><th>開催場所</th><td>({$event.open_pref_value}) ({$event.open_pref_comment})</td></tr>
<tr><th>詳細</th><td>({$event.detail|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
<tr><th>募集期限</th><td>
({if $event.invite_period_year&&$event.invite_period_month&&$event.invite_period_day})
({$event.invite_period_year})年({$event.invite_period_month})月({$event.invite_period_day})日
({/if})
</td></tr>
<tr><th>募集人数</th><td>({if $event.capacity})({$event.capacity})人({else})無制限({/if})</td></tr>
({if $event.image_filename1})
<tr><th>写真1</th><td>({$event.image_filename1})</td></tr>
({/if})
({if $event.image_filename2})
<tr><th>写真2</th><td>({$event.image_filename2})</td></tr>
({/if})
({if $event.image_filename3})
<tr><th>写真3</th><td>({$event.image_filename3})</td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $event.filename4_original_filename})
<tr><th>ファイル</th><td>({$event.filename4_original_filename})</td></tr>
({/if})
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_event_add_insert_c_commu_topic})
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　作　成　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_c_event_add})
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
