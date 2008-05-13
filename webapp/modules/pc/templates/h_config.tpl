({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- **************************** -->
<!-- ******ここから：設定変更****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：設定変更＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:458px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">設定変更</span></td>
<td style="width:140px;padding:2px 10px;" align="right" class="bg_06">&nbsp;
({if $SSL_SELECT_URL})
<a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({/if})
</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({t_form m=pc a=do_h_config_1})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:130px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">

メールアドレス

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:501px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="text" name="pc_address" value="" size="40"><br>
<span class="caution">※メールアドレスは公開されません。</span>

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

メールアドレス確認

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="text" name="pc_address2" value="" size="40">

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<input type="submit" class="submit" value="　変　更　">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</form>
({*********})
({if !$smarty.const.IS_SLAVEPNE})
({t_form m=pc a=do_h_config_2})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

現在のパスワード

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input class="text" name="old_password" type="password" value="" size="20">

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

新しいパスワード

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input class="text" name="new_password" type="password" value="" size="20"><br>
<span class="caution">※パスワードは6～12文字の半角英数で入力してください。</span>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

新しいパスワード確認

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input class="text" name="new_password2" type="password" value="" size="20">

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<input type="submit" class="submit" value="　変　更　">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</form>
({*********})
({/if})
({t_form m=pc a=do_h_config_3})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

({if $smarty.const.OPENPNE_ENABLE_KTAI})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

携帯メールアドレス

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<a href="({t_url m=pc a=page_h_config_ktai})">携帯メールアドレス設定ページへ</a><br>
※携帯メールアドレスを登録すると、携帯から「({$smarty.const.SNS_NAME})」を利用することができます。

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})

({if !$smarty.const.IS_SLAVEPNE})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div style="padding:3px;">

秘密の質問

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:3px;">

<select name="c_password_query_id">
({foreach from=$password_query_list key=key item=item})
<option value="({$key})"({if $c_member.c_password_query_id==$key}) selected="selected"({/if})>({$item})
({/foreach})
</select>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})

<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div style="padding:3px;">

秘密の質問の答え</font>({* <span class="b_b c_02">*</span> *})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:3px;">

<input class="text" name="c_password_query_answer" type="text" value="" size="20">

<br>
※変更する場合のみ入力してください。

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/if})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

BlogのURL

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="text" name="rss" value="({$c_member.rss})" size="60"><br>

※外部に日記・Blogをお持ちの場合、URLをご記入ください。<br>
例： http://blog.example.com/

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if !$is_unused_daily_news})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

デイリー・ニュース

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="radio" name="is_receive_daily_news" value="1" ({if $c_member.is_receive_daily_news == 1}) checked="checked"({/if}) class="no_bg">毎日
({if $daily_news_day_num})<input type="radio" name="is_receive_daily_news" value="2" ({if $c_member.is_receive_daily_news == 2}) checked="checked"({/if}) class="no_bg">週({$daily_news_day_num})回 (({$daily_news_day_str}))({/if})
<input type="radio" name="is_receive_daily_news" value="0" ({if $c_member.is_receive_daily_news == 0}) checked="checked"({/if}) class="no_bg">受け取らない<br>
<span>※({$SNS_NAME})の最新情報をお届けします。</span>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
({if $smarty.const.DISPLAY_SCHEDULE_HOME})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

週間カレンダー

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="radio" name="schedule_start_day" value="0" ({if $c_member.schedule_start_day == 0}) checked="checked"({/if})>日曜始まり
<input type="radio" name="schedule_start_day" value="1" ({if $c_member.schedule_start_day == 1}) checked="checked"({/if})>月曜始まり
<input type="radio" name="schedule_start_day" value="2" ({if $c_member.schedule_start_day == 2}) checked="checked"({/if})>本日始まり

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

メール受信設定

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="radio" name="is_receive_mail" value="1"({if $c_member.is_receive_mail}) checked="checked"({/if}) class="no_bg">受け取る
<input type="radio" name="is_receive_mail" value="0"({if !$c_member.is_receive_mail}) checked="checked"({/if}) class="no_bg">受け取らない<br>
※新着メッセージの通知などを登録されているPCメールアドレスにお知らせします。<br>
※携帯へのメール受信設定は、携帯からログインして設定してください。
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if !$is_unused_ashiato})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

