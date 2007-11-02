<tr>
<td class="container inc_c_com_topic_find" align="center">
({*******************************************})
({**ここから：inc_c_com_topic_find.tplの内容**})
({*******************************************})
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
<tr>
<td style="width:720px;height:2px;"><img src="./skin/dummy.gif" alt="dummy" style="width:720px;height:2px;" class="dummy"></td>
</tr>
<tr>
<td align="center">

({*ここから：本体*})

<div class="color_19" style="width:680px;height:24px;border-left:none 0px;border-right:none 0px;border-top:none 0px;">
({t_form _method=get m=pc a=page_c_com_topic_find})
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">

<table border="0" cellspacing="0" cellpadding="0" class="search_bar" style="width:680px;height:24px;">
<tr>
<td align="center" style="height:24px;">
<img src="({t_img_url_skin filename=icon_search})" alt="search" style="width:62px;height:20px;" class="icon">
<input type="text" size="30" name="keyword" class="text border_01" value="" style="width:180px;">
<select name="target_commu">
<option value="in_commu">コミュニティ内</option>
<option value="all">コミュニティ全体</option>
</select>
<input type="submit" class="submit" value=" 検 索 " style="width:62px;height:20px;">

</td>
</tr>
</table>

</form>
</div>

({*ここまで：本体*})
</td>
</tr>
</table>
({*******************************************})
({**ここまで：inc_c_com_topic_find.tplの内容**})
({*******************************************})
</td>
</tr>