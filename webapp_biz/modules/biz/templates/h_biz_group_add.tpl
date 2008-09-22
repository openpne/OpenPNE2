<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>新規作成</h3></div>

({t_form_block _enctype=file m=biz a=do_h_biz_group_add})

<table>
<tr>
<th>グループ名</th><td><input type="text" class="text" name="name" size="50" value="({$name})" /></td>
</tr>
<tr>
<th>グループ説明文</th><td><textarea class="text" name="info" rows="6" cols="50">({$info})</textarea></td>
</tr>
<tr>
<th>写　　真</th>
<td><input type="file" size="40" name="image_filename" /><br /></td>
</tr>
<tr>
<th>参加者</th>
<td>
<div class="checkList"><ul>
({foreach from=$c_invite_list item=c_invite name=mem key=i})
({counter assign=_cnt})
<li><div class="item">
({if $c_invite.c_member_id == $c_member_id})
<input type="hidden" id="m({$c_invite.c_member_id})" name="member_list[]" value="({$c_invite.c_member_id})" />
({else})
<input type="checkbox" id="m({$c_invite.c_member_id})" name="member_list[]" value="({$c_invite.c_member_id})" ({if $member_list[$i]})checked="checked"({/if}) />
({/if})
<label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label></div></li>
({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</ul><ul>({/if})
({/foreach})
</ul></div>
</td>
</tr>
({capture name=comment_out})<tr>
<th>参加者</th>
<td>
<div class="checkList"><ul>
({foreach from=$c_invite_list_temp item=item name=mem})
<li><div class="item">
({if $item.c_member_id == $c_member_id})
<input type="hidden" id="m({$item.c_member_id})" name="member_list[]" value="({$item.c_member_id})" />
({else})
<input type="checkbox" id="m({$item.c_member_id})" name="member_list[]" value="({$item.c_member_id})" ({if $item.checkflag})checked="checked"({/if}) />
({/if})
({if $item})
<label for="m({$item.c_member_id})">({$item.nickname})</label></div><li>
({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</ul><ul>({/if})
({/if})
({/foreach})
</ul></div>
</td>
</tr>({/capture})
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　作　成　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
