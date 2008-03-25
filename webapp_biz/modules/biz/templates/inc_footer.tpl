({if !$INC_FOOTER_is_login})
<div id="Footer">
<p>({$INC_FOOTER_inc_page_footer|smarty:nodefaults})</p>
</div>
({/if})

({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after || $INC_FOOTER_inc_side_banner})
<div id="sideBanner">
({strip})
({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after})
	({if $before_after == 'before'})
		({$INC_FOOTER_side_banner_html_before|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
	({else})
		({$INC_FOOTER_side_banner_html_after|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
	({/if})
({else})
	({if $INC_FOOTER_inc_side_banner.a_href})
		<a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})({if $PHPSESSID})&amp;sessid=({$PHPSESSID})({/if})" target="_blank"><img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})" alt="({$INC_FOOTER_inc_side_banner.nickname})" /></a>
	({else})
		<img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})" alt="({$INC_FOOTER_inc_side_banner.nickname})" />
	({/if})
({/if})
({/strip})
</div>
({/if})

({$INC_FOOTER_inc_page_bottom2|smarty:nodefaults})

</div><!-- Container -->

({$INC_FOOTER_inc_page_bottom|smarty:nodefaults})

</div><!-- Body -->
</body>
</html>
