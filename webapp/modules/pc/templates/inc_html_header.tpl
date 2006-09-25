<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>({$title})</title>
({if $smarty.const.SKIN_VERSION=='1.8'})
<link rel="stylesheet" href="./css/default_1_8.css?v=2.2.5" type="text/css">
({else})
<link rel="stylesheet" href="./css/default.css?v=2.2.5" type="text/css">
({/if})
<style type="text/css">
<!--
/*枠線要素*/
.border_00 { border: #({$border_00}) 1px solid ; }
.border_01 { border: #({$border_01}) 1px solid ; }
.border_02 { border: #({$border_02}) 1px solid ; }
.border_03 { border: #({$border_03}) 1px solid ; }
.border_04 { border: #({$border_04}) 1px solid ; }
.border_05 { border: #({$border_05}) 1px solid ; }
.border_06 { border: #({$border_06}) 1px solid ; }
.border_07 { border: #({$border_07}) 1px solid ; }
.border_08 { border: #({$border_08}) 1px solid ; }
.border_09 { border: #({$border_09}) 1px solid ; }
.border_10 { border: #({$border_10}) 1px solid ; }

/*背景要素*/
.bg_00 { background-color: #({$bg_00}) ; }
.bg_01 { background-color: #({$bg_01}) ; }
.bg_02 { background-color: #({$bg_02}) ; }
.bg_03 { background-color: #({$bg_03}) ; }
.bg_04 { background-color: #({$bg_04}) ; }
.bg_05 { background-color: #({$bg_05}) ; }
.bg_06 { background-color: #({$bg_06}) ; }
.bg_07 { background-color: #({$bg_07}) ; }
.bg_08 { background-color: #({$bg_08}) ; }
.bg_09 { background-color: #({$bg_09}) ; }
.bg_10 { background-color: #({$bg_10}) ; }
.bg_11 { background-color: #({$bg_11}) ; }
.bg_12 { background-color: #({$bg_12}) ; }
.bg_13 { background-color: #({$bg_13}) ; }

body { background-color: #({$bg_12}) ; }
.container { background-color: #({$bg_13}) ; }

.arrow_1 {
  width: 17px ;
  height: 14px ;
  background: url(({t_img_url_skin filename=icon_arrow_1})) 0% 100%  no-repeat ;
}
.icon_1 {
  width: 14px ;
  height: 14px ;
  background: url(({t_img_url_skin filename=icon_1})) 50% 70%  no-repeat ;
}
.icon_2 {
  width: 14px ;
  height: 14px ;
  background: url(({t_img_url_skin filename=icon_2})) 50% 70%  no-repeat ;
}
.icon_3 {
  width: 14px ;
  height: 14px ;
  background: url(({t_img_url_skin filename=icon_3})) 50% 70%  no-repeat ;
}

* { font-family: "ＭＳ Ｐゴシック", "ヒラギノ角ゴ Pro W3", Osaka, sans-serif ; }

({$inc_custom_css|smarty:nodefaults})
-->
</style>
({$inc_html_head|smarty:nodefaults})
</head>
