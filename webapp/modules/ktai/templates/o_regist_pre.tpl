({$inc_ktai_header|smarty:nodefaults})

<center>({$SNS_NAME})登録</center>
<hr>
※かならず利用規約に同意してから登録をおこなってください。<br>
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
■<a href="({t_url m=ktai a=page_o_sns_privacy})">プライバシーポリシー</a><br>
<br>
初めて使う方は以下のリンクから登録できます。<br>
<a href="({t_url m=ktai a=page_o_regist_input})&amp;ses=({$ses})({if $aff_id})&amp;aff_id=({$aff_id})({/if})">新規登録</a><br>
<br>
<hr>
◆<a href="({t_url m=ktai a=page_o_login})">すでに登録済みの方はこちら</a>

({$inc_ktai_footer|smarty:nodefaults})