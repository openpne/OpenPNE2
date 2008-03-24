<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：一括メッセージを送る****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_01" align="center">
({* #1931 *})({*ここから：header*})
({* #1931 *})<!-- 小タイトル -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1931 *})<td style="width:528px;" class="bg_06"><span class="b_b c_00">一括メッセージを送る</span></td>
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
({* #1931 *})<td style="width:150pxpx;" class="bg_05" align="center">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})<span class="c_01">名　　前</span>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td style="width:413px;" class="bg_02">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({foreach from=$c_mail_member item=c_member})
({* #1931 *})<div>
({* #1931 *})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a><br>
({* #1931 *})</div>
({* #1931 *})({/foreach})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td class="bg_05" align="center">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})メッセージ
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td  class="bg_02">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$body|nl2br|t_url2cmd:'message'|t_cmd:'message'})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})<tr>
({* #1931 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})<td align="center" class="bg_02" colspan="3">
({* #1931 *})
({* #1931 *})<div style="padding:10px 0px;" align="center">
({* #1931 *})
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:2em;">
({* #1931 *})<tr>
({* #1931 *})<td style="width:50%;text-align:right;">
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_c_event_mail})
({* #1931 *})
({* #1931 *})<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
({* #1931 *})<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1931 *})<input type="hidden" name="c_member_ids" value="({$c_member_ids})">
({* #1931 *})<input type="hidden" name="body" value="({$body})">
({* #1931 *})({foreach from=$c_mail_member item=c_member})
({* #1931 *})<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})">
({* #1931 *})({/foreach})
({* #1931 *})<input type="submit" class="input_submit" value="　送　　　信　">&nbsp;
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td style="width:50%;text-align:left;">
({* #1931 *})
({* #1931 *})({t_form_block _method=get m=pc a=page_c_event_mail})
({* #1931 *})<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1931 *})&nbsp;<input type="submit" class="input_submit" value="　キャンセル　">
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1931 *})</tr>
({* #1931 *})({*********})
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：主内容 -->
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- 無し -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：一括メッセージを送る****** -->
({* #1939 *})<!-- ******ここから：コミュニティトップへ****** -->
({* #1939 *})<div class="content_footer" id="link_community_top" align="center">
({* #1939 *})
({* #1939 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;
({* #1939 *})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>
({* #1939 *})
({* #1939 *})</div>
({* #1939 *})<!-- ******ここまで：コミュニティトップへ****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
