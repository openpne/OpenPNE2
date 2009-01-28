({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="リンク集設定"})
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
           「SNSポータル」にリンク集を設置することができます。<br />
           リンクを表示したいテキストとURLを入力してください。リンクは最大10件まで表示できます。<br />
            リンクは、「順番」の数値が小さいものから順に表示されます。<br />
           <br />
           表示位置は、 [ コンテンツ設定 ] ページで設定してください。
           </p>

           <p class="caution" id="c01">
           ※「表示」からチェックを外すと、「SNSポータル」にそのリンクが表示されなくなります。<br />
            ※「新規ウィンドウ」にチェックすると、リンクが新しいウィンドウで開かれます。
            </p>

            <form action="./" method="post" />
            <input type="hidden" name="m" value="({$module_name})" />
            <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_link','do')})" />
            <input type="hidden" name="sessid" value="({$PHPSESSID})" />

            <table id="link_area">
            <thead>
            <tr>
                <th>リンクテキスト</th>
                <th>URL</th>
                <th>順番</th>
                <th>新規ウィンドウ</th>
                <th>表示</th>
            </tr>
            </thead>
            <tbody>
            ({section loop=10 name=item})
            ({assign var=i value=$smarty.section.item.index})
            ({assign var=portal_link value=$portal_link_list[$i]})
            <input type="hidden" name="link_list[({$i+1})][id]" value="({$portal_link.portal_link_id|default:''})" />
            <tr>
                <td><input type="text" class="basic link_title" name="link_list[({$i+1})][title]" value="({$portal_link.title|default:''})" /></td>
                <td><input type="text" class="basic link_url" name="link_list[({$i+1})][url]" value="({$portal_link.url|default:''})" /></td>
                <td><input type="text" class="basic link_sort_order" name="link_list[({$i+1})][sort_order]" value="({$portal_link.sort_order|default:'0'})" /></td>
                <td align="center"><input type="checkbox" class="basic link_is_target_blank" name="link_list[({$i+1})][is_target_blank]" value="1"({if $portal_link.is_target_blank || !$portal_link.portal_link_id}) checked="checked"({/if}) /></td>
                <td align="center"><input type="checkbox" class="basic link_is_enabled" name="link_list[({$i+1})][is_enabled]" value="1"({if $portal_link.is_enabled || !$portal_link.portal_link_id}) checked="checked"({/if}) /></td>
            </tr>
            ({/section})
            </tbody>
            </table>
           <p class="textBtn"><input type="submit" value="　変　更　" /></p>
            </form>
       </td>
   </tr>
</table>
<div class="contents">

({$inc_footer|smarty:nodefaults})
