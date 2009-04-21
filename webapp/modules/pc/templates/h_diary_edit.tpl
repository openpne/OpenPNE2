<div id="LayoutB">

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">

<div class="item calendar">
<div class="partsHeading"><h3>
({if $ym.prev_month})<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">&lt;&lt;</a>({/if})
({$date_val.month})月のカレンダー
({if $ym.next_month})<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$ym.next_year})&amp;month=({$ym.next_month})">&gt;&gt;</a>({/if})
</h3></div>
<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">月</th>
<th class="tue">火</th>
<th class="wed">水</th>
<th class="thu">木</th>
<th class="fri">金</th>
<th class="sat">土</th>
</tr>({foreach from=$calendar item=week})<tr>
({foreach from=$week item=item name="calendar_days"})
<td>({strip})
({if $item.day})
({if $item.is_diary})
<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>
</div>

<div class="item recentlyComment">
<div class="partsHeading"><h3>最近のコメント</h3></div>
<ul class="list">
<li><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})">一覧を見る</a></li>
</ul>
</div>

({if $date_list})
<div class="item monthlyDiary">
<div class="partsHeading"><h3>各月の({$WORD_DIARY})</h3></div>
<ul class="list">
({foreach from=$date_list item=item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$item.year})&amp;month=({$item.month})">({$item.year})年({$item.month})月の一覧</a></li>
({/foreach})
</ul>
</div>
({/if})

({if $category_list})
<div class="item listCategory">
<div class="partsHeading"><h3>カテゴリ一覧</h3></div>
<ul class="list">
({foreach from=$category_list item=category_item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_diary_category_id})">({$category_item.category_name})</a></li>
({/foreach})
</ul>
</div>
({/if})

</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})を編集する</h3></div>
({t_form_block _enctype=file m=pc a=page_h_diary_edit_confirm})
<input type="hidden" name="target_c_diary_id" value="({$diary.c_diary_id})" />
<input type="hidden" name="del_img" value="({$del_img})" />
<table>
<tr>
<th>タイトル</th>
<td>
<input type="text" class="input_text" name="subject" value="({$diary.subject})" size="40" />
</td>
</tr>
<tr>
<th>本文</th>
<td>
({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})</div>({/if})

({ext_include file="inc_tinymce_textarea.tpl" _name="body" _rows="15" _cols="50" _body=$diary.body|smarty:nodefaults})
</td>
</tr>
<tr>
<th>写真1</th>
<td>
({if $diary.image_filename_1 && !($del_img & 0x01)})
<p>
<input type="hidden" name="pre_image_filename_1" value="({$diary.image_filename_1})" />
<a href="({t_img_url filename=$diary.image_filename_1})" target="_blank"><img src="({t_img_url filename=$diary.image_filename_1 w=120 h=120})" alt="" /></a><br />
<a href="({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=1&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>写真2</th>
<td>
({if $diary.image_filename_2 && !($del_img & 0x02)})
<p>
<input type="hidden" name="pre_image_filename_2" value="({$diary.image_filename_2})" />
<a href="({t_img_url filename=$diary.image_filename_2})" target="_blank"><img src="({t_img_url filename=$diary.image_filename_2 w=120 h=120})" alt="" /></a><br />
<a href="({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=2&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="upfile_2" size="40" />
</td>
</tr>
<tr>
<th>写真3</th>
<td>
({if $diary.image_filename_3 && !($del_img & 0x04)})
<p>
<input type="hidden" name="pre_image_filename_3" value="({$diary.image_filename_3})" />
<a href="({t_img_url filename=$diary.image_filename_3})" target="_blank"><img src="({t_img_url filename=$diary.image_filename_3 w=120 h=120})" alt="" /></a><br />
<a href="({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=3&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="upfile_3" size="40" />
</td>
</tr>
({if $use_diary_category})
<tr>
<th>カテゴリ</th>
<td>
<input type="text" class="input_text" name="category" id="category" value="({foreach from=$category item=item})({$item.category_name}) ({/foreach})" size="40" />
<select onchange="if(selectedIndex){if(!category.value.match(/\s$/)){category.value += ' '}category.value += options[selectedIndex].value + ' ';}">
<option>カテゴリを選択してください</option>
({foreach from=$category_list item=value})
<option value="({$value.category_name})">({$value.category_name})</option>
({/foreach})
</select>
<p>※カテゴリはひとつにつき全角10文字（半角20文字）以内で入力してください。</p>
<p>※ひとつの({$WORD_DIARY})にカテゴリは5つまで同時に指定することができます。</p>
</td>
</tr>
({/if})
<tr>
<th>公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_public" value="public"({if $diary.public_flag == "public"}) checked="checked"({/if}) /><label for="public_flag_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_friend" value="friend"({if $diary.public_flag == "friend"}) checked="checked"({/if}) /><label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_private" value="private"({if $diary.public_flag == "private"}) checked="checked"({/if}) /><label for="public_flag_private">公開しない</label></li>
</ul>
</td>
</tr>
({if $smarty.const.OPENPNE_USE_DIARY_COMMENT})
<tr>
<th>コメント許可</th>
<td>
<input type="checkbox" class="input_checkbox" name="is_comment_input" id="is_comment_input" value="1"({if $diary.is_comment_input}) checked="checked"({/if}) /><label for="is_comment_input">許可する</label>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})を削除する</h3></div>
<div class="partsInfo">
<p>({$WORD_DIARY})を削除するとこの({$WORD_DIARY})に書かれたコメントもすべて削除されます。</p>
</div>
({t_form_block m=pc a=page_h_delete_diary})
<input type="hidden" name="target_c_diary_id" value="({$diary.c_diary_id})" />
<table>
<tr><th>日付</th><td>({$diary.r_datetime|date_format:"%Y年%m月%d日"})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutB -->
