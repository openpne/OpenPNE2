<div id="LayoutC">
<div id="Center">

({if !$c_friend_list})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>イベントお知らせメッセージを送る</h3></div>
<div class="block">
<p>紹介できる({$WORD_MY_FRIEND})がいません。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>イベントお知らせメッセージを送る</h3></div>
<div class="partsInfo">
<p>このイベントを紹介したい({$WORD_MY_FRIEND})を一覧から選び、紹介メッセージを書いてください。</p>
</div>
({t_form_block m=pc a=do_c_event_invite})
<input type="hidden" name="c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<table>
<tr><th>紹介先</th><td>
<div class="checkList">
({foreach from=$c_friend_list item=item})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
<li><div class="item"><input type="checkbox" class="input_checkbox" id="m({$item.c_member_id})" name="c_member_id[]" value="({$item.c_member_id})" /><label for="m({$item.c_member_id})">({$item.nickname})</label></div></li>
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td></tr>
<tr><th>メッセージ (任意)</th><td><textarea name="body" rows="6" cols="50"></textarea></td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　信　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
