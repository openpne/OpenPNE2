<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>お気に入りに以下のメンバーを追加しますか？</h3></div>

<table>
<tr><th>写真</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})"><img src="({t_img_url filename=$c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>({$WORD_NICKNAME})</th><td>({$c_member.nickname})</td>
</tr><tr>
<th>自己紹介</th><td>({$c_member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr>
<th>最終ログイン</th><td>({$c_member.last_login})</td>
</tr></table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_f_bookmark_add})
<input type="hidden" name="c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_f_home})
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
