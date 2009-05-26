<div id="LayoutC">
<div id="Center">

({* {{{ friendIntroList *})
<div class="dparts friendIntroList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_FRIEND})からの紹介文</h3></div>
<table>
({foreach from=$intro_list item=item})
<tr>
<th><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /><br />({$item.nickname})</a></th>
<td><p class="text">({$item.intro|t_url2a|nl2br})</p>
<ul>
({if $target_member.c_member_id==$member.c_member_id})
({if !$item.has_intro_by_me})
<li><a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})">この({$WORD_MY_FRIEND})を紹介する</a></li>
({/if})
<li><a href="({t_url m=pc a=do_f_intro_from_delete})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">紹介文を削除する</a></li>
({/if})
({if $item.c_member_id==$member.c_member_id})
<li><a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$target_member.c_member_id})">紹介文を編集する</a></li>
<li><a href="({t_url m=pc a=page_f_intro_delete_confirm})&amp;target_c_member_id=({$target_member.c_member_id})&amp;sessid=({$PHPSESSID})">紹介文を削除する</a></li>
({/if})
</ul>
</td>
</tr>
({/foreach})
</table>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
