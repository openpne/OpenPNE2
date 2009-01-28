({assign var=INC_HEADER_is_login value=true})
({assign var=INC_FOOTER_is_login value=true})

<div id="container_login"><div class="w_screen">
<img src="({t_img_url_skin filename=skin_login})" class="bg" alt="" />

({if $top_banner_html_before || $top_banner_html_after})
<div class="banner">
({$top_banner_html_before|smarty:nodefaults})
</div>
({elseif $INC_PAGE_HEADER.c_banner_id})
<div class="banner">
({strip})
({if $INC_PAGE_HEADER.a_href})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_PAGE_HEADER.c_banner_id})" target="_blank">
        <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})" alt="" />
    </a>
({else})
    <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})" alt="" />
({/if})
({/strip})
</div>
({/if})

({t_form_block _attr='name="login" id="login"' m=pc a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})" />
<input type="text" class="input_text" name="username" id="username" tabindex="1" />
<input type="password" class="input_text" name="password" id="password" tabindex="2" />
<input type="image" name="submit" src="./skin/dummy.gif" id="button_login" tabindex="4" alt="ログイン" />
({if !$IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
<a href="({t_url m=pc a=page_o_public_invite})" id="button_new_regist"><img src="./skin/dummy.gif" alt="新規登録" /></a>
({/if})
<div class="msg lh_130">
<input type="checkbox" class="input_checkbox" name="is_save" id="is_save" value="1" tabindex="3" /><label for="is_save">次回から自動的にログイン</label><br />
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})
<span class="password_query"><a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})">&gt;パスワードを忘れた方はこちらへ</a></span>
({/if})
({else})
<span class="password_query"><a href="({t_url m=pc a=page_o_help_login_error})">&gt;ログインできない方はこちら</a></span>
({/if})
({if $SSL_SELECT_URL})
<br /><a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({/if})
</div>
({/t_form_block})

<div class="footer">
<p>({$inc_page_footer|smarty:nodefaults})</p>
</div>
</div></div>
