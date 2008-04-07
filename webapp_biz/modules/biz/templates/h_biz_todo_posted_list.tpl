({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})({*ここから：header*})
({* unknown *})<!-- 小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">Todo投稿履歴</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})
({* unknown *})({if $posted_list})
({* unknown *})<!-- ここから：主内容＞＞タブ -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:634px;" align="right" class="bg_02">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({if $is_prev})
({* unknown *})<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* unknown *})({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
({* unknown *})&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞タブ -->
({* unknown *})<!-- ここから：主内容＞＞コメント一覧 -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({foreach from=$posted_list item=item})
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:180px;" class="bg_05">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})({if $item.r_datetime})
({* unknown *})	({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* unknown *})({else})
({* unknown *})	投稿日時記録以前のTodo
({* unknown *})({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})<td style="width:453px;" class="bg_02">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item.biz_todo_id})">({$item.memo})</a>
({* unknown *})（({if $item.member_name})
({* unknown *})({$item.member_name})
({* unknown *})({else})
({* unknown *})共有Todo
({* unknown *})({/if})
({* unknown *})）
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* unknown *})</tr>
({* unknown *})({*********})
({* unknown *})({/foreach})
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞コメント一覧 -->
({* unknown *})<!-- ここから：主内容＞＞タブ -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:634px;" align="right" class="bg_02">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({if $is_prev})
({* unknown *})<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({* unknown *})({/if})({$pager.start})件～({$total_num})件を表示({if $is_next})
({* unknown *})&nbsp;&nbsp;<a href="({t_url m=biz a=page_h_diary_list_friend})&amp;page=({$page})&amp;direc=1">次を表示</a>
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞タブ -->
({* unknown *})
({* unknown *})({else})
({* unknown *})<!-- ここから：主内容＞＞メッセージ -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td align="center" class="bg_02">
({* unknown *})
({* unknown *})<div style="padding:10px;">
({* unknown *})
({* unknown *})投稿済みのTodoはありません
({* unknown *})
({* unknown *})</div>
({* unknown *})
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞メッセージ -->
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
