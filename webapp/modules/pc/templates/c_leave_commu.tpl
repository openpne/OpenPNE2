<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：メッセージテーブル****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_01">
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
({* #1931 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">このコミュニティから退会</span></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- ここから：メッセージ -->
({* #1931 *})<table border="0" cellspacing="1" cellpadding="5" style="width:566px;">
({* #1931 *})<tr>
({* #1931 *})<td class="bg_02" align="center">
({* #1931 *})
({* #1931 *})({$c_commu.name|default:"&nbsp;"})から本当に退会しますか？
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<table border="0" cellspacing="0" cellpadding="6" style="width:566px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td class="bg_09" align="right">
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_inc_leave_c_commu})
({* #1931 *})
({* #1931 *})<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({* #1931 *})
({* #1931 *})<input type="submit" class="input_submit" value=" は　い ">&nbsp;
({* #1931 *})
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="bg_09" align="left">
({* #1931 *})
({* #1931 *})({t_form_block _method=get m=pc a=page_c_home})
({* #1931 *})<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({* #1931 *})
({* #1931 *})&nbsp;<input type="submit" class="input_submit" value=" いいえ ">
({* #1931 *})
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：メッセージ -->
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- 無し -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：メッセージテーブル****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
