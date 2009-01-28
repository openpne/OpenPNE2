({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$smarty.const.SNS_NAME})登録</a></font><br>
</td></tr></table>
新規登録するには以下のﾘﾝｸから本文をそのままにﾒｰﾙ送信を行ってください。<br>
※かならず利用規約に同意してから登録をおこなってください。<br>
※ﾄﾞﾒｲﾝ指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのﾒｰﾙを受信できるように指定してください。
<hr color="#({$ktai_color_config.border_01})">
<center>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})?body=({$aff_id})">[i:106]ﾒｰﾙで登録!</a><br>
</center>

<hr color="#({$ktai_color_config.border_01})">
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
({if $smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY})
■<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
