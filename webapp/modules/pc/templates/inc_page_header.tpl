({* before_login / after_login *})
<div class="w_screen inc_page_header ({$before_after})_login">

({* skin_before_header / skin_after_header *})
({* bg_before / bg_after *})
<img src="({t_img_url_skin filename=skin_`$before_after`_header})" class="bg_({$before_after})">

({if $top_banner_html_before || $top_banner_html_after})
<div class="banner">
({if $before_after == 'before'})
({$top_banner_html_before|smarty:nodefaults})
({else})
({$top_banner_html_after|smarty:nodefaults})
({/if})
</div>
({elseif $INC_PAGE_HEADER.c_banner_id})
<div class="banner">
({strip})
({if $INC_PAGE_HEADER.a_href})
    ({if $before_after == "before"})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_PAGE_HEADER.c_banner_id})" target="_blank">
    ({else})
    <a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_PAGE_HEADER.c_banner_id})&amp;sessid=({$PHPSESSID})" target="_blank">
    ({/if})
        <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})">
    </a>
({else})
    <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})">
({/if})
({/strip})
</div>
({/if})

<a class="logo_home" href="({t_url})"><img src="./skin/dummy.gif" alt="({$smarty.const.SNS_NAME})"></a>

({if $before_after == "after"})
<div class="navi_global">
({foreach from=$navi key=key item=item})
({if $item.url})
<a class="navi_global_({$key+1})" href="({$item.url})"><img src="./skin/dummy.gif" alt="({$item.caption})"></a>
({/if})
({/foreach})
<a class="navi_global_9" href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})"><img src="./skin/dummy.gif" alt="ログアウト"></a>
</div>
({/if})

</div>