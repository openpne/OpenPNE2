({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ｴﾗｰ</a></font><br>
</td></tr></table>
({foreach from=$errors item=item})
({$item|smarty:nodefaults})<br>
({/foreach})
({$inc_ktai_footer|smarty:nodefaults})