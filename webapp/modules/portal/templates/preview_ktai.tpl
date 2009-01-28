<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<title>【プレビュー】({$title})</title>
<style type="text/css">
* { font-size: small;}
body { margin: 0; padding: 0; text-align: center;}
a img { border: none;}
table, td { margin: 0; padding: 0; border: 0;}
table { border-collapse: collapse; border-spacing: 0px;}
div#Outline {
    width: 250px;
    margin: 0 auto;
}
div#Content {
    text-align:left;
    border: solid 5px #cccccc;
    overflow: hidden;
    word-break: break-all;
}
input.input_text {
    background-color: #ffffff;
    border: solid 1px #000000;
    width: 238px;
}
hr.colored {
    color: #({$ktai_color_config.bg_01});
    border: solid 1px #({$ktai_color_config.bg_01});
    border-top-color: #({$ktai_color_config.border_01});
}
</style>
<script type="text/javascript">
function dummyAlert() { alert('プレビューページからは操作できません'); }
</script>
({$inc_ktai_html_head|smarty:nodefaults})
</head>
<body text="#({$ktai_color_config.font_01})" bgcolor="#({$ktai_color_config.bg_01})" link="#({$ktai_color_config.font_02})" alink="#({$ktai_color_config.font_03})" vlink="#({$ktai_color_config.font_04})">
<div id="Outline">
<div id="Content">

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})
<table width="100%">
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
<tr><td align="center">
<img src="({t_img_url_skin filename=skin_ktai_header w=240 h=320 f=jpg})" alt="({$smarty.const.SNS_NAME})"><br>
</td></tr>
({else})
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$smarty.const.SNS_NAME})</font><br>
</td></tr>
({/if})
</table>
({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})
<br>

({foreach from=$top item=data})
({ext_include file="inc_portal_Contents_Layout_ktai.tpl"})
({/foreach})

<center>
このﾍﾟｰｼﾞをﾌﾞｯｸﾏｰｸしてください<br>
</center>
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
[i:75]<font color="#({$ktai_color_config.font_05})">かんたんﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
<br>
<center>
<input type="submit" value="かんたんﾛｸﾞｲﾝ" onclick="dummyAlert()"><br>
</center>
<br>
<a href="javascript:dummyAlert()">&gt;&gt;かんたんﾛｸﾞｲﾝとは</a><br>
</td></tr></table>
<br>

<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">[i:116]ﾊﾟｽﾜｰﾄﾞﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})
<font color="#({$ktai_color_config.bg_02})">★</font>携帯ﾒｰﾙｱﾄﾞﾚｽ<br>
({else})
<font color="#({$ktai_color_config.bg_02})">★</font>ﾛｸﾞｲﾝID<br>
({/if})
<input class="input_text" type="text" name="username" value="" disabled><br>
<font color="#({$ktai_color_config.bg_02})">★</font>ﾊﾟｽﾜｰﾄﾞ<br>
<input class="input_text" name="password" type="text" value="" disabled><br>
<center>
<input type="submit" value="ﾛｸﾞｲﾝ" onclick="dummyAlert()"><br>
</center>
<a href="javascript:dummyAlert()">&gt;&gt;ﾊﾟｽﾜｰﾄﾞを忘れた方</a><br>
</td></tr></table>
<br>

({foreach from=$bottom item=data})
({ext_include file="inc_portal_Contents_Layout_ktai.tpl"})
({/foreach})

({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
<hr class="colored">
■<a href="javascript:dummyAlert()">新規登録について</a><br>
({/if})
({elseif $IS_CLOSED_SNS})
<hr class="colored">
({$SNS_NAME})は招待制のｿｰｼｬﾙﾈｯﾄﾜｰｷﾝｸﾞｻｰﾋﾞｽです。<br>
登録には({$SNS_NAME})({if $smarty.const.IS_USER_INVITE})参加者({else})管理者({/if})からの招待が必要です。<br>

({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})

新規登録はPCからおこなってください。<br>

({else})

新規登録するには以下のﾘﾝｸから、本文を入力せずにﾒｰﾙを送信してください。<br>
<br>
<a href="javascript:dummyAlert()">[i:106]ﾒｰﾙで登録!</a><br>
<br>
※かならず利用規約に同意してから登録をおこなってください。<br>
※ﾄﾞﾒｲﾝ指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのﾒｰﾙを受信できるように指定してください。<br>

<hr class="colored">
■<a href="javascript:dummyAlert()">利用規約</a><br>
■<a href="javascript:dummyAlert()">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
({/if})

</div>
</div>
({$inc_ktai_footer|smarty:nodefaults})
