({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_c_com_topic_find})
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})" />
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="" size="30" /></li>
<li><select name="target_commu">
<option value="in_commu">({$WORD_COMMUNITY})内</option>
<option value="all">({$WORD_COMMUNITY})全体</option>
</select></li>
<li><input type="submit" class="input_submit" value="　検　索　" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})
