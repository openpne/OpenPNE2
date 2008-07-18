({strip})
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<title>({$title})</title>
({if $smarty.const.OPENPNE_IS_SET_KTAI_FONT_SIZE})
({if $is_softbank})
<style type="text/css">
*{font-size:small;}
</style>
({elseif $is_au})
<style type="text/css">
*{font-size:xx-small;}
</style>
({/if})
({/if})
({$inc_ktai_html_head|smarty:nodefaults})
</head>
<body({if !($is_docomo && $ktai_color_config.font_01 == "000000")}) text="#({$ktai_color_config.font_01})"({/if}) bgcolor="#({$ktai_color_config.bg_01})" link="#({$ktai_color_config.font_02})" ({if $is_docomo})alink="#({$ktai_color_config.font_03})"({/if}) vlink="#({$ktai_color_config.font_04})">
({/strip})
({$inc_ktai_header|smarty:nodefaults})
