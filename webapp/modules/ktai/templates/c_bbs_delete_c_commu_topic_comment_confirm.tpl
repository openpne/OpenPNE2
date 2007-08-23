({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu_topic_name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｺﾒﾝﾄの削除<br>
</td></tr></table>

このｺﾒﾝﾄを本当に削除しますか?<br>
<hr color="#0d6ddf">
<font color="#999966">ｺﾒﾝﾄ:</font><br>

({foreach from=$c_commu_topic_comment_list item=item})
({if $item.number != 0})
({$item.r_datetime|date_format:"%y/%m/%d %H:%M"})<br>
({if $item.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a>({/if})
<br>
({$item.body|t_url2a_ktai|nl2br})<br>
({if $item.image_filename1})画像：[<a href="({t_img_url filename=$item.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename2})画像：[<a href="({t_img_url filename=$item.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename3})画像：[<a href="({t_img_url filename=$item.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename3 f=jpg})">大</a>]<br>({/if})
<br>
({/if})
({/foreach})

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_c_bbs_delete_c_commu_topic_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment_id})">
<input type="submit" value="は　い">
</form>
<br>
({t_form m=ktai a=page_c_bbs})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="いいえ">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
