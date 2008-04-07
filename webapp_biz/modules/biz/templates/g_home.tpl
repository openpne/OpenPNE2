({* unknown *})<div id="LayoutA">
({* unknown *})<div id="Left">
({* unknown *})
({* unknown *})({* {{{ homePhotoBox *})
({* unknown *})<div class="dparts homePhotoBox">
({* unknown *})<div class="parts">
({* unknown *})<p class="photo"><img src="({t_img_url filename=$group.image_filename w=180 h=180 noimg=no_image})" alt="" /></p>
({* unknown *})</div>
({* unknown *})<p class="text">({$group.name})</p>
({* unknown *})</div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})</div><!-- Left -->
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({* {{{ homeMainTable *})
({* unknown *})<div class="dparts homeMainTable"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループ</h3></div>
({* unknown *})<table>
({* unknown *})<tr><th>グループ名</th><td>({$group.name})</td></tr>
({* unknown *})<tr><th>管理者</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$admin_data.c_member_id})">({$admin_data.nickname})</a></td></tr>
({* unknown *})<tr><th>メンバー数</th><td>({$member_count|default:"0"})人</td></tr>
({* unknown *})<tr><th>グループ<br />説明文</th><td>({$group.info|t_url2a|nl2br})</td></tr>
({* unknown *})({if $is_admin})
({* unknown *})<tr><th></th><td>
({* unknown *})<div class="moreInfo"><ul class="moreInfo">
({* unknown *})<li><a href="({t_url m=biz a=page_h_biz_group_edit})&amp;target_id=({$group.biz_group_id})">グループ設定変更</a></li>
({* unknown *})</ul></div>
({* unknown *})</td></tr>
({* unknown *})({/if})
({* unknown *})</table>
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutA -->
({* unknown *})
({* unknown *})({if $calendar_head})
({* unknown *})({$calendar_head|smarty:nodefaults})
({* unknown *})({$calendar_value|smarty:nodefaults})
({* unknown *})({$calendar_foot|smarty:nodefaults})
({* unknown *})({/if})
