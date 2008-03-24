<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：削除確認****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_01" align="center">
({* #1931 *})<!-- *ここから：削除確認＞内容* -->
({* #1931 *})({*ここから：header*})
({* #1931 *})<!-- ここから：小タイトル -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1931 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">下記の書き込みを削除しますか？</span></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- ここから：主内容 -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:566px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:95px;" class="bg_05" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})&nbsp;
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:468px;" class="bg_02" align="left" valign="middle">
({* #1931 *})
({* #1931 *})<div class="padding_s lh_120">
({* #1931 *})
({* #1931 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a><br>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})({if $c_commu_topic_comment.image_filename1 || $c_commu_topic_comment.image_filename2 || $c_commu_topic_comment.image_filename3 })
({* #1931 *})<div class="padding_s">
({* #1931 *})({if $c_commu_topic_comment.image_filename1})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename1 w=120 h=120})"></span>({/if})
({* #1931 *})({if $c_commu_topic_comment.image_filename2})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename2 w=120 h=120})"></span>({/if})
({* #1931 *})({if $c_commu_topic_comment.image_filename3})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename3 w=120 h=120})"></span>({/if})
({* #1931 *})</div>
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})<div class="padding_s lh_120">
({* #1931 *})
({* #1931 *})({$c_commu_topic_comment.body|nl2br|t_url2cmd:'community'|t_cmd:'community'})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_03" align="center" valign="middle" colspan="3">
({* #1931 *})
({* #1931 *})<div class="padding_w_m">
({* #1931 *})
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
({* #1931 *})<tr>
({* #1931 *})<td style="width:50%;" align="right">
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic_comment})
({* #1931 *})
({* #1931 *})<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})">
({* #1931 *})&nbsp;<input type="submit" class="input_submit" value=" は い ">&nbsp;
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:50%;" align="left">
({* #1931 *})
({* #1931 *})({t_form_block _method=get m=pc a=page_c_topic_detail})
({* #1931 *})<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1931 *})&nbsp;<input type="submit" class="input_submit" value="いいえ">&nbsp;
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})</td>
({* #1931 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：削除確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
