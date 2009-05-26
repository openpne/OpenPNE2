<div id="LayoutC">
<div id="Center">

({* {{{ searchCategoryList *})
<div class="dparts searchCategoryList"><div class="parts">
<div class="partsHeading"><h3>検索項目の一覧</h3></div>
<div class="partsInfo">※数字は各項目を全体に公開しているメンバーの数になります。</div>
<div class="item">

({foreach from=$profile_list item=profile})
({if $profile.disp_search && ($profile.form_type == 'select' || $profile.form_type == 'checkbox' || $profile.form_type == 'radio')})
({if $profile.public_flag_edit || $profile.public_flag_default == 'public'})
<dl>
<dt><span class="label">({$profile.caption})</span></dt>
<dd>
({foreach from=$profile.options name=$profile.name item=item})
({counter name=$profile.name assign=cnt})
({if $cnt % 5 == 1})<ul>({/if})
<li><a href="({t_url m=pc a=page_h_search_result})&amp;profile%5B({$profile.name})%5D=({$item.c_profile_option_id})">({$item.value})(({$count_list[$item.c_profile_option_id]|default:0}))</a></li>
({if $cnt % 5 == 0})</ul>({/if})
({/foreach})
({if $cnt % 5 != 0})</ul>({/if})
</dd>
</dl>
({/if})
({/if})
({/foreach})
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
