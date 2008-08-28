<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>アルバムを作成する</h3></div>
<div class="partsInfo">
<p>以下の内容でよろしいですか？</p>
</div>
<table>
<tr>
<th>タイトル</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>説明文</th>
<td>({$form_val.description|nl2br|t_url2a})</td>
</tr>
<tr>
<th>表紙</th>
<td>({$form_val.image_filename})</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
({if $form_val.public_flag == "public"})
全員に公開
({elseif $form_val.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $form_val.public_flag == "private"})
公開しない
({/if})
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_add_insert_c_album})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　作　成　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_add})
({foreach from=$form_val key=key item=item})
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
