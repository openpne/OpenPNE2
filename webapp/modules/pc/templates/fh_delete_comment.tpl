<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：削除確認****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_01" align="center">
({* #1931 *})<!-- *ここから：削除確認＞内容* -->
({* #1931 *})({*ここから：header*})
({* #1931 *})<!-- ここから：小タイトル -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1931 *})<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">下記のコメントを削除しますか？</span></td>
({* #1931 *})<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- ここから：主内容 -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({* #1931 *})({foreach from=$target_diary_comment_list item=target_diary_comment})
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:125px;" class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div style="padding:10px 3px;">
({* #1931 *})({$target_diary_comment.r_datetime|date_format:"%Y年%m月%d日<br>%H:%M"})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:446px;" class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div style="padding:10px;" class="lh_120">
({* #1931 *})
({* #1931 *})<span class="b_b">({$target_diary_comment.number})</span>:
({* #1931 *})({if $target_diary_comment.nickname})
({* #1931 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_diary_comment.c_member_id})">({$target_diary_comment.nickname|default:"&nbsp;"})</a>
({* #1931 *})({else})
({* #1931 *})&nbsp;
({* #1931 *})({/if})
({* #1931 *})<br>
({* #1931 *})({$target_diary_comment.body|nl2br|default:"&nbsp;"|t_url2cmd:'diary'|t_cmd:'diary'})<br>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({/foreach})
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">
({* #1931 *})
({* #1931 *})<div style="text-align:center;" align="center" class="padding_w_s">
({* #1931 *})
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:2em;">
({* #1931 *})<tr>
({* #1931 *})<td style="width:50%;text-align:right;">
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_fh_diary_delete_c_diary_comment})
({* #1931 *})<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})">
({* #1931 *})
({* #1931 *})({foreach from=$target_diary_comment_list item=target_diary_comment})
({* #1931 *})<input type="hidden" name="target_c_diary_comment_id[]" value="({$target_diary_comment.c_diary_comment_id})">
({* #1931 *})({/foreach})
({* #1931 *})
({* #1931 *})<input type="submit" class="input_submit" value=" は い ">&nbsp;
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:50%;text-align:left;">
({* #1931 *})
({* #1931 *})({t_form_block _method=get m=pc a=page_fh_diary})
({* #1931 *})<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">
({* #1931 *})&nbsp;<input type="submit" class="input_submit" value="いいえ">
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：主内容 -->
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- 無し -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})<!-- *ここまで：削除確認＞＞内容* -->
({* #1931 *})</td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：削除確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
