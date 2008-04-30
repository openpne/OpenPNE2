<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})に追加</h3></div>
<div class="partsInfo">
<p>
({$target_member.nickname}) さんとは既にお知り合いですか？<br />
({$WORD_MY_FRIEND})リンク申請メッセージを送信し、承諾を受けてください。<br />
※交流の無い方へいきなりリンク申請を送るのは、失礼になる場合もあります。十分に確認して、リンク申請をおこなってください。
</p>
</div>
({t_form_block m=pc a=page_f_link_request_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<table>
<tr>
<th>写真</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
</td>
</tr>
<tr>
<th>({$WORD_NICKNAME})</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a>
</td>
</tr>
<tr>
<th>メッセージ (任意)</th>
<td>
<textarea name="body" rows="5" cols="50">({$form.body})</textarea>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
