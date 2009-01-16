({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="配色設定"})
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
           <p>お好みの配色設定を選択してください。ポートレット（枠）のデザインと色が変化します。</p>
           <p class="caution" id="c01">※「SNSポータル」のヘッダーとフッターの画像は、<a href="?m=({$smarty.const.ADMIN_MODULE_NAME})&amp;a=page_({$hash_tbl->hash('edit_skin_image', 'page')})">[ デザイン：スキン画像変更 ]</a> ページにある、「ログイン前ヘッダ」と「共通フッタ」の画像が表示されます。ヘッダとフッターの画像を変更したい場合は、そちらのページで変更してください。</p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_color','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="color_changer_area">
               <tr>
                   <td>

                    ({foreach from=$skin item=item key=key})
                   <dl class="box"><dd>
                        ({if $item.thumbnail})
                       <img src="./modules/portal/skin/({$key})/({$item.thumbnail})" width="100" alt="({$item.caption})" /><br />
                        ({else})
                        <div class="color_sample" style="background-color:({$item.color});">&nbsp;</div>
                        ({/if})
                       <input type="radio" name="color_type" value="({$key})"({if $portal_config.color_type == $key}) checked="checked"({/if}) />({$item.caption})
                   </dd></dl>
                    ({/foreach})

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

