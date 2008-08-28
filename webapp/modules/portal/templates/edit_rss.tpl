({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="RSSリーダー設定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})
<p class="actionMsg">({$msg})</p>
({elseif $error_msg})
<p class="actionMsg errorMsg">({$error_msg})</p>
({/if})
<h2>SNSポータルクリエイター</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
   <tr>
   ({ext_include file="inc_menu_adminPortalConfig.tpl"})
       <td class="detail">
           <h3>({$page_name})</h3>
           <p>
           「SNSポータル」にRSSリーダーを5つまで設置することができます。<br />
           RSS情報を表示したいブログのURLを入力してください。5つのRSS情報を、それぞれ最新5件まで表示できます。<br />
           <br />
           表示位置は、 [ コンテンツ設定 ] ページで設定してください。
           </p>

           <p class="caution" id="c01">
           ※ブログに限らず、RSSのURLを直接入力することもできます。
           </p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_rss','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_1" value="({$portal_rss.rss_name_1|default:"RSSリーダー1"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_1" value="({$portal_rss.rss_1})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_2" value="({$portal_rss.rss_name_2|default:"RSSリーダー2"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_2" value="({$portal_rss.rss_2})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_3" value="({$portal_rss.rss_name_3|default:"RSSリーダー3"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_3" value="({$portal_rss.rss_3})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_4" value="({$portal_rss.rss_name_4|default:"RSSリーダー4"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_4" value="({$portal_rss.rss_4})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_5" value="({$portal_rss.rss_name_5|default:"RSSリーダー5"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_5" value="({$portal_rss.rss_5})" size="100" /></dd></dl>
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
