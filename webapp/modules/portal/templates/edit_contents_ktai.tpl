({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="携帯版コンテンツ設定"})
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
           <p>「SNSポータル」に表示するコンテンツの表示位置を決めてください。<br />
左側の表に割り振られた番号を各コンテンツに設定すると、そのポートレット（枠）の位置にコンテンツが表示されます。<br />
           <p class="caution" id="c01">※表示したくないコンテンツは「表示しない」を選択してください。<br />
           ※同じ番号を2箇所に設定することはできません。</p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_contents_ktai','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table class="contents" cellpadding="0" cellspacing="0" border="0">
           <tr>
           <td class="menu">
           <dl>
           <dt>&nbsp;</dt>
           <dd>
           <img src="./modules/portal/admin/user_contents_ktai.gif" width="217" alt="" />
           </dd>
           </dl>
           </td>
           <td class="contents">

           <table class="contents">
           <tbody>

           <tr>
           <th>({$portal_free_area_list.1.name|default:'フリーエリア1'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE1})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.2.name|default:'フリーエリア2'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE2})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.3.name|default:'フリーエリア3'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE3})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.4.name|default:'フリーエリア4'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE4})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>
           </tbody>
           </table>

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
