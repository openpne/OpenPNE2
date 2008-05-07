({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu.name})</font></center>
<hr>
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})
<hr>
({/if})

({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})

<a href="#menu" accesskey="1">1.ﾒﾆｭｰ</a>({if $is_c_commu_view})|<a href="#news" accesskey="2">2.新着ﾘｽﾄ</a>({/if})|<a href="#intro" accesskey="3">3.説明文</a>|<a href="({t_url m=ktai a=page_h_home})&amp;({$tail})">ﾎｰﾑ</a>
<hr>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
管理者:<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
ｶﾃｺﾞﾘ:({$c_commu.c_commu_category.name})<br>
ﾒﾝﾊﾞｰ数:({$c_commu.count_member|default:"0"})人

<hr>
<a name="menu">ﾒﾆｭｰ</a>
<br>
({if $relation_c_member_and_c_commu.join && !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
◆設定変更<br>
({if $u == $c_commu.c_member_id_admin || $u == $c_commu.c_member_id_sub_admin})
├<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨ編集</a><br>
├<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾒﾝﾊﾞｰ編集</a><br>
({/if})
└<a href="#setting">ﾒｰﾙ受信設定</a><br>
({/if})
({if !$relation_c_member_and_c_commu.join && !$relation_c_member_and_c_commu.wait})
◆<a href="({t_url m=ktai a=do_inc_join_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに参加</a><br>
({/if})
({if $relation_c_member_and_c_commu.join})
◆<a href="({t_url m=ktai a=do_inc_leave_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨから退会</a><br>
({/if})
◆<a href="({t_url m=ktai a=page_c_invite})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に紹介</a><br>
<hr>
ﾄﾋﾟｯｸ検索
({t_form _method=get m=ktai a=page_c_com_topic_find})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="keyword" value="({$search_word})">
<br>
<select name="target_commu">
<option value="in_commu">コミュニティ内</option>
<option value="all">全てのコミュニティ</option>
</select>
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">
<br>
<input type="submit" value="検索">
</form>
<hr>
<a name="news">新着ﾘｽﾄ</a>
({if $is_c_commu_view})
<br><font color="green">[ﾄﾋﾟｯｸﾘｽﾄ]</font><br>
({foreach from=$new_topic_comment item=item})
　[({$item.r_datetime|date_format:"%m/%d"})]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name})</a>(({$item.count_comments}))<br>
({foreachelse})
　トピックはありません<br>
({/foreach})
({if $new_topic_comment})
→<a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
→<a href="({t_url m=ktai a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">トピック作成</a>
({/if})
<hr>
<font color="green">[ｲﾍﾞﾝﾄﾘｽﾄ]</font><br>
({foreach from=$new_topic_comment_event item=item})
　[({$item.r_datetime|date_format:"%m/%d"})]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name})</a>(({$item.count_comments}))<br>
({foreachelse})
　イベントはありません<br>
({/foreach})
({if $new_topic_comment_event})
→<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
→<a href="({t_url m=ktai a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">イベント作成</a>
({/if})
({if $relation_c_member_and_c_commu.join})
<hr>
({/if})
({/if})
<br>

管理者:<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
<br>
<font color="green">[ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ](({$c_commu.count_member}))</font><br>
({foreach from=$c_commu_member_list item=c_commu_member })
　<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_member.c_member_id})&amp;({$tail})">({$c_commu_member.nickname})</a><br>
({/foreach})
<a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">→全て表示</a><br>

<hr>
<a name="intro">説明文</a>
<br>
({$c_commu.info|t_url2a_ktai|nl2br})<br>
({if $c_commu.image_filename})
ｺﾐｭﾆﾃｨ画像：[<a href="({t_img_url filename=$c_commu.image_filename w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu.image_filename f=jpg})">大</a>]<br>({/if})
({if $relation_c_member_and_c_commu.join && ($c_commu.c_member_id_admin!=$u || $c_commu.c_member_id_sub_admin!=$u) })
<a href="({t_url m=ktai a=do_inc_leave_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">このｺﾐｭﾆﾃｨから退会</a><br>
({/if})

({if $relation_c_member_and_c_commu.join && !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
<hr>
<a name="setting">メール受信設定</a><br>
({t_form m=ktai a=do_c_home_update_is_receive_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({if ($c_commu.c_member_id_admin!=$u && $c_commu.c_member_id_sub_admin!=$u)})
このｺﾐｭﾆﾃｨの管理者からのﾒｯｾｰｼﾞを<br>
<input type="radio" value="1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if})>受け取らない<br>
({/if})
({if !$is_unused_ktai_bbs})
このｺﾐｭﾆﾃｨの書き込みをｹｰﾀｲﾒｰﾙで<br>
<input type="radio" value="1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if})>受け取らない<br>
({/if})
({if $smarty.const.OPENPNE_ENABLE_PC && !$is_unused_pc_bbs})
このｺﾐｭﾆﾃｨの書き込みをPCﾒｰﾙで<br>
<input type="radio" value="1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if})>受け取らない<br>
({/if})
<input type="submit" value="設定"><br>
</form>
({/if})

<hr>
({if ($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨ編集</a><br>
<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ編集</a><br>
<br>
({/if})
<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
