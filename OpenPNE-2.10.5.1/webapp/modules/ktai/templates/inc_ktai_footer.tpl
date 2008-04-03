({if $tail})
<table width="100%">
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
({if $page == 'h_home' || $page == 'f_home' || $page == 'c_home' || $page == 'h_prof'})
<font color="#({$ktai_color_config.font_05})"><a href="({t_url m=ktai a=page_h_home})&amp;({$tail})#top" accesskey="0"><font color="#({$ktai_color_config.font_05})">[i:134]ﾎｰﾑ</font></a> / <a href="#top"><font color="#({$ktai_color_config.font_05})">↑上へ</font></a> / <a href="#bottom" name="bottom" accesskey="8"><font color="#({$ktai_color_config.font_05})">[i:132]下へ</font></a></font><br>
({else})
<font color="#({$ktai_color_config.font_05})"><a href="({t_url m=ktai a=page_h_home})&amp;({$tail})#top" accesskey="0"><font color="#({$ktai_color_config.font_05})">[i:134]ﾎｰﾑ</font></a> / <a href="#top" accesskey="2"><font color="#({$ktai_color_config.font_05})">[i:126]上へ</font></a> / <a href="#bottom" name="bottom" accesskey="8"><font color="#({$ktai_color_config.font_05})">[i:132]下へ</font></a></font><br>
({/if})
</td></tr></table>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
</body>
</html>