あしあとお知らせメール

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="text" class="text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})">
アクセス目にメールを受け取る<br>
※ここで指定したアクセス数に達したとき、お知らせメールが届きます。

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({/if})
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

日記公開範囲

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="radio" name="public_flag_diary" value="public"({if $c_member.public_flag_diary == "public"}) checked="checked"({/if}) class="no_bg" id="public_flag_diary_public"><label for="public_flag_diary_public">全員に公開</label>
<input type="radio" name="public_flag_diary" value="friend"({if $c_member.public_flag_diary == "friend"}) checked="checked"({/if}) class="no_bg" id="public_flag_diary_friend"><label for="public_flag_diary_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" name="public_flag_diary" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if}) class="no_bg" id="public_flag_diary_private"><label for="public_flag_diary_private">公開しない</label><br>

※ここで指定した値が日記作成画面であらかじめ選択されている値となります。<br>
これまでに書かれた日記の公開範囲は変更されません。
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

アクセスブロック

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

({foreach from=$c_member_id_block item=item})
ID <input type="text" class="text" name="c_member_id_block[]" value="({$item})"><br>
({/foreach})
ID <input type="text" class="text" name="c_member_id_block[]" value=""><br>

※特定のメンバーからのアクセスをブロックします。<br>
相手トップページのURL末尾に表示されている数字がIDになります。<br>
例：(○の部分がID)<br>
({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=○

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({if $smarty.const.USE_SHINOBIASHI == 1 })
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

忍び足モード

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">
<div class="padding_s">

<input type="radio" name="is_shinobiashi" value="0"({if $is_shinobiashi == 0}) checked="checked"({/if}) class="no_bg" id="is_shinobiashi_0"><label for="is_shinobiashi_0">あしあとを残す</label>
<input type="radio" name="is_shinobiashi" value="1"({if $is_shinobiashi == 1}) checked="checked"({/if}) class="no_bg" id="is_shinobiashi_1"><label for="is_shinobiashi_1">あしあとを残さない</label>
<br>
※他人のページを見たときに、あしあとを残すかどうかを設定することができます。

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>

({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})

({/if})

<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center" valign="middle" colspan="3">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<input type="submit" class="submit" value="　変　更　">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</form>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：設定変更＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：設定変更****** -->
<!-- ***************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：日記公開範囲の一括設定****** -->
({t_form m=pc a=page_h_set_public_flag_all_confirm})

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：日記公開範囲の一括設定＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">日記公開範囲の一括設定</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_03" align="left" valign="middle" colspan="3">

<div style="padding:10px 90px;">

<div align="center" style="text-align:center;">

<input type="radio" name="public_flag_diary_all" value="public" checked="checked" class="no_bg" id="public_flag_diary_all_public"><label for="public_flag_diary_all_public">全員に公開</label>
<input type="radio" name="public_flag_diary_all" value="friend" class="no_bg" id="public_flag_diary_all_friend"><label for="public_flag_diary_all_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" name="public_flag_diary_all" value="private" class="no_bg" id="public_flag_diary_all_private"><label for="public_flag_diary_all_private">公開しない</label><br>
<input type="submit" class="submit" value="　変　更　">

</div>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：日記公開範囲の一括設定＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：日記公開範囲の一括設定****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：退会****** -->
({t_form m=pc a=page_h_taikai_confirm})

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({*********})
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
({*********})
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：退会＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$smarty.const.SNS_NAME})を退会する</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_03" align="left" valign="middle" colspan="3">

<div style="padding:10px 90px;">

<div align="center" style="text-align:center;">

({if $c_member.c_member_id==1})
ID 1 のメンバーはSNSを退会することができません。
({else})
<input type="submit" class="submit" value="退会確認ページへ">
({/if})

</div>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：退会＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：退会****** -->
<!-- ************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
