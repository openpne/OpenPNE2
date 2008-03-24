<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：メッセージテーブル****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
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
({* #1931 *})<td style="width:530px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">日記公開範囲の一括設定します</span></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- ここから：メッセージ -->
({* #1931 *})<table border="0" cellspacing="1" cellpadding="3" style="width:566px;">
({* #1931 *})<tr>
({* #1931 *})<td colspan="2" class="bg_02" align="center">
({* #1931 *})
({* #1931 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_h_set_public_flag_all})
({* #1931 *})
({* #1931 *})<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})">
({* #1931 *})
({* #1931 *})設定内容 ： ({if $public_flag_diary_all == 'private'})公開しない({elseif $public_flag_diary_all == 'friend'})({$smarty.const.WORD_MY_FRIEND})まで公開({else})全員に公開({/if})<br><br>
({* #1931 *})<input type="submit" class="input_submit" name="ok" value="一括設定">
({* #1931 *})<input type="submit" class="input_submit" value="キャンセル">
({* #1931 *})
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：メッセージ -->
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- 無し -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})</td>
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
