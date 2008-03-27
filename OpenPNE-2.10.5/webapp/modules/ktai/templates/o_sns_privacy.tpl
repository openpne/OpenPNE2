({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a></font><br>
</td></tr></table>

({if $c_siteadmin != ""})
({$c_siteadmin|nl2br})
({else})
ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰは、ただいま準備中です。
({/if})

({$inc_ktai_footer|smarty:nodefaults})
