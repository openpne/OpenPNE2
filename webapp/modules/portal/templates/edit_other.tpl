({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="その他設定"})
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
           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_other','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                   <dl>
                   <dt><strong class="title">カスタムCSS（上級者設定）</strong></dt>
                   <dd><p>標準設定されているスタイルは、ここで上書きすることができます。</p>
                   <p class="caution" id="c01">
                   ※よくわからない場合は、何も入力しなくても問題ありません。<br />
                   ※「SNSポータル」のヘッダーとフッターの画像は、<a href="?m=({$smarty.const.ADMIN_MODULE_NAME})&amp;a=page_({$hash_tbl->hash('edit_skin_image', 'page')})">[ デザイン：スキン画像変更 ]</a>  ページにある、「ログイン前ヘッダ」と「共通フッタ」の画像が表示されます。ヘッダとフッターの画像を変更したい場合は、そちらのページで変更してください。</p></dd>

                   <dd><textarea name="custom_css" rows="10" cols="80">({$portal_config.custom_css})</textarea></dd>
                   </dl>
                   <br /><br />
                   <dl>
                   <dt><strong class="title">metaタグ設定（任意入力）</strong></dt>
                   <dd><p>metaタグのkeywordsとdescription設定をおこなうことができます。<br />
                   keywordsは、検索エンジンにヒットさせたい単語を半角カンマ区切りで入力してください。<br />
                   descriptionは、検索エンジンにヒットしたときに検索結果一覧で表示させたい文言を入力してください。</p></dd>

                   <dd>
                        <table class="inputForm">
                        <tr><th>keywords</th>
                        <td><input class="basic" type="text" name="meta_keywords" value="({$portal_config.meta_keywords})" /></td></tr>
                       <tr><th>description</th>
                        <td><input class="basic" type="text" name="meta_description" value="({$portal_config.meta_description})" /></td></tr>
                        </table></dd>
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
