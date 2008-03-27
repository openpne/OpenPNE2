<div id="LayoutC">
<div id="Center">

({* #1958 *})<!-- ******ここから：マイフレンド管理****** -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1958 *})<tr>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})</tr>
({* #1958 *})<tr>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})<td class="bg_01" align="center">
({* #1958 *})<!-- *ここから：マイフレンド管理＞内容* -->
({* #1958 *})<div class="border_01">
({* #1958 *})({*ここから：header*})
({* #1958 *})<!-- ここから：小タイトル -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1958 *})<tr>
({* #1958 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1958 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$WORD_MY_FRIEND})管理</span></td>
({* #1958 *})</tr>
({* #1958 *})</table>
({* #1958 *})<!-- ここまで：小タイトル -->
({* #1958 *})({if $pager.total_num})
({* #1958 *})<!-- ここから：ページャー -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1958 *})<div style="padding:4px 3px;">
({* #1958 *})
({* #1958 *})({if $pager.prev})
({* #1958 *})<a href="({t_url m=pc a=page_h_manage_friend page=$pager.prev})">前を表示</a>&nbsp;&nbsp;
({* #1958 *})({/if})
({* #1958 *})({if $pager.total_num})
({* #1958 *})({$pager.start})件～({$pager.end})件を表示
({* #1958 *})({/if})
({* #1958 *})({if $pager.next})
({* #1958 *})&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_manage_friend page=$pager.next})">次を表示</a>
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})</td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})</table>
({* #1958 *})<!-- ここまで：ページャー -->
({* #1958 *})({/if})
({* #1958 *})({*ここまで：header*})
({* #1958 *})({*ここから：body*})
({* #1958 *})<!-- ここから：主内容 -->
({* #1958 *})({if $c_friend_list})
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})({foreach from=$c_friend_list item=item})
({* #1958 *})<tr>
({* #1958 *})<td style="width:150px;height:50px;" class="bg_03" align="center" valign="middle">
({* #1958 *})
({* #1958 *})<div class="padding_s">
({* #1958 *})
({* #1958 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
({* #1958 *})<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"><br />({$item.nickname})</a>
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})<td style="width:387px;" class="bg_02" align="left" valign="middle">
({* #1958 *})
({* #1958 *})<div class="padding_s">
({* #1958 *})
({* #1958 *})({if $item.intro})
({* #1958 *})({$item.intro|t_truncate:48:"":3})<br />
({* #1958 *})<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})">編集</a>
({* #1958 *})
({* #1958 *})<a href="({t_url m=pc a=page_f_intro_delete_confirm})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">削除</a>
({* #1958 *})({else})
({* #1958 *})<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})">紹介文を書く</a>
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})<td style="width:95px;" class="bg_02">
({* #1958 *})
({* #1958 *})<div class="padding_s">
({* #1958 *})
({* #1958 *})<a href="({t_url m=pc a=page_fh_friend_list_delete_c_friend_confilm})&amp;target_c_member_id=({$item.c_member_id})">({$WORD_MY_FRIEND})から外す</a>
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})
({* #1958 *})</td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})({/foreach})
({* #1958 *})</table>
({* #1958 *})({else})
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:636px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="height: 50px;" class="bg_03" align="center" valign="middle">
({* #1958 *})({$WORD_MY_FRIEND})登録がありません。
({* #1958 *})</td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})</table>
({* #1958 *})({/if})
({* #1958 *})<!-- ここまで：主内容 -->
({* #1958 *})({*ここまで：body*})
({* #1958 *})({*ここから：footer*})
({* #1958 *})({if $pager.total_num})
({* #1958 *})<!-- ここから：ページャー -->
({* #1958 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1958 *})<tr>
({* #1958 *})<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})<tr>
({* #1958 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1958 *})<div style="padding:4px 3px;">
({* #1958 *})
({* #1958 *})({if $pager.prev})
({* #1958 *})<a href="({t_url m=pc a=page_h_manage_friend page=$pager.prev})">前を表示</a>&nbsp;&nbsp;
({* #1958 *})({/if})
({* #1958 *})({if $pager.total_num})
({* #1958 *})({$pager.start})件～({$pager.end})件を表示
({* #1958 *})({/if})
({* #1958 *})({if $pager.next})
({* #1958 *})&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_manage_friend page=$pager.next})">次を表示</a>
({* #1958 *})({/if})
({* #1958 *})
({* #1958 *})</div>
({* #1958 *})</td>
({* #1958 *})</tr>
({* #1958 *})({*********})
({* #1958 *})</table>
({* #1958 *})<!-- ここまで：ページャー -->
({* #1958 *})({/if})
({* #1958 *})({*ここまで：footer*})
({* #1958 *})</div>
({* #1958 *})<!-- *ここまで：マイフレンド管理＞＞内容* -->
({* #1958 *})</td>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})</tr>
({* #1958 *})<tr>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1958 *})</tr>
({* #1958 *})</table>
({* #1958 *})<!-- ******ここまで：マイフレンド管理****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
