<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>({if $smarty.const.SNS_TITLE})({$smarty.const.SNS_TITLE})({else})({$smarty.const.SNS_NAME})({/if})</title>
<link rel="openid.server" href="({t_url _absolute=1 m=openid a=do_server})" />
</head>
<body>
<p>
({$smarty.const.SNS_NAME})<br />
<a href="({$smarty.const.OPENPNE_URL})">({$smarty.const.OPENPNE_URL})</a>
</p>
</body>
</html>
