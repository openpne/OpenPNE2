<div id="LayoutA">
<div id="Top">

({ext_include file="inc_c_com_topic_find.tpl"})

({if !$is_c_commu_member})
({* {{{ infoBox *})
<div class="dparts infoBox"><div class="parts">
<p>この({$WORD_COMMUNITY})に参加しますか？</p>
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_join_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})">({$WORD_COMMUNITY})に参加する</a></li>
</ul>
</div></div>
({* }}} *})
({/if})

</div><!-- Top -->
<div id="Left">

({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homePhotoBox *})
<div class="dparts homePhotoBox">
<div class="parts">
<p class="photo"><img src="({t_img_url filename=$c_commu.image_filename w=180 h=180 noimg=no_logo})" class="pict" alt="({$WORD_COMMUNITY})写真" /></p>
</div>
<p class="text">({$c_commu.name})</p>
</div>
({* }}} *})

({if $inc_entry_point[4]})({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})メンバー</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_commu_member_list item=item key=key})
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
({if $c_commu_member_list[0]})
<tr class="photo">
({t_loop from=$c_commu_member_list start=0 num=3})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_member_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count|default:"0"}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_member_list[3]})
<tr class="photo">
({t_loop from=$c_commu_member_list start=3 num=3})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_member_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count|default:"0"}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_member_list[6]})
<tr class="photo">
({t_loop from=$c_commu_member_list start=6 num=3})
<td>({if $item})({if $item.c_member_id == $c_commu.c_member_id_admin})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_member_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count|default:"0"}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">全てを見る(({$c_commu.member_count})人)</a></li>
({if $is_c_commu_admin && $c_commu.member_count > 1})
<li><a href="({t_url m=pc a=page_c_send_message})&amp;target_c_commu_id=({$c_commu.c_commu_id})">参加者にメッセージを送る</a></li>
<li><a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})">メンバー管理</a></li>
({/if})
</ul>
</div>
</div>
({* }}} *})

