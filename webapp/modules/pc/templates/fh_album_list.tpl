<div id="LayoutB">

({if $type == 'h'})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_fh_album_list})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
<li><input type="submit" class="input_submit" value="アルバム検索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新のアルバム</h3></div>
<ul class="list">
({foreach from=$target_album_subject_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
</div> <!--parts sideNav-->
({* }}} *})

</div><!-- Left -->

<div id="Center">

({*ここから：アルバムを追加*})
({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>マイアルバム</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_album_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="アルバムを追加" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})
({*ここまで：アルバムを追加*})

({* #1948 *})({*ここから：アルバム一覧*})
({* #1948 *})({if $target_album_list})
({* #1948 *})<div class="dparts commentList">
({* #1948 *})<div class="parts">
({* #1948 *})
({* #1948 *})<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})さん({/if})のアルバム</h3></div>
({* #1948 *})<div class="pagerRelative">
({* #1948 *})({if $is_prev})
({* #1948 *})<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
({* #1948 *})({/if})
({* #1948 *})<p class="number">
({* #1948 *})({$total_num})件中
({* #1948 *})({strip})
({* #1948 *})({$page*$page_size-$page_size+1})件～
({* #1948 *})({if $page_size > $diary_list_count})
({* #1948 *})({$album_list_count+$page*$page_size-$page_size})
({* #1948 *})({else})
({* #1948 *})({$page*$page_size})
({* #1948 *})({/if})
({* #1948 *})件を表示
({* #1948 *})({/strip})
({* #1948 *})</p>
({* #1948 *})({if $is_next})
({* #1948 *})<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({* #1948 *})({/if})
({* #1948 *})</div> <!-- pagerRelative -->
({* #1948 *})
({* #1948 *})({foreach from=$target_album_list item=item})
({* #1948 *})<table border="0" cellspacing="0" cellpadding="0" style="width:524px;" class="border_01">
({* #1948 *})    <tr>
({* #1948 *})        <td style="width:190px;padding:2px;" valign="top" rowspan="9" align="center" class="bg_02">
({* #1948 *})        <span class="padding_s">
({* #1948 *})            <a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})"></a>
({* #1948 *})        </span>
({* #1948 *})        </td>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">タイトル</td>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.subject})</td>
({* #1948 *})    </tr>
({* #1948 *})    <tr>
({* #1948 *})        <td style="height:1px;" class="bg_01" colspan="5">
({* #1948 *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})    </tr>
({* #1948 *})    <tr>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">アルバムの説明</td>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td colspan="2" class="bg_02" style="width:240px;padding:2px;">({$item.description})</td>
({* #1948 *})    </tr>
({* #1948 *})    <tr>
({* #1948 *})        <td style="height:1px;" class="bg_01" colspan="5">
({* #1948 *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})    </tr>
({* #1948 *})    <tr>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">公開範囲</td>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td colspan=2 class="bg_02" style="width:240px;padding:2px;">
({* #1948 *})        <div style="padding:3px 2px;">
({* #1948 *})        ({if $item.public_flag == "public"})
({* #1948 *})        （全員に公開）
({* #1948 *})        ({elseif $item.public_flag == "friend"})
({* #1948 *})        （({$WORD_MY_FRIEND})まで公開）
({* #1948 *})        ({elseif $item.public_flag == "private"})
({* #1948 *})        （公開しない）
({* #1948 *})        ({/if})
({* #1948 *})        </div>
({* #1948 *})        </td>
({* #1948 *})    </tr>
({* #1948 *})    <tr>
({* #1948 *})        <td style="height:1px;" class="bg_01" colspan=5>
({* #1948 *})        <img src="./skin/dummy.gif" style="height:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})    </tr>
({* #1948 *})
({* #1948 *})    <tr>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td align="left" class="bg_02" style="width:75px;padding:2px;">作成日時</td>
({* #1948 *})        <td style="width:1px;" class="bg_01">
({* #1948 *})        <img src="./skin/dummy.gif" style="width:1px;" class="dummy">
({* #1948 *})        </td>
({* #1948 *})        <td class="bg_02" style="padding:2px;">({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
({* #1948 *})        <td align="center" class="bg_02"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" /></a></td>
({* #1948 *})    </tr>
({* #1948 *})</table>
({* #1948 *})({/foreach})
({* #1948 *})</table>


<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=-1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">前を表示</a></p>
({/if})
<p class="number">
({$total_num})件中
({strip})
({$page*$page_size-$page_size+1})件～
({if $page_size > $diary_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
({/strip})
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;direc=1&amp;page=({$page})({if $target_c_album_id})&amp;target_c_album_id=({$target_album_id})({/if})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">次を表示</a></p>
({/if})
</div> <!-- pagerRelative -->

</div> <!-- dparts commentList -->
</div> <!-- parts -->
({/if})
({*ここまで：アルバム一覧*})


</div><!-- Center -->
</div><!-- LayoutB -->
