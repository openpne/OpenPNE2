<div id="LayoutC">
<div id="Center">

({if $c_invite_list})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})にこの({$WORD_COMMUNITY})を紹介する</h3></div>

<div class="partsInfo">
<p>この({$WORD_COMMUNITY})を紹介したい({$WORD_MY_FRIEND})を一覧から選び、紹介するメッセージを書いてください。<br />なお、({$WORD_COMMUNITY})管理者から紹介した場合には、承認制の({$WORD_COMMUNITY})にも承認無しで参加できます。</p>
</div>

({t_form_block m=pc a=do_c_invite_insert_c_message_commu_invite})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>({$WORD_COMMUNITY})名</th><td>({$c_commu.name})</td></tr>
<tr><th>紹介先</th><td>
<table><tr><td>
({foreach from=$c_invite_list item=c_invite})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<div class="checkList"><ul>({/if})
<li><div class="item"><input type="checkbox" class="input_checkbox" id="m({$c_invite.c_member_id})" name="c_member_id_list[]" value="({$c_invite.c_member_id})" alt="" /><label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label></div></li>
({if $_cnt % 3 == 0})</ul></div>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul></div>({/if})
</td></tr></table>
</td></tr>
<tr><th>メッセージ</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　信　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})にこの({$WORD_COMMUNITY})を紹介する</h3></div>
<div class="block">
<p>紹介できる({$WORD_MY_FRIEND})がいません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
