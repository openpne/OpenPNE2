<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>一括メッセージを送る</h3></div>
<table>
<tr><th>送信先</th><td>
<div class="checkList">
({foreach from=$c_mail_member item=item})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
<li><div class="item">({$item.nickname})</div></li>
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td></tr>
<tr><th>メッセージ</th><td>({$body|nl2br|t_url2cmd:'message':$u|t_cmd:'message'})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_event_mail})
<input type="hidden" name="c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="hidden" name="c_member_ids" value="({$c_member_ids})" />
<input type="hidden" name="body" value="({$body})" />
({foreach from=$c_mail_member item=c_member})
<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})" />
({/foreach})
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_c_event_mail})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})">イベントページへ戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
