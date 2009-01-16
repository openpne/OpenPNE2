<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>({if $smarty.const.SNS_TITLE})({$smarty.const.SNS_TITLE})({else})({$smarty.const.SNS_NAME})({/if})</title>
({t_url_style})
</head>
<body><div id="Body">
<div id="Container">

<div id="Header">
<div id="globalNavBefore">
<h1><a href="({t_url})">({$smarty.const.SNS_NAME})</a></h1>
</div><!-- globalNav -->
</div><!-- Header -->

<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>OpenIDによるログイン確認</h3></div>
<div class="block">
<p>以下のサイトへOpenIDでログインしようとしています。<br />
({$trust_root})</p>
<ul class="moreInfo button">
<li>
({t_form_block m=openid a=do_server_confirm})
<input type="submit" class="input_submit" value="　許　可　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc})
<input type="submit" class="input_submit" value="　拒　否　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->

<div id="Footer">
</div>

</div><!-- Container -->
</div><!-- Body -->
</body>
</html>
