({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_diary_writer.nickname})さんの({$WORD_DIARY_HALF})</a></font><br>
</td></tr>
({if $c_siteadmin})
<tr><td align="left">
({$c_siteadmin|smarty:nodefaults})<br>
</td></tr>
({/if})
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$target_c_diary.subject})</font><br>
</td></tr></table>
<a href="#({if $c_diary_comment})dc1({else})({if $is_prev || $is_next})pager({else})write({/if})({/if})"><font color="#({$ktai_color_config.font_08})">▼</font></a>
({$target_c_diary.r_datetime|date_format:"%y/%m/%d %H:%M"})({if $target_diary_writer.c_member_id==$u}) [<a href="({t_url m=ktai a=page_h_diary_edit})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">編集</a>][<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">削除</a>]({/if})<br>
({$target_c_diary.body|t_url2a_ktai|nl2br|t_decoration_ktai})
<br>
({if $target_c_diary.image_filename_1})
写真1を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $target_c_diary.image_filename_2})
写真2を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $target_c_diary.image_filename_3})
写真3を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})

(({if $target_c_diary.public_flag == "public"})全員に公開({elseif $target_c_diary.public_flag == "friend"})({$WORD_MY_FRIEND_HALF})まで公開({elseif $target_c_diary.public_flag == "private"})公開しない({/if}))

({if $c_diary_id_prev || $c_diary_id_next})
<hr color="#({$ktai_color_config.border_01})">
<center>
({if $c_diary_id_prev})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})&amp;({$tail})">前の({$WORD_DIARY_HALF})</a>({/if})
({if $c_diary_id_prev && $c_diary_id_next})&nbsp;({/if})
({if $c_diary_id_next})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})&amp;({$tail})">次の({$WORD_DIARY_HALF})</a>({/if})
</center>
({/if})

({if $c_diary_comment})
<hr color="#({$ktai_color_config.border_01})">
<center>
ｺﾒﾝﾄ（全({$total_num})件）<br>
({$pager.start})番～({$pager.end})番を表示
</center>

<table width="100%">
({foreach from=$c_diary_comment name=c_diary_comment item=c_diary_comment_})
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="#({if $smarty.foreach.c_diary_comment.last})({if $is_prev || $is_next})pager({else})write({/if})({else})dc({$smarty.foreach.c_diary_comment.iteration+1})({/if})" name="dc({$smarty.foreach.c_diary_comment.iteration})"><font color="#({$ktai_color_config.font_08})">▼</font></a><font color="#({$ktai_color_config.font_06})">[({$c_diary_comment_.number|string_format:"%03d"})]</font>　({$c_diary_comment_.r_datetime|date_format:"%m/%d %H:%M"})
({if $c_diary_comment_.c_member_id == $u || $target_diary_writer.c_member_id==$u})
[<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_comment_confirm})&amp;target_c_diary_comment_id=({$c_diary_comment_.c_diary_comment_id})&amp;({$tail})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})">削除</a>]
({/if})
({if $smarty.const.USE_RESPONSE_COMMENT && $is_writable_comment})
({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT || $is_comment_input})
[<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_comment_id=({$c_diary_comment_.c_diary_comment_id})&amp;({$tail})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;target_response_comment_id=({$c_diary_comment_.c_diary_comment_id})">返信</a>]
({/if})
({/if})
<br>
({if $c_diary_comment_.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_diary_comment_.c_member_id})&amp;({$tail})">({$c_diary_comment_.nickname})</a>({/if})
<br>
({$c_diary_comment_.body|t_url2a_ktai|nl2br})
<br>
({if $c_diary_comment_.image_filename_1})
写真1を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $c_diary_comment_.image_filename_2})
写真2を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $c_diary_comment_.image_filename_3})
写真3を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
</td></tr>
({/foreach})
</table>

({if $pager.page_prev || $pager.page_next})
<center>
<a name="pager"></a>
({if $pager.page_prev})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$pager.page_prev})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $pager.page_prev && $pager.page_next})&nbsp;({/if})
({if $pager.page_next})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$pager.page_next})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
({if $total_page_num > 1})
({if $requests.order == 'asc'})
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">最新を表示</a>
({else})
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;order=asc&amp;({$tail})">最初から表示</a>
({/if})
({/if})
</center>
({/if})
({/if})
({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT or $is_comment_input})
({if $is_writable_comment})
<hr color="#({$ktai_color_config.border_01})">
<a name="write"></a>
<font color="#({$ktai_color_config.font_06})">ｺﾒﾝﾄを書く：</font>
({t_form m=ktai a=do_fh_diary_insert_c_diary_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<textarea name="body" rows="3">({$response_comment_format})</textarea><br>
<input type="submit" value="書き込む">
</form>
<br>
[i:110]<a href="mailto:({$mail_address})">ﾒｰﾙ投稿</a><br>
写真も添付できます。<br>
<font color="#({$ktai_color_config.font_09})">※ﾒｰﾙ投稿では絵文字が反映されません</font>
({else})
<hr color="#({$ktai_color_config.border_01})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
({else})ｺﾒﾝﾄが1000番に達したので、この({$WORD_DIARY_HALF})にはｺﾒﾝﾄできません。({/if})
({/if})
({/if})

<hr color="#({$ktai_color_config.border_01})">
<a name="menu"></a>
[i:190]<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_diary_writer.c_member_id})&amp;({$tail})">({$target_diary_writer.nickname})さんの({$WORD_DIARY_HALF})ﾘｽﾄ</a><br>
({if $INC_NAVI_type=="f"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_diary_writer.c_member_id})&amp;({$tail})">({$target_diary_writer.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})
({if $target_diary_writer.c_member_id==$u})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$WORD_DIARY_HALF})検索</font><br>
</td></tr>
</table>
({t_form _method=get m=ktai a=page_fh_diary_list})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$keyword})"><br>
<center><input type="submit" value="検索する"></center>
</form>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
