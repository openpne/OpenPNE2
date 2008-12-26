   <div class="site">
       <div id="siteTtl"><h1>({$head_text})</h1></div>
       <div class="snsLogin">
           <fieldset>
           <legend>ログイン</legend>
           ({t_form m=pc a=do_o_login})
           <input type="hidden" name="login_params" value="({$requests.login_params})" />
           ({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})
               <div id="usernameArea"><label for="username"><span>E-mailアドレス</span></label>
           ({else})
               <div id="usernameArea"><label for="username"><span>ログインID</span></label>
           ({/if})
           <input type="text" name="username" tabindex="1" id="username" /></div>
           <div id="passwordArea"><label for="password"><span>パスワード</span></label><input type="password" name="password" tabindex="2" id="password" /></div>
           <div id="isSaveArea"><input type="checkbox" name="is_save" value="1" tabindex="3" id="isSave" /><label for="isSave"><span>次回から自動的にログイン</span></label></div>
           ({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
           ({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})
           <div id="passwordQueryArea"><a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})">&gt;パスワードを忘れた方はこちらへ</a></div>
           ({/if})
           ({else})
           <div id="passwordQueryArea"><a href="({t_url m=pc a=page_o_help_login_error})">&gt;ログインできない方はこちら</a></div>
           ({/if})
           <div id="buttonLoginArea"><button type="submit" tabindex="4" id="buttonLogin">ログイン</button></div>
           </form>
           ({if ! $smarty.const.IS_CLOSED_SNS})
           <div id="buttonRegiArea"><button onclick="location.href='({t_url m=pc a=page_o_public_invite})'">新規登録</button></div>
           ({/if})
           </fieldset>
       </div>
   </div>
