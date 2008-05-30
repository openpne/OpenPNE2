<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>アルバムを作成する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_album_add_confirm})
<table>
<tr>
<th>タイトル</th>
<td><input type="text" class="input_text" name="subject" value="({$form_val.subject})" size="50" /></td>
</tr>
<tr>
<th>説明文</th>
<td><textarea name="description" rows="6" cols="50">({$form_val.description})</textarea></td>
</tr>
<tr>
<th>表紙</th>
<td><input type="file" class="input_file" name="image_filename" size="40" /></td>
</tr>
<tr>
<th>公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_public" value="public"({if $form_val.public_flag == "public"}) checked="checked"({/if}) /><label for="public_flag_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_friend" value="friend"({if $form_val.public_flag == "friend"}) checked="checked"({/if}) /><label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_private" value="private"({if $form_val.public_flag == "private"}) checked="checked"({/if}) /><label for="public_flag_private">公開しない</label></li>
</ul>
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
