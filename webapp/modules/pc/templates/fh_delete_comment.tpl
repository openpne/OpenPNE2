<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：削除確認****** -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})<!-- *ここから：削除確認＞内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1952 *})<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">下記のコメントを削除しますか？</span></td>
({* #1952 *})<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({* #1952 *})({foreach from=$target_diary_comment_list item=target_diary_comment})
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:125px;" class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div style="padding:10px 3px;">
({* #1952 *})({$target_diary_comment.r_datetime|date_format:"%Y年%m月%d日<br />%H:%M"})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:446px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div style="padding:10px;" class="lh_120">
({* #1952 *})
({* #1952 *})<span class="b_b">({$target_diary_comment.number})</span>:
({* #1952 *})({if $target_diary_comment.nickname})
({* #1952 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_diary_comment.c_member_id})">({$target_diary_comment.nickname|default:"&nbsp;"})</a>
({* #1952 *})({else})
({* #1952 *})&nbsp;
({* #1952 *})({/if})
({* #1952 *})<br />
({* #1952 *})({$target_diary_comment.body|nl2br|default:"&nbsp;"|t_url2cmd:'diary'|t_cmd:'diary'})<br />
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({/foreach})
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">
({* #1952 *})
({* #1952 *})<div style="text-align:center;" align="center" class="padding_w_s">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:2em;">
({* #1952 *})<tr>
({* #1952 *})<td style="width:50%;text-align:right;">
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=do_fh_diary_delete_c_diary_comment})
({* #1952 *})<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})">
({* #1952 *})
({* #1952 *})({foreach from=$target_diary_comment_list item=target_diary_comment})
({* #1952 *})<input type="hidden" name="target_c_diary_comment_id[]" value="({$target_diary_comment.c_diary_comment_id})">
({* #1952 *})({/foreach})
({* #1952 *})
({* #1952 *})<input type="submit" class="input_submit" value=" は い ">&nbsp;
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:50%;text-align:left;">
({* #1952 *})
({* #1952 *})({t_form_block _method=get m=pc a=page_fh_diary})
({* #1952 *})<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">
({* #1952 *})&nbsp;<input type="submit" class="input_submit" value="いいえ">
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：主内容 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<!-- *ここまで：削除確認＞＞内容* -->
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：削除確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
