({assign var=INC_HEADER_is_login value=true})
({assign var=INC_FOOTER_is_login value=true})

({* unknown *})<div id="container_login"><div class="w_screen">
({* unknown *})<img src="({t_img_url_skin filename=skin_login})" class="bg" alt="" />
({* unknown *})
({* unknown *})({if $top_banner_html_before || $top_banner_html_after})
({* unknown *})<div class="banner">
({* unknown *})({$top_banner_html_before|smarty:nodefaults})
({* unknown *})</div>
({* unknown *})({elseif $INC_PAGE_HEADER.c_banner_id})
({* unknown *})<div class="banner">
({* unknown *})({strip})
({* unknown *})({if $INC_PAGE_HEADER.a_href})
({* unknown *})    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_PAGE_HEADER.c_banner_id})" target="_blank">
({* unknown *})        <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})" alt="" />
({* unknown *})    </a>
({* unknown *})({else})
({* unknown *})    <img src="({t_img_url filename=$INC_PAGE_HEADER.image_filename})" alt="" />
({* unknown *})({/if})
({* unknown *})({/strip})
({* unknown *})</div>
({* unknown *})({/if})
({* unknown *})
({* unknown *})({t_form_block _attr='name="login" id="login"' m=pc a=do_o_login})
({* unknown *})<input type="hidden" name="login_params" value="({$requests.login_params})" />
({* unknown *})<input type="text" class="input_text" name="username" id="username" tabindex="1" />
({* unknown *})<input type="password" class="input_text" name="password" id="password" tabindex="2" />
({* unknown *})<input type="image" name="submit" src="./skin/dummy.gif" id="button_login" tabindex="4" alt="ログイン" />
({* unknown *})({if !$IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
({* unknown *})<a href="({t_url m=pc a=page_o_public_invite})" id="button_new_regist"><img src="./skin/dummy.gif" alt="新規登録" /></a>
({* unknown *})({/if})
({* unknown *})<div class="msg lh_130">
({* unknown *})<input type="checkbox" class="input_checkbox" name="is_save" id="is_save" value="1" tabindex="3" /><label for="is_save">次回から自動的にログイン</label><br />
({* unknown *})({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({* unknown *})({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})
({* unknown *})<span class="password_query"><a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})">&gt;パスワードを忘れた方はこちらへ</a></span>
({* unknown *})({/if})
({* unknown *})({else})
({* unknown *})<span class="password_query"><a href="({t_url m=pc a=page_o_password_query})">&gt;パスワードを忘れた方はこちらへ</a></span>
({* unknown *})({/if})
({* unknown *})({if $SSL_SELECT_URL})
({* unknown *})<br /><a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})<div class="footer">
({* unknown *})<p>({$inc_page_footer|smarty:nodefaults})</p>
({* unknown *})</div>
({* unknown *})</div></div>
