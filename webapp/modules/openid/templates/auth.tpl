<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="openid.server" href="({$smarty.const.OPENPNE_URL})?m=openid&a=page_auth" />
</head>

<body>
認証を許可しますか？

({t_form m=openid a=do_confirm})
<input type="hidden" name="openid.assoc_handle" value="({$smarty.get.openid_assoc_handle})">
<input type="hidden" name="openid_identity" value="({$smarty.get.openid_identity})">
<input type="hidden" name="openid_mode" value="({$smarty.get.openid_mode})">
<input type="hidden" name="openid_return" value="({$smarty.get.openid_return})">
<input type="hidden" name="openid_sreg_optional" value="({$smarty.get.openid_sreg_optional})">
<input type="hidden" name="openid_trust_root" value="({$smarty.get.openid_trust_root})">
<input type="hidden" name="id" value="({$id})">
<input type="submit" class="submit" value="　許可　">
</form>
<form action="./" method="get">
<input type="submit" class="submit" value="　拒否　">
</form>
</body>
</html>
