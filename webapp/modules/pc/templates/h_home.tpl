<div id="LayoutA">
<div id="Top">

({if $smarty.const.DISPLAY_SEARCH_HOME})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block m=pc a=do_h_home_search})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="q" value="" size="30" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_1})" value="diary" alt="({$WORD_DIARY})" name="diary" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_2})" value="community" alt="({$WORD_COMMUNITY})" name="community" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_4})" value="message" alt="メッセージ" name="message" /></li>
({if $smarty.const.USE_EXTRA_SERVICE})
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_3})" value="web" alt="web" name="web" /></li>
({/if})
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

({if $birthday_flag})
<div class="parts homeBirthdayBox">
<img src="({t_img_url_skin filename=birthday_h})" alt="Happy Birthday!" />
</div>
({/if})

({* {{{ homeInfoBox *})
<div class="parts homeInfoBox">
<div class="body">
({$site_info|smarty:nodefaults|default:"&nbsp;"|t_url2cmd:'info'|t_cmd:'info'})
({if $num_f_confirm_list || $num_message_not_is_read || $num_diary_not_is_read || $num_h_confirm_list || $anatani_c_commu_admin_confirm_list || $anatani_c_commu_sub_admin_confirm_list})
<ul>
({if $num_f_confirm_list})
<li>★<span class="caution">承認待ちのメンバーが({$num_f_confirm_list})名います！</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $num_message_not_is_read})
<li>★<span class="caution">新着メッセージが({$num_message_not_is_read})件あります！</span> <a href="({t_url m=pc a=page_h_message_box})"><strong>メッセージを読む</strong></a></li>
({/if})
({if $num_diary_not_is_read})
<li>★<span class="caution">({$num_diary_not_is_read})件の({$WORD_DIARY})に対して新着コメントがあります！</span> <a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})"><strong>({$WORD_DIARY})を見る</strong></a></li>
({/if})
({if $num_h_confirm_list})
<li>★<span class="caution">({$WORD_COMMUNITY})参加承認待ちのメンバーが({$num_h_confirm_list})名います！</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<li>★<span class="caution">({$WORD_COMMUNITY})管理者交代依頼が({$num_anatani_c_commu_admin_confirm_list})件きています。</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $anatani_c_commu_sub_admin_confirm_list})
<li>★<span class="caution">({$WORD_COMMUNITY})副管理者依頼が({$num_anatani_c_commu_sub_admin_confirm_list})件きています。</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
</ul>
({/if})
</div>
</div>
({* }}} *})

({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Top -->
<div id="Left">

({if $inc_entry_point[4]})({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homePhotoBox *})
<div class="dparts homePhotoBox">
<div class="parts">
<p class="photo"><img src="({t_img_url filename=$c_member.image_filename w=180 h=180 noimg=no_image})" alt="プロフィール写真" /></p>
<ul class="moreInfo button">
<li><a href="({t_url m=pc a=page_h_config_image})"><img src="({t_img_url_skin filename=button_edit_photo})" alt="写真を編集" /></a></li>
<li><a href="({t_url m=pc a=page_h_prof})"><img src="({t_img_url_skin filename=button_prof_conf})" alt="プロフィール確認" /></a></li>
</ul>
</div>
({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $c_member.c_member_id != 1})
({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<p class="rank"><img src="({t_img_url filename=$rank.image_filename})" alt="({$rank.name})" /></p>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
<p class="point">({$point}) Point</p>
({/if})
({/if})
({/if})
<p class="text">({$c_member.nickname})さん (({$c_friend_count}))</p>
</div>
({* }}} *})

({if $inc_entry_point[5]})({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_friend_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})リスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_friend_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '({$flashvars})');
//]]>
</script>
({else})
<table>
({if $c_friend_list[0]})
<tr class="photo">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[3]})
<tr class="photo">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[6]})
<tr class="photo">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_friend_list})">全てを見る(({$c_friend_count})人)</a></li>
<li><a href="({t_url m=pc a=page_h_manage_friend})">({$WORD_MY_FRIEND})管理</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[6]})({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_commu_user_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})リスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_commu_user_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_commu_id})
&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_c_home _urlencode=true _html=false})%26target_c_commu_id=({$item.c_commu_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.count_commu_members})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '({$flashvars})');
//]]>
</script>
({else})
<table>
({if $c_commu_user_list[0]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=0 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_user_list[3]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=3 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_user_list[6]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=6 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_com_list})">全てを見る(({$fh_com_count_user}))</a></li>
<li><a href="({t_url m=pc a=page_h_manage_commu})">({$WORD_COMMUNITY})管理</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $bookmark_member_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>お気に入りリスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$bookmark_member_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '({$flashvars})');
//]]>
</script>
({else})
<table>
({if $bookmark_member_list[0]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $bookmark_member_list[3]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $bookmark_member_list[6]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_list})">全てを見る(({$bookmark_count}))</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[7]})({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $smarty.const.OPENPNE_ALBUM_LIMIT || $smarty.const.OPENPNE_IMAGE_USER_LIMIT || $smarty.const.OPENPNE_IMAGE_DIARY_LIMIT || $smarty.const.OPENPNE_IMAGE_COMMU_LIMIT})
<div class="partsHeading"><h3>写真容量 使用状況</h3></div>
<div class="parts">
<table>
<tr bgcolor="#cccccc">
<td>種別</td>
<td>制限容量(MB)</td>
<td>使用量(MB)</td>
</tr>
({foreach from=$image_limit_list item=item})
<tr>
<td>({$item.title})</td>
<td style="text-align:right;">({$item.limit_size})</td>
<td style="text-align:right;">({$item.used_size})</td>
</tr>
({/foreach})
</table>
</div>
({/if})

