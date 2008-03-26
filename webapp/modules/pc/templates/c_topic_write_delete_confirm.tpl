<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：削除確認****** -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})<!-- *ここから：削除確認＞内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1952 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">下記の書き込みを削除しますか？</span></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:566px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td style="width:95px;" class="bg_05" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})&nbsp;
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td style="width:468px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s lh_120">
({* #1952 *})
({* #1952 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a><br>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})({if $c_commu_topic_comment.image_filename1 || $c_commu_topic_comment.image_filename2 || $c_commu_topic_comment.image_filename3 })
({* #1952 *})<div class="padding_s">
({* #1952 *})({if $c_commu_topic_comment.image_filename1})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename1 w=120 h=120})"></span>({/if})
({* #1952 *})({if $c_commu_topic_comment.image_filename2})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename2 w=120 h=120})"></span>({/if})
({* #1952 *})({if $c_commu_topic_comment.image_filename3})<span class="padding_s"><img src="({t_img_url filename=$c_commu_topic_comment.image_filename3 w=120 h=120})"></span>({/if})
({* #1952 *})</div>
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})<div class="padding_s lh_120">
({* #1952 *})
({* #1952 *})({$c_commu_topic_comment.body|nl2br|t_url2cmd:'community'|t_cmd:'community'})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td class="bg_03" align="center" valign="middle" colspan="3">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
({* #1952 *})<tr>
({* #1952 *})<td style="width:50%;" align="right">
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic_comment})
({* #1952 *})
({* #1952 *})<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})">
({* #1952 *})&nbsp;<input type="submit" class="input_submit" value=" は い ">&nbsp;
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:50%;" align="left">
({* #1952 *})
({* #1952 *})({t_form_block _method=get m=pc a=page_c_topic_detail})
({* #1952 *})<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1952 *})&nbsp;<input type="submit" class="input_submit" value="いいえ">&nbsp;
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
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
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：削除確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
