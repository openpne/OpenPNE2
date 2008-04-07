({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})</tr>
({* #1955 *})<tr>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})<td class="bg_01" align="center">
({* #1955 *})({*ここから：header*})
({* #1955 *})<!-- 小タイトル -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1955 *})<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">Todo投稿履歴</span></td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：小タイトル -->
({* #1955 *})({*ここまで：header*})
({* #1955 *})({*ここから：body*})
({* #1955 *})<!-- ここから：主内容 -->
({* #1955 *})
({* #1955 *})({if $posted_list})
({* #1955 *})<!-- ここから：主内容＞＞タブ -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td style="width:634px;" align="right" class="bg_02">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})
({* #1955 *})({if $is_prev})
({* #1955 *})<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* #1955 *})({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
({* #1955 *})&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* #1955 *})({/if})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：主内容＞＞タブ -->
({* #1955 *})<!-- ここから：主内容＞＞コメント一覧 -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})({foreach from=$posted_list item=item})
({* #1955 *})<tr>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1955 *})<td style="width:180px;" class="bg_05">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})({if $item.r_datetime})
({* #1955 *})	({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1955 *})({else})
({* #1955 *})	投稿日時記録以前のTodo
({* #1955 *})({/if})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1955 *})<td style="width:453px;" class="bg_02">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})">({$item.memo})</a>
({* #1955 *})（({if $item.member_name})
({* #1955 *})({$item.member_name})
({* #1955 *})({else})
({* #1955 *})共有Todo
({* #1955 *})({/if})
({* #1955 *})）
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})<tr>
({* #1955 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1955 *})</tr>
({* #1955 *})({*********})
({* #1955 *})({/foreach})
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：主内容＞＞コメント一覧 -->
({* #1955 *})<!-- ここから：主内容＞＞タブ -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td style="width:634px;" align="right" class="bg_02">
({* #1955 *})
({* #1955 *})<div class="padding_s">
({* #1955 *})
({* #1955 *})({if $is_prev})
({* #1955 *})<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* #1955 *})({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
({* #1955 *})&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* #1955 *})({/if})
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：主内容＞＞タブ -->
({* #1955 *})
({* #1955 *})({else})
({* #1955 *})<!-- ここから：主内容＞＞メッセージ -->
({* #1955 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1955 *})<tr>
({* #1955 *})<td align="center" class="bg_02">
({* #1955 *})
({* #1955 *})<div style="padding:10px;">
({* #1955 *})
({* #1955 *})投稿済みのTodoはありません
({* #1955 *})
({* #1955 *})</div>
({* #1955 *})
({* #1955 *})</td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* #1955 *})<!-- ここまで：主内容＞＞メッセージ -->
({* #1955 *})
({* #1955 *})({/if})
({* #1955 *})
({* #1955 *})<!-- ここまで：主内容 -->
({* #1955 *})({*ここまで：body*})
({* #1955 *})({*ここから：footer*})
({* #1955 *})<!-- 無し -->
({* #1955 *})({*ここまで：footer*})
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})</tr>
({* #1955 *})<tr>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1955 *})</tr>
({* #1955 *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
