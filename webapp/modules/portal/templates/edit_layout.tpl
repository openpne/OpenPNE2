({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="レイアウト設定"})
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

       <p>「SNSポータル」のレイアウトを下記の3つから選択してください。</p>

       <form action="./" method="post">
       <input type="hidden" name="m" value="({$module_name})" />
       <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_layout','do')})" />
       <input type="hidden" name="sessid" value="({$PHPSESSID})" />

       <table id="layout_changer_area">
       <tr>
       <td>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout01.jpg" width="180" alt="レイアウト1（5:5）" /><br />
       <input type="radio" name="layout_type" value="1"({if $portal_config.layout_type == '1'}) checked="checked"({/if}) /> レイアウト1（5:5）
       </dd>
       </dl>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout02.jpg" width="180" alt="レイアウト2（4:6）" /><br />
       <input type="radio" name="layout_type" value="2"({if $portal_config.layout_type == '2'}) checked="checked"({/if}) /> レイアウト2（4:6）
       </dd>
       </dl>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout03.jpg" width="180" alt="レイアウト3（6:4）" /><br />
       <input type="radio" name="layout_type" value="3"({if $portal_config.layout_type == '3'}) checked="checked"({/if}) /> レイアウト3（6:4）
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
