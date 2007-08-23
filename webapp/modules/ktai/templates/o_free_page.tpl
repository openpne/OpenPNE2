({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_free_page.title})</a></font><br>
</td></tr></table>

({if $c_free_page})
({$c_free_page.body|smarty:nodefaults|nl2br})
({else})
<font color="#ff0000">({$msg})</font>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
