({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$smarty.const.SNS_NAME})登録</a></font><br>
</td></tr></table>
新規登録するには以下のﾘﾝｸから本文をそのままにﾒｰﾙ送信を行ってください。<br>
※かならず利用規約に同意してから登録をおこなってください。
<hr color="#({$ktai_color_config.border_01})">
<center>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})?body=({$aff_id})">%%i106%%ﾒｰﾙで登録!</a><br>
</center>

<hr color="#({$ktai_color_config.border_01})">
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
■<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