</div><!-- Left -->
<div id="Center">

({if $inc_entry_point[8]})({$inc_entry_point[8]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $calendar})
({* {{{ weeklyCalendarTable *})
<div class="dparts weeklyCalendarTable"><div class="parts">
<div class="block">
({t_form_block m=pc a=do_h_home_insert_c_schedule})
<input type="hidden" name="w" value="({$w})" />
<label for="title">予定</label> <input type="text" class="input_text" name="title" id="title" value="" size="24" />
<select name="start_date">
({foreach from=$calendar item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="input_submit" value="　追　加　" />
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w-1})" title="前の週">&lt;&lt;</a>
<a href="({t_url m=pc a=page_h_home})" title="今週">■</a>
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w+1})" title="次の週">&gt;&gt;</a>
({/t_form_block})
</div>

<table class="calendar">
<tr>
({foreach from=$calendar item=item name=calendar})
({strip})
<td({if $item.now}) class="today"({/if})>
<p class="day({if $item.dayofweek == "日"}) sun({elseif $item.dayofweek == "土"}) sat({/if})({if $item.holiday}) holiday({/if})">
({if $smarty.foreach.calendar.first || $item.day == 1})({$item.month})/({/if})({$item.day})<br />
(({$item.dayofweek}))
({foreach from=$item.holiday item=item_holiday})
<br />({$item_holiday})
({/foreach})
</p>
({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
({if $item_birth.public_flag_birth_month_day != "private" || $c_member.c_member_id == $item_birth.c_member_id})
<p><img src="({t_img_url_skin filename=icon_birthday})" alt="誕生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a></p>
({/if})
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<p><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="イベント" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a></p>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
<p><img src="({t_img_url_skin filename=icon_pen})" alt="予定" /><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a></p>
({/foreach})
</td>
({/strip})
({/foreach})
</tr>
</table>

<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_calendar})">月別カレンダー</a></li>
<li><a href="({t_url m=pc a=page_h_config})#is_display_schedule_home_0">表示設定変更</a></li>
</ul>
</div>

</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[9]})({$inc_entry_point[9]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_diary_friend_list || $c_rss_cache_list || $c_diary_my_comment_list || $c_commu_topic_comment_list || $c_friend_review_list || $c_friend_album_list})
({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>最新情報</h3></div>
<table>
({if $c_diary_friend_list})
<tr class="myFriendRecentDiary"><th>({$WORD_MY_FRIEND})<br />最新({$WORD_DIARY})</th><td>
<ul class="articleList">
({foreach from=$c_diary_friend_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|t_truncate:30}) (({$item.count_comments|default:0}))</a> (({$item.nickname|default:"&nbsp;"})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_list_friend})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_rss_cache_list})
<tr class="myFriendRecentBlog"><th>({$WORD_MY_FRIEND})<br />最新Blog</th><td>
<ul class="articleList">
({foreach from=$c_rss_cache_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a> (({$item.c_member.nickname}))</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_list_friend})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_diary_my_comment_list})
<tr class="diaryCommentHistory"><th>({$WORD_DIARY})コメント<br />記入履歴</th><td>
<ul class="articleList">
({foreach from=$c_diary_my_comment_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">({$item.subject|t_truncate:30}) (({$item.num_comment}))</a> (({$item.nickname})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_comment_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_commu_topic_comment_list})
<tr class="recentCommunityTopicComment"><th>({$WORD_COMMUNITY})<br />最新書き込み</th><td>
<ul class="articleList">
({foreach from=$c_commu_topic_comment_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.number})">({$item.c_commu_topic_name|t_truncate:30}) (({$item.number}))</a> (({$item.c_commu_name})) ({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_com_comment_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_friend_review_list})
<tr class="myFriendRecentReview"><th>({$WORD_MY_FRIEND})<br />最新レビュー</th><td>
<ul class="articleList">
({foreach from=$c_friend_review_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a> (({$item.nickname}))</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_friend_review_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_friend_album_list})
<tr class="myFriendRecentAlbum"><th>({$WORD_MY_FRIEND})<br />最新アルバム</th><td>
<ul class="articleList">
({foreach from=$c_friend_album_list item=item})
<li><span class="date">({$item.u_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject|t_truncate:30})</a> (({$item.nickname}))</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_album_list_friend})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})
({/if})

