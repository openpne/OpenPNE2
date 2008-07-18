<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下のメッセージを送信しますか？</h3></div>

<div class="partsInfo">
<p>
({$target_member.nickname}) さんとは既にお知り合いですか？<br />
({$WORD_MY_FRIEND})リンク申請メッセージを送信し、承諾を受けてください。<br />
※交流の無い方へいきなりリンク申請を送るのは、失礼になる場合もあります。十分に確認して、リンク申請をおこなってください。
</p>
</div>

<table>
<tr><th>写真</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>送信先</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a></td></tr>
<tr><th>メッセージ (任意)</th><td>({$form.body|nl2br})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_f_link_request_insert_c_friend_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_f_link_request})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
