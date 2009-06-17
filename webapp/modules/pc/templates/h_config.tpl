<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>PCメールアドレス変更</h3></div>
({t_form_block m=pc a=do_h_config_1})
<table><tr>
<th>メールアドレス</th>
<td>
<input type="text" class="input_text" name="pc_address" value="" size="40" />
<p class="caution">
※メールアドレスは公開されません。
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne' && !$smarty.const.IS_SLAVEPNE_EMAIL_REGIST})
<br />※初期設定ではメールアドレスが登録されておりません。新着情報などご希望の際はこちらからご登録ください。
({/if})
</p>
</td>
</tr><tr>
<th>メールアドレス確認</th>
<td>
<input type="text" class="input_text" name="pc_address2" value="" size="40" />
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="メールアドレス変更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>パスワード変更</h3></div>
({t_form_block m=pc a=do_h_config_2})
<table><tr>
<th>現在のパスワード</th>
<td>
<input type="password" class="input_password" name="old_password" value="" size="20" />
</td>
</tr><tr>
<th>新しいパスワード</th>
<td>
<input type="password" class="input_password" name="new_password" value="" size="20" />
<p class="caution">※パスワードは6～12文字の半角英数で入力してください。</p>
</td>
</tr><tr>
<th>新しいパスワード確認</th>
<td>
<input type="password" class="input_password" name="new_password2" value="" size="20" />
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li>
<input type="submit" class="input_submit" value="パスワード変更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>設定変更</h3></div>
({t_form_block m=pc a=do_h_config_3})
<table>
({if $smarty.const.OPENPNE_ENABLE_KTAI})
<tr>
<th>携帯メールアドレス</th>
<td>
<a href="({t_url m=pc a=page_h_config_ktai})">携帯メールアドレス設定ページへ</a><br />
※携帯メールアドレスを登録すると、携帯から「({$smarty.const.SNS_NAME})」を利用することができます。
</td>
</tr>
({/if})
({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne' && $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<tr>
<th>秘密の質問</th>
<td>
<select name="c_password_query_id">
({foreach from=$password_query_list key=key item=item})
<option value="({$key})"({if $c_member.c_password_query_id==$key}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>
</td>
</tr>
<tr>
<th>秘密の質問の答え</th>
<td>
<input type="text" class="input_text" name="c_password_query_answer" value="" size="30" />
<p class="caution">※変更する場合のみ入力してください。</p>
</td>
</tr>
({/if})
<tr>
<th>BlogのURL</th>
<td>
<input type="text" class="input_text input_text_long" name="rss" value="({$c_member.rss})" size="60" />
<p>※外部に日記・Blogをお持ちの場合、URLをご記入ください。<br />例： http://blog.example.com/</p>
</td>
</tr>
({if !$is_unused_daily_news})
<tr>
<th>デイリー・ニュース</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_1" value="1"({if $c_member.is_receive_daily_news == 1}) checked="checked"({/if}) /><label for="is_receive_daily_news_1">毎日</label></li>
({if $daily_news_day_num})
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_2" value="2"({if $c_member.is_receive_daily_news == 2}) checked="checked"({/if}) /><label for="is_receive_daily_news_2">週({$daily_news_day_num})回 (({$daily_news_day_str}))</label></li>
({/if})
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_0" value="0"({if $c_member.is_receive_daily_news == 0}) checked="checked"({/if}) /><label for="is_receive_daily_news_0">受け取らない</label></li>
</ul>
<p>※({$SNS_NAME})の最新情報をお届けします。</p>
</td>
</tr>
({/if})
({if $smarty.const.DISPLAY_SCHEDULE_HOME})
<tr>
<th>週間カレンダー</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_0" value="0"({if $c_member.schedule_start_day == 0}) checked="checked"({/if}) /><label for="schedule_start_day_0">日曜始まり</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_1" value="1"({if $c_member.schedule_start_day == 1}) checked="checked"({/if}) /><label for="schedule_start_day_1">月曜始まり</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_2" value="2"({if $c_member.schedule_start_day == 2}) checked="checked"({/if}) /><label for="schedule_start_day_2">本日始まり</label></li>
</ul>
</td>
</tr>
({/if})
<tr>
<th>メール受信設定</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_1" value="1"({if $c_member.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_1">受け取る</label></li>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_0"value="0"({if !$c_member.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_0">受け取らない</label></li>
</ul>
<p>※新着メッセージの通知などを登録されているPCメールアドレスにお知らせします。<br />
({if $smarty.const.OPENPNE_ENABLE_KTAI })
※携帯へのメール受信設定は、携帯からログインして設定してください。
({/if})
</p>
</td>
</tr>
({if !$is_unused_ashiato})
<tr>
<th>あしあとお知らせメール</th>
<td>
<input type="text" class="input_text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" size="12" /> アクセス目にメールを受け取る
<p>※ここで指定したアクセス数に達したとき、お知らせメールが届きます。</p>
</td>
</tr>
({/if})
({if $smarty.const.OPENPNE_USE_POINT_RANK && !$is_unused_rank_up})
<tr>
<th>ランクアップメール</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_PC" id="send_rank_up_mail_pc_1" value="1"({if $C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_PC}) checked="checked"({/if}) /><label for="send_rank_up_mail_pc_1">受け取る</label></li>
<li><input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_PC" id="send_rank_up_mail_pc_0" value="0"({if !$C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_PC}) checked="checked"({/if}) /><label for="send_rank_up_mail_pc_0">受け取らない</label></li>
</ul>
<p>※ランク変更時に登録されているPCメールアドレスにお知らせします。<br />
({if $smarty.const.OPENPNE_ENABLE_KTAI })
※携帯へのメール受信設定は、携帯からログインして設定してください。
({/if})
</p>
</td>
</tr>
({/if})
<tr>
<th>({$WORD_DIARY})公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_public" value="public"({if $c_member.public_flag_diary == "public"}) checked="checked"({/if}) /><label for="public_flag_diary_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_friend" value="friend"({if $c_member.public_flag_diary == "friend"}) checked="checked"({/if}) /><label for="public_flag_diary_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_private" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if}) /><label for="public_flag_diary_private">公開しない</label></li>
</ul>
<p>※ここで指定した値が({$WORD_DIARY})作成画面であらかじめ選択されている値となります。<br />
※これまでに書かれた({$WORD_DIARY})の公開範囲は変更されません。</p>
</td>
</tr>
<tr>
<th>アクセスブロック</th>
<td>
<ul>
({foreach from=$c_member_id_block item=item})
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="({$item})" size="12" /></li>
({/foreach})
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="" size="12" /></li>
</ul>
<p>※特定のメンバーからのアクセスをブロックします。<br />
※相手トップページのURL末尾に表示されている数字がIDになります。<br />
例：(○の部分がID)<br />
({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=○</p>
</td>
</tr>
({if $smarty.const.USE_SHINOBIASHI == 1})
<tr>
<th>忍び足モード</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_0" value="0"({if $is_shinobiashi == 0}) checked="checked"({/if}) /><label for="is_shinobiashi_0">あしあとを残す</label></li>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_1" value="1"({if $is_shinobiashi == 1}) checked="checked"({/if}) /><label for="is_shinobiashi_1">あしあとを残さない</label></li>
</ul>
<p>※他人のページを見たときに、あしあとを残すかどうかを設定することができます。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="設定変更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME || $smarty.const.USE_BOOKMARK_FEED || $smarty.const.DISPLAY_SCHEDULE_HOME})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>マイホーム最新情報表示変更</h3></div>
({t_form_block m=pc a=do_h_member_config_update_display_home})
<table>
({if $smarty.const.DISPLAY_SCHEDULE_HOME})
<tr>
<th>週間スケジュール</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_SCHEDULE_HOME" id="is_display_schedule_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_SCHEDULE_HOME}) checked="checked"({/if}) /><label for="is_display_schedule_home_0">表示する</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_SCHEDULE_HOME" id="is_display_schedule_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_SCHEDULE_HOME}) checked="checked"({/if}) /><label for="is_display_schedule_home_1">表示しない</label></li>
</ul>
<p>※マイホームに週間スケジュールを表示します。</p>
</td>
</tr>
({/if})
({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<tr>
<th>全体の最新({$WORD_DIARY})</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if}) /><label for="is_display_newdiary_home_0">表示する</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if}) /><label for="is_display_newdiary_home_1">表示しない</label></li>
</ul>
<p>※マイホームに全体の最新({$WORD_DIARY})を表示します。</p>
</td>
</tr>
<tr>
<th>全体の最新({$WORD_COMMUNITY})書き込み</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if}) /><label for="is_display_newtopic_home_0">表示する</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if}) /><label for="is_display_newtopic_home_1">表示しない</label></li>
</ul>
<p>※マイホームに全体の最新({$WORD_COMMUNITY})書き込みを表示します。</p>
</td>
</tr>
({/if})
({if $smarty.const.USE_BOOKMARK_FEED})
<tr>
<th>お気に入り最新({$WORD_DIARY})</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_diary_home_0">表示する</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_diary_home_1">表示しない</label></li>
</ul>
<p>※マイホームにお気に入りの最新({$WORD_DIARY})を表示します。</p>
</td>
</tr>
<tr>
<th>お気に入り最新blog</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_blog_home_0">表示する</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_blog_home_1">表示しない</label></li>
</ul>
<p>※マイホームにお気に入りの最新blogを表示します。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="設定変更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})公開範囲の一括変更</h3></div>
({t_form_block m=pc a=page_h_set_public_flag_all_confirm})
<table><tr>
<th>({$WORD_DIARY})公開範囲</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_public" value="public" checked="checked" /><label for="public_flag_diary_all_public">全員に公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_friend" value="friend" /><label for="public_flag_diary_all_friend">({$WORD_MY_FRIEND})まで公開</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_private" value="private" /><label for="public_flag_diary_all_private">公開しない</label></li>
</ul>
<p>※これまでに書いた({$WORD_DIARY})の公開範囲を一括で変更することができます。</p>
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面へ" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $c_member.c_member_id == 1})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME})を退会する</h3></div>
<div class="block">
<p>ID 1 のメンバーはSNSを退会することができません。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME})を退会する</h3></div>
<div class="block">
({t_form_block m=pc a=page_h_taikai_confirm})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="退会確認ページへ" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