({if $c_diary_list_all || $c_topic_list_all})
({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>全体の最新情報</h3><p class="link"><a href="({t_url m=pc a=page_h_config})#is_display_newdiary_home_0">表示設定変更</a></p></div>
<table>
({if $c_diary_list_all})
<tr class="allRecentDiary"><th>最新({$WORD_DIARY})</th><td>
<ul class="articleList">
({foreach from=$c_diary_list_all item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|t_truncate:30}) (({$item.count_comments|default:0}))</a> (({$item.nickname|default:"&nbsp;"})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_list_all})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_topic_list_all})
<tr class="allRecentCommunityTopicComment"><th>({$WORD_COMMUNITY})<br />最新書き込み</th><td>
<ul class="articleList">
({foreach from=$c_topic_list_all item=item})
<li><span class="date">({$item.u_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.number})">({$item.name|t_truncate:30}) (({$item.number}))</a> (({$item.c_commu_name})) ({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_com_topic_find_all})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})
({/if})

({if $bookmark_diary_list || $bookmark_blog_list})
({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>お気に入りの最新情報</h3><p class="link"><a href="({t_url m=pc a=page_h_config})#is_display_bookmark_diary_home_0">表示設定変更</a></p></div>
<table>
({if $bookmark_diary_list})
<tr class="bookmarkRecentDiary"><th>お気に入り<br />最新({$WORD_DIARY})</th><td>
<ul class="articleList">
({foreach from=$bookmark_diary_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|t_truncate:30}) (({$item.count_comments}))</a> (({$item.nickname})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $bookmark_blog_list})
<tr class="bookmarkRecentBlog"><th>お気に入り<br />最新Blog</th><td>
<ul class="articleList">
({foreach from=$bookmark_blog_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a> (({$item.nickname}))</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[10]})({$inc_entry_point[10]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>({$c_member.nickname})さんの最新情報</h3></div>
<table>
({if $c_diary_list})
<tr class="myRecentDiary"><th>最新({$WORD_DIARY})</th><td>
<ul class="articleList">
({foreach from=$c_diary_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.comment_count})">({$item.subject|t_truncate:30}) (({$item.comment_count}))</a> ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_h_diary_add})">({$WORD_DIARY})を書く</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_blog_list})
<tr class="myRecentBlog"><th>最新Blog</th><td>
<ul class="articleList">
({foreach from=$c_blog_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_review_list})
<tr class="myRecentReview"><th>最新レビュー</th><td>
<ul class="articleList">
({foreach from=$c_review_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_review_list_member})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_h_review_add})">レビューを書く</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_album_list})
<tr class="myRecentAlbum"><th>最新アルバム</th><td>
<ul class="articleList">
({foreach from=$c_album_list item=item})
<li><span class="date">({$item.u_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_album_list})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_h_album_add})">アルバムを追加</a></li>
</ul></div>
</td></tr>
({/if})
({if !$c_diary_list || !$c_review_list || (!$c_album_list && $smarty.const.OPENPNE_USE_ALBUM)})
<tr><td class="halfway" colspan="2"><ul class="moreInfo">
({if !$c_diary_list})<li><a href="({t_url m=pc a=page_h_diary_add})">({$WORD_DIARY})を書く</a></li>({/if})
({if !$c_review_list})<li><a href="({t_url m=pc a=page_h_review_add})">レビューを書く</a></li>({/if})
({if !$c_album_list && $smarty.const.OPENPNE_USE_ALBUM})<li><a href="({t_url m=pc a=page_h_album_add})">アルバムを追加</a></li>({/if})
</ul>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})

({if $inc_entry_point[11]})({$inc_entry_point[11]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_friend_intro_list})
({* {{{ friendIntroList *})
<div class="dparts friendIntroList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})からの紹介文</h3></div>
<table>
({foreach from=$c_friend_intro_list item=item})
<tr>
<th><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /><br />({$item.nickname})</a></th>
<td>({$item.intro|t_truncate:36:"":3})</td>
</tr>
({/foreach})
</table>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_intro})">全て見る</a></li>
<li><a href="({t_url m=pc a=page_h_manage_friend})">紹介文を書く</a></li>
</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[12]})({$inc_entry_point[12]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Center -->
</div><!-- LayoutA -->
