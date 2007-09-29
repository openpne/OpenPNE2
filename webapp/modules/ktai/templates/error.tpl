({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ｴﾗｰ</a></font><br>
</td></tr></table>
({foreach from=$errors item=item})
({$item|smarty:nodefaults})<br>
({/foreach})
({$inc_ktai_footer|smarty:nodefaults})