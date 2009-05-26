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

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>OpenIDによるログイン失敗</h3></div>
<div class="block">
<p>ログイン中のメンバーのURLではありません。<br />
({$requests.openid_trust_root})</p>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url})">[({$smarty.const.SNS_NAME})] ホームへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->

<div id="Footer">
</div>

</div><!-- Container -->
</div><!-- Body -->
</body>
</html>
