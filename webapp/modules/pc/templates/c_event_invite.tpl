<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：メッセージテーブル****** -->
({* #1952 *})({t_form_block m=pc a=do_c_event_invite})
({* #1952 *})
({* #1952 *})<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
({* #1952 *})<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_01" align="center">
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- 小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1952 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">イベントお知らせメッセージを送る</span></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- ここから：主内容 -->
({* #1952 *})<table norder="0" cellspacing="0" cellpadding="0" style="width:566px;">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:566px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td style="width:564px;" class="bg_09" align="left" colspan="3">
({* #1952 *})
({* #1952 *})<div class="padding_w_s lh_120">
({* #1952 *})
({* #1952 *})({if $c_friend_list})
({* #1952 *})このイベントを紹介したい({$WORD_MY_FRIEND})を一覧から選び、紹介メッセージを書いてください。
({* #1952 *})({else})
({* #1952 *})紹介できる({$WORD_MY_FRIEND})がいません。
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td style="width:150px;" class="bg_05">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})紹介先
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td style="width:412px;" class="bg_02" align="left" valign="middle">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})<table>
({* #1952 *})({foreach from=$c_friend_list item=c_friend})
({* #1952 *})({counter assign=_cnt})
({* #1952 *})({if $_cnt % 3 == 1})<tr>({/if})
({* #1952 *})    <td><input type="checkbox" id="m({$c_friend.c_member_id})" name="c_member_id[]" value="({$c_friend.c_member_id})" class="no_bg"></td>
({* #1952 *})    <td style="padding-right:1em"><label for="m({$c_friend.c_member_id})">({$c_friend.nickname})</label></td>
({* #1952 *})({if $_cnt % 3 == 0})</tr>({/if})
({* #1952 *})({/foreach})
({* #1952 *})({if $_cnt % 3 != 0})</tr>({/if})
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td style="width:566px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td class="bg_05" align="left">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})<span class="c_01">メッセージ (任意)</span>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td  class="bg_02">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})<textarea name="body" rows="6" cols="50"></textarea>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})<td align="center" class="bg_02" colspan="3">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})
({* #1952 *})<input type="submit" class="input_submit" value="　送　　信　">
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：主内容 -->
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})({/t_form_block})
({* #1952 *})<!-- ******ここまで：メッセージテーブル****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
