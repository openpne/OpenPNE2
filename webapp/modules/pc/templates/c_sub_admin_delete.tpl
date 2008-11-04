<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>副管理者から降板</h3></div>
<div class="partsInfo">
<p>このメンバーを副管理者から降板させます。よろしいですか。</p>
</div>

<table>
<tr><th>写真</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})"><img src="({t_img_url filename=$member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>({$WORD_NICKNAME})</th><td>({$member.nickname})</td>
</tr><tr>
<th>自己紹介</th><td>({$member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr>
<th>最終ログイン</th><td>({$member.last_login})</td>

</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_sub_admin_delete})
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_c_edit_member})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
