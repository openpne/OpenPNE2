({$inc_ktai_header|smarty:nodefaults})

<center>フリーページ</center>
<hr>
({if $c_free_page})
({$c_free_page.body|smarty:nodefaults|nl2br})
({else})
<font color=red>({$msg})</font>
({/if})
<hr>

({$inc_ktai_footer|smarty:nodefaults})