({if $inc_entry_point[5]})({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Left -->
<div id="Center">

({if $inc_entry_point[6]})({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})</h3></div>
<table>
<tr><th>({$WORD_COMMUNITY})名</th><td>({$c_commu.name})</td></tr>
<tr><th>開設日</th><td>({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})</td></tr>
<tr><th>管理者</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})">({$c_commu.c_member_admin.nickname})</a></td></tr>
({if $sub_admin})
<tr><th>副管理者</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$sub_admin.c_member_id})">({$sub_admin.nickname})</a></td></tr>
({/if})
<tr><th>カテゴリ</th><td>({$c_commu.c_commu_category.name})</td></tr>
<tr><th>メンバー数</th><td>({$c_commu.member_count|default:"0"})人</td></tr>
<tr><th>参加条件</th><td>
({if $c_commu.is_admit == 'public'})
誰でも参加可能
({elseif $c_commu.is_admit == 'auth'})
管理者の承認が必要
({/if})
</td></tr>
<tr><th>公開範囲</th><td>
({if $c_commu.is_open == 'public'})
全員に公開
({elseif $c_commu.is_open == 'member'})
({$WORD_COMMUNITY})参加者にのみ公開
({/if})
</td></tr>
<tr><th>トピック作成</th><td>
({if $c_commu.is_topic == 'member'})
参加者のみ作成可能
({elseif $c_commu.is_topic == 'admin_only'})
管理者のみ作成可能
({elseif $c_commu.is_topic == 'public'})
誰でも作成可能
({/if})
</td></tr>
<tr><th>コメント作成</th><td>
({if $c_commu.is_comment == 'member'})
参加者のみ作成可能
({elseif $c_commu.is_comment == 'public'})
誰でも作成可能
({/if})
</td></tr>
<tr><th>({$WORD_COMMUNITY})<br />説明文</th><td>({$c_commu.info|nl2br|t_url2cmd:'community':$c_commu.c_member_id_admin|t_cmd:'community'})</td></tr>
({if $is_c_commu_member || $c_commu.is_open != "member"})
({if $new_topic_comment})
<tr class="communityTopic"><th>({$WORD_COMMUNITY})<br />掲示板</th><td>
<ul class="articleList">
({foreach from=$new_topic_comment item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">({$item.name|t_truncate:30})(({$item.count_comments}))</a>({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3}) <img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a></li>
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
<li><a href="({t_url m=pc a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">トピックを作成</a></li>
({/if})
</ul></div>
</td></tr>
({/if})
({if $new_topic_comment_event})
<tr class="communityEvent"><th>新着の<br />イベント<br />書き込み</th><td>
<ul class="articleList">
({foreach from=$new_topic_comment_event item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">({$item.name|t_truncate:30})(({$item.count_comments}))</a>({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3}) <img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a></li>
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
<li><a href="({t_url m=pc a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">イベントを作成</a></li>
({/if})
</ul></div>
</td></tr>
({/if})
({if $new_commu_review})
<tr class="communityReview"><th>新着の<br />おすすめ<br />レビュー</th><td>
<ul class="articleList">
({foreach from=$new_commu_review item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">レビューを掲載</a></li>
</ul></div>
</td></tr>
({/if})
({/if})
({if ($is_c_commu_member && (!$new_topic_comment || !$new_topic_comment_event || $is_c_commu_admin)) || ($c_commu.is_topic == 'public')})
<tr><td class="halfway" colspan="2"><ul class="moreInfo">
({if $is_c_commu_member || $c_commu.is_open != "member"})
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
({if !$new_topic_comment})
<li><a href="({t_url m=pc a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">トピックを作成</a></li>
({/if})
({if !$new_topic_comment_event})
<li><a href="({t_url m=pc a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})">イベントを作成</a></li>
({/if})
({/if})
({/if})
({if $is_c_commu_admin})
<li><a href="({t_url m=pc a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})">({$WORD_COMMUNITY})設定変更</a></li>
({/if})
</ul></td></tr>
({/if})
</table>
({if $is_c_commu_member && !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
({t_form_block m=pc a=do_c_home_update_is_receive_mail})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
({if !$is_c_commu_admin})
<tr><th>管理者からの<br />メッセージを</th><td>
<ul class="check">
<li><input type="radio" class="input_radio" value="1" id="is_receive_message_1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if}) /><label for="is_receive_message_1">受け取る</label></li>
<li><input type="radio" class="input_radio" value="0" id="is_receive_message_0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if}) /><label for="is_receive_message_0">受け取らない</label></li>
</ul>
</td></tr>
({/if})
({if $smarty.const.OPENPNE_ENABLE_KTAI && !$is_unused_ktai_bbs && $is_registered_ktai_address})
<tr><th>({$WORD_COMMUNITY})<br />書き込みを<br />携帯メールで</th><td>
<ul class="check">
<li><input type="radio" class="input_radio" value="1" id="is_receive_mail_1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_1">受け取る</label></li>
<li><input type="radio" class="input_radio" value="0" id="is_receive_mail_0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_0">受け取らない</label></li>
</ul>
</td></tr>
({/if})
({if !$is_unused_pc_bbs})
<tr><th>({$WORD_COMMUNITY})<br />書き込みを<br />PCメールで</th><td>
<ul class="check">
<li><input type="radio" class="input_radio" value="1" id="is_receive_mail_pc_1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if}) /><label for="is_receive_mail_pc_1">受け取る</label></li>
<li><input type="radio" class="input_radio" value="0" id="is_receive_mail_pc_0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if}) /><label for="is_receive_mail_pc_0">受け取らない</label></li>
</ul>
</td></tr>
({/if})
<tr><th></th><td>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="メール受信設定変更" /></li>
</ul>
</td></tr>
</table>
({/t_form_block})
({/if})
</div></div>
({* }}} *})

({if $inc_entry_point[7]})({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Center -->
</div><!-- LayoutA -->
