({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="携帯版使用設定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNSポータルクリエイター</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
   <tr>
   ({ext_include file="inc_menu_adminPortalConfig.tpl"})
       <td class="detail">

           <h3>({$page_name})</h3>
           <p>
           ログインページとして、「SNSポータル」を使用するかどうか選択してください。
           </p>

           <p class="caution" id="c01">
           ※現在携帯版外部ログインページを使用している場合、ここで「使用する」を選択すると、SNS設定の[ 携帯版外部ログインページURL ]が上書きされますのでご注意ください。
           </p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_portal_use_ktai','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                       <dl>
                       <dt><strong class="title">SNSポータルを</strong></dt>
                       <dd>
                       <select class="basic" name="use_portal">
                       <option value="1"({if $portal_config.use_portal == '1'}) selected="selected"({/if})>使用する</option>
                       <option value="0"({if $portal_config.use_portal == '0'}) selected="selected"({/if})>使用しない</option>
                       </select>
                       </dd>
                       </dl>

                       <br class="clear" />

                       <p class="textBtn"><input type="submit" value="　変　更　" /></p>
                   </td>
               </tr>
           </table>
           </form>
       </td>
   </tr>
</table>

<div class="contents">

({$inc_footer|smarty:nodefaults})

