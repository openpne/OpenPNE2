({if $tail})
<table width="100%">
<tr><td align="center" bgcolor="#0d6ddf">
({if $page == 'h_home' || $page == 'f_home' || $page == 'c_home'})
<font color="#eeeeee"><a href="({t_url m=ktai a=page_h_home})&amp;({$tail})#top" accesskey="0"><font color="#eeeeee">%%i134%%ﾎｰﾑ</font></a> / <a href="#top"><font color="#eeeeee">↑上へ</font></a> / <a href="#bottom" name="bottom" accesskey="8"><font color="#eeeeee">%%i132%%下へ</font></a></font><br>
({else})
<font color="#eeeeee"><a href="({t_url m=ktai a=page_h_home})&amp;({$tail})#top" accesskey="0"><font color="#eeeeee">%%i134%%ﾎｰﾑ</font></a> / <a href="#top" accesskey="2"><font color="#eeeeee">%%i126%%上へ</font></a> / <a href="#bottom" name="bottom" accesskey="8"><font color="#eeeeee">%%i132%%下へ</font></a></font><br>
({/if})
</td></tr></table>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
</body>
</html>
