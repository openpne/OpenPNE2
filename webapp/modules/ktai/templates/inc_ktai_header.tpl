({strip})
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<title>({$title})</title>
({if $is_softbank})
<style type="text/css">
*{font-size:small;}
</style>
({elseif $is_au})
<style type="text/css">
*{font-size:xx-small;}
</style>
({/if})
({$inc_ktai_html_head|smarty:nodefaults})
</head>
<body>
({/strip})
({$inc_ktai_header|smarty:nodefaults})
