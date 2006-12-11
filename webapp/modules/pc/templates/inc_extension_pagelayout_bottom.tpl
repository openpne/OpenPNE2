({$inc_extension_pagelayout_bottom2|smarty:nodefaults})

</td>

({if $side_banner_html_before || $side_banner_html_after || $inc_side_banner})

<td class="ext_sub_container_right" align="center" valign="top">
({**********************************})
({**ここから：サイドコンテンツ領域**})
({**********************************})

({strip})
({if $side_banner_html_before || $side_banner_html_after})
    ({if $before_after == 'before'})
        ({$side_banner_html_before|smarty:nodefaults})
    ({else})
        ({$side_banner_html_after|smarty:nodefaults})
    ({/if})
({else})
    ({if $inc_side_banner.a_href})
    ({if $PHPSESSID})
    <a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$inc_side_banner.c_banner_id})&amp;sessid=({$PHPSESSID})" target="_blank">
    ({else})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$inc_side_banner.c_banner_id})" target="_blank">
    ({/if})
        <img src="({t_img_url filename=$inc_side_banner.image_filename})">
    </a>
    ({else})
    <img src="({t_img_url filename=$inc_side_banner.image_filename})">
    ({/if})
({/if})
({/strip})

({**********************************})
({**ここまで：サイドコンテンツ領域**})
({**********************************})
</td>
({/if})
</tr>
</table>

</div>

({$inc_extension_pagelayout_bottom|smarty:nodefaults})
