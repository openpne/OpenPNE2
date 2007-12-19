({ext_include file="inc_header.tpl" INC_HEADER_is_login=true})

<div id="container_login"><div class="w_screen">

<img src="({t_img_url_skin filename=skin_login})" class="bg">

({if $top_banner_html_before || $top_banner_html_after})
<div class="banner">
({$top_banner_html_before|smarty:nodefaults})
</div>
({elseif $INC_PAGE_HEADER.c_banner_id})
<div class="banner">
({strip})
({if $INC_PAGE_HEADER.a_href})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_PAGE_HEADER.c_banner_id})" target="_blank">
        <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})">
    </a>
({else})
    <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})">
({/if})
({/strip})
</div>
({/if})

({t_form _attr='name="login" id="login"' m=pc a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
<input type="text" tabindex="1" name="username" id="username" class="text">
<input type="password" tabindex="2" name="password" id="password" class="text">
<input type="image" tabindex="4" name="submit" src="./skin/dummy.gif" border="0" id="button_login" alt="ログイン">

({if !$IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
<a href="({t_url m=pc a=page_o_public_invite})" id="button_new_regist"><img src="./skin/dummy.gif" alt="新規登録"></a>
({/if})

<div class="msg lh_130">
<input type="checkbox" tabindex="3" name="is_save" id="is_save" value="1" class="no_bg"><label for="is_save">次回から自動的にログイン</label><br>
({if !$smarty.const.IS_SLAVEPNE})
<span class="password_query"><a href="({t_url m=pc a=page_o_password_query})">&gt;パスワードを忘れた方はこちらへ</a></span>
({/if})
({if $SSL_SELECT_URL})
<br><a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({/if})
</div>
</form>
<div class="footer">

({$inc_page_footer|smarty:nodefaults})

</div>

</div></div>

({ext_include file="inc_footer.tpl" INC_FOOTER_is_login=true})
