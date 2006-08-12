({$inc_ktai_header|smarty:nodefaults})

<font color="red">エラー</font>
<hr>
({foreach from=$errors item=item})
({$item|smarty:nodefaults})<br>
({/foreach})

<hr>

({$inc_ktai_footer|smarty:nodefaults})