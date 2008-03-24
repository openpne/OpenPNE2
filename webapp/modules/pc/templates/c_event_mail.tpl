<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：メッセージ送信先一覧****** -->
({* #1952 *})({t_form_block m=pc a=page_c_event_mail_confirm})
({* #1952 *})<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1952 *})<td style="width:240px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">一括メッセージを送る</span></td>
({* #1952 *})<td style="width:388px;" align="right" class="bg_06">&nbsp;</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})({if $c_event_member_list})
({* #1952 *})<table border="0" cellspacing="1" cellpadding="3" style="width:574px;">
({* #1952 *})<tr>
({* #1952 *})<td class="bg_05" align="center">
({* #1952 *})
({* #1952 *})<span class="c_01">名　　前</span>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td  class="bg_02">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="1" cellpadding="0">
({* #1952 *})({foreach from=$c_event_member_list item=c_member})
({* #1952 *})<tr>
({* #1952 *})<td>
({* #1952 *})
({* #1952 *})<input type="checkbox" name="c_member_id[]" value="({$c_member.c_member_id})" checked="checked" class="no_bg">
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})">({$c_member.nickname})</a></td>
({* #1952 *})</tr>
({* #1952 *})({/foreach})
({* #1952 *})</table>
({* #1952 *})</td></tr>
({* #1952 *})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_05" align="center">
({* #1952 *})
({* #1952 *})<span class="c_01">メッセージ</span>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td  class="bg_02">
({* #1952 *})
({* #1952 *})<textarea name="body" rows="8" cols="40"></textarea>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="bg_02" colspan="2">
({* #1952 *})
({* #1952 *})<br>
({* #1952 *})<input type="submit" class="input_submit" value="　確認画面　">
({* #1952 *})<br><br>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})({else})
({* #1952 *})<table border="0" cellspacing="1" cellpadding="3" style="width:574px;">
({* #1952 *})<tr>
({* #1952 *})<td class="bg_05" align="center">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})送信するメンバーがいません。
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})({/if})
({* #1952 *})<!-- ここまで：主内容 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})({/t_form_block})
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：メッセージ送信先一覧****** -->
({* #1939 *})<!-- ******ここから：コミュニティトップへ****** -->
({* #1939 *})<div class="content_footer" id="link_community_top" align="center">
({* #1939 *})
({* #1939 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})">イベントページへ戻る</a>
({* #1939 *})
({* #1939 *})</div>
({* #1939 *})<!-- ******ここまで：コミュニティトップへ****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
