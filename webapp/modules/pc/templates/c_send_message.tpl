<div id="LayoutC">
<div id="Center">

({if $c_commu.member_count!=1})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})参加者全員にメッセージを送る</h3></div>

({t_form_block m=pc a=do_c_send_message})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />

<div class="partsInfo">
<p>({$WORD_COMMUNITY})参加者にメッセージを送信します。<br />※管理者からのメッセージ受信設定を「受け取らない」にしているメンバーには届きませんので注意してください。</p>
</div>

<table>
<tr><th>({$WORD_COMMUNITY})名</th><td>({$c_commu.name})</td></tr>
<tr><th>タイトル</th><td><input type="text" class="text" name="subject" size="50" /></td></tr>
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
<div class="partsHeading"><h3>({$WORD_COMMUNITY})参加者全員にメッセージを送る</h3></div>
<div class="block">
<p>メッセージを送信するメンバーがいません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
