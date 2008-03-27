<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>携帯メールアドレスを登録する</h3></div>
<div class="partsInfo">
<p>携帯メールアドレスを登録すると、携帯から日記・コミュニティ・あしあとの閲覧・書き込みなどがおこなえます。登録手順は以下の通りです。</p>
<ol>
<li>１．以下の欄に携帯メールアドレスを記入して「送信」ボタンを押してください。</li>
<li>２．記入したメールアドレス宛に「({$SNS_NAME})」よりメールが届きます。</li>
<li>３．メール内に記載されたURLよりアクセスして、ログインしてください。</li>
</ol>
<p>※ドメイン指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのメールを受信できるように指定してください。</p>
<p>※既に携帯メールアドレスが登録されている場合、新しいメールアドレスに変更されます。</p>
</div>
({t_form_block m=pc a=do_h_config_ktai_send})
<table>
<tr>
<th>携帯メールアドレス</th>
<td>
<input type="text" class="input_text" name="ktai_address" value="({$form_val.mail})" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="送信" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $ktai && ($smarty.const.IS_GET_EASY_ACCESS_ID != 3 && $smarty.const.IS_GET_EASY_ACCESS_ID != 2)})
({* {{{ *})
({* #1927 *})
({* #1927 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
({* #1927 *})<tr>
({* #1927 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})</tr>
({* #1927 *})<tr>
({* #1927 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})<td class="bg_01" align="center">
({* #1927 *})<!-- *ここから：日記を書く＞内容* -->
({* #1927 *})({*ここから：header*})
({* #1927 *})<!-- ここから：小タイトル -->
({* #1927 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1927 *})<tr>
({* #1927 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1927 *})<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">登録携帯メールアドレスを削除する</span></td>
({* #1927 *})</tr>
({* #1927 *})</table>
({* #1927 *})<!-- ここまで：小タイトル -->
({* #1927 *})({*ここまで：header*})
({* #1927 *})({*ここから：body*})
({* #1927 *})<!-- ここから：主内容 -->
({* #1927 *})<div class="border_01 bg_09" align="center">
({* #1927 *})
({* #1927 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1927 *})
({* #1927 *})<div style="width:528px;padding:30px 10px;margin:0px auto;" class="border_01 bg_03">
({* #1927 *})
({* #1927 *})現在登録されている携帯メールアドレスを削除します
({* #1927 *})
({* #1927 *})
({* #1927 *})({t_form_block m=pc a=page_h_delete_ktai})
({* #1927 *})<input type="submit"  class="input_submit" value="　削除　" />
({* #1927 *})({/t_form_block})
({* #1927 *})</div>
({* #1927 *})
({* #1927 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1927 *})
({* #1927 *})</div>
({* #1927 *})<!-- ここまで：主内容 -->
({* #1927 *})({*ここまで：body*})
({* #1927 *})({*ここから：footer*})
({* #1927 *})<!-- 無し -->
({* #1927 *})({*ここまで：footer*})
({* #1927 *})<!-- *ここまで：日記を書く＞＞内容* -->
({* #1927 *})</td>
({* #1927 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})</tr>
({* #1927 *})<tr>
({* #1927 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1927 *})</tr>
({* #1927 *})</table>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
