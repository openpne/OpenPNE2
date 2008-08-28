({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="コンテンツ設定"})
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
ヘッダには、 [ SNS名を表示 ] を選択した場合はSNS名が、 [ 手動入力 ] を選択した場合には入力ボックスに入れた文字列が表示されます。</p>
           <p class="caution">※表示したくないコンテンツは「表示しない」を選択してください。<br />
           ※同じ番号を2箇所に設定することはできません。</p>
            ({if $smarty.const.CHECK_IMG_AUTH})
            <p class="caution">※画像認証が有効になっているため、「最新({$WORD_COMMUNITY})書き込み」「({$WORD_COMMUNITY})盛り上がりランキング」の画像を表示することができません。画像を表示したい場合は、config.php の CHECK_IMG_AUTH を false にしてから設定をおこなってください。</p>
            ({/if})

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_contents','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table class="contents" cellpadding="0" cellspacing="0" border="0">
           <tr>
           <td class="menu">
           <dl>
           <dt>&nbsp;</dt>
           <dd>
           <img src="./modules/portal/admin/user_contents.gif" width="210" alt="" />
           </dd>
           </dl>
           </td>
           <td class="contents">

           <table class="contents">
           <tbody>
           <tr>
           <th>ヘッダ表示テキスト</th>
           <td>
               <input type="radio" name="header_text_type" value="0"({if $portal_config.header_text_type == $smarty.const.PORTAL_CONFIG_HEAD_TEXT_TYPE_SNS }) checked="checked"({/if}) />SNS名を表示<br />
               <input type="radio" name="header_text_type" value="1"({if $portal_config.header_text_type == $smarty.const.PORTAL_CONFIG_HEAD_TEXT_TYPE_MANUAL}) checked="checked"({/if}) />手動入力
               <input name="header_text" type="text" class="basic" value="({$portal_config.header_text})" size="30" />
           </td>
           </tr>
           <tr>
           <th>最新({$WORD_COMMUNITY})書き込み</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_COMMUNITY})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})({if $smarty.const.CHECK_IMG_AUTH}) disabled="disabled" ({/if})/>({$WORD_COMMUNITY})画像を表示
           </td>
           </tr>

           <tr>
           <th>最新レビュー</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_REVIEW})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>商品画像を表示
           </td>
           </tr>

           <tr>
           <th>メンバーアクセスランキング</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_ACCESS_RANKING})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
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
           <th>({$WORD_COMMUNITY})盛り上がりランキング</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_COMMUNITY_RANKING})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})({if $smarty.const.CHECK_IMG_AUTH}) disabled="disabled" ({/if})/>({$WORD_COMMUNITY})画像を表示
           </td>
           </tr>

           <tr>
           <th>イベント予定</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_EVENT})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
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
           <th>({$portal_rss_list.1.name|default:'RSSリーダー1'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS1})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>記事画像を表示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.2.name|default:'RSSリーダー2'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS2})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>記事画像を表示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.3.name|default:'RSSリーダー3'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS3})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>記事画像を表示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.4.name|default:'RSSリーダー4'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS4})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>記事画像を表示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.5.name|default:'RSSリーダー5'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS5})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>記事画像を表示
           </td>
           </tr>

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

           <tr>
           <th>({$portal_free_area_list.5.name|default:'フリーエリア5'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE5})
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
           <th>リンク集</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_LINK})
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
