({if !$INC_FOOTER_is_login})
<tr>
<td class="container inc_page_footer">


({***************************************})
({**ここから：旧inc_page_footer.tplの内容**})
({***************************************})
<table class="inc_page_footer" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="bg_page_footer" style="background: url(({t_img_url_skin filename=skin_footer})) no-repeat ;">

({$INC_FOOTER_inc_page_footer|smarty:nodefaults})

</td>
</tr>
</table>
({***************************************})
({**ここまで：旧inc_page_footer.tplの内容**})
({***************************************})

</td>
</tr>
({/if})
</table>

({$INC_FOOTER_inc_page_bottom2|smarty:nodefaults})

</td>

({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after || $INC_FOOTER_inc_side_banner || $newschedule || $todolist })

<td class="ext_sub_container_right" align="center" valign="top">
({**********************************})
({**ここから：サイドコンテンツ領域**})
({**********************************})

({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after || $INC_FOOTER_inc_side_banner})

({strip})
({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after})
    ({if $before_after == 'before'})
        ({$INC_FOOTER_side_banner_html_before|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
    ({else})
        ({$INC_FOOTER_side_banner_html_after|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
    ({/if})
({else})
    ({if $INC_FOOTER_inc_side_banner.a_href})
    ({if $PHPSESSID})
    <a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})&amp;sessid=({$PHPSESSID})" target="_blank">
    ({else})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})" target="_blank">
    ({/if})
        <img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})">
    </a>
    ({else})
    <img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})">
    ({/if})
({/if})
({/strip})

({/if})

({if $newschedule})
({$newschedule|smarty:nodefaults})
({/if})

({if $todolist})
({$todolist|smarty:nodefaults})
({/if})

({**********************************})
({**ここまで：サイドコンテンツ領域**})
({**********************************})
</td>
({/if})
</tr>
</table>

</div>

({$INC_FOOTER_inc_page_bottom|smarty:nodefaults})

</body>
</html>
