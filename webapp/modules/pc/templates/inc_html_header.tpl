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

/*ボタンに対する背景画像の指定*/
input.submit {
	background: #DADCE6 url(({t_img_url_skin filename=bg_button})) 50% 0 repeat-x ;
}

({if $smarty.const.OPENPNE_ENABLE_ROLLOVER})
/*ページヘッダロールオーバー設定*/
div.inc_page_header div.navi_global a.navi_global_1:active ,
div.inc_page_header div.navi_global a.navi_global_1:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) 0 -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_2:active ,
div.inc_page_header div.navi_global a.navi_global_2:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -90px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_3:active ,
div.inc_page_header div.navi_global a.navi_global_3:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -180px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_4:active ,
div.inc_page_header div.navi_global a.navi_global_4:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -288px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_5:active ,
div.inc_page_header div.navi_global a.navi_global_5:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -360px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_6:active ,
div.inc_page_header div.navi_global a.navi_global_6:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -432px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_7:active ,
div.inc_page_header div.navi_global a.navi_global_7:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -504px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_8:active ,
div.inc_page_header div.navi_global a.navi_global_8:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -576px -70px no-repeat ;
}

div.inc_page_header div.navi_global a.navi_global_9:active ,
div.inc_page_header div.navi_global a.navi_global_9:hover {
	background: url(({t_img_url_skin filename=skin_after_header_2})) -648px -70px no-repeat ;
}

/*h系ナビロールオーバー設定*/
.inc_navi div.h a.navi_h_1:active ,
.inc_navi div.h a.navi_h_1:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) 0 0 no-repeat ;
}

.inc_navi div.h a.navi_h_2:active ,
.inc_navi div.h a.navi_h_2:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -80px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_3:active ,
.inc_navi div.h a.navi_h_3:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -160px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_4:active ,
.inc_navi div.h a.navi_h_4:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -240px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_5:active ,
.inc_navi div.h a.navi_h_5:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -320px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_6:active ,
.inc_navi div.h a.navi_h_6:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -400px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_7:active ,
.inc_navi div.h a.navi_h_7:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -480px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_8:active ,
.inc_navi div.h a.navi_h_8:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -560px 0 no-repeat ;
}

.inc_navi div.h a.navi_h_9:active ,
.inc_navi div.h a.navi_h_9:hover {
	background: url(({t_img_url_skin filename=skin_navi_h_2})) -640px 0 no-repeat ;
}

/*f系ナビロールオーバー設定*/
.inc_navi div.f a.navi_f_1:active ,
.inc_navi div.f a.navi_f_1:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) 0 0 no-repeat ;
}

.inc_navi div.f a.navi_f_2:active ,
.inc_navi div.f a.navi_f_2:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -80px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_3:active ,
.inc_navi div.f a.navi_f_3:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -160px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_4:active ,
.inc_navi div.f a.navi_f_4:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -240px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_5:active ,
.inc_navi div.f a.navi_f_5:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -320px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_6:active ,
.inc_navi div.f a.navi_f_6:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -400px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_7:active ,
.inc_navi div.f a.navi_f_7:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -480px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_8:active ,
.inc_navi div.f a.navi_f_8:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -560px 0 no-repeat ;
}

.inc_navi div.f a.navi_f_9:active ,
.inc_navi div.f a.navi_f_9:hover {
	background: url(({t_img_url_skin filename=skin_navi_f_2})) -640px 0 no-repeat ;
}

/*c系ナビロールオーバー設定*/
.inc_navi div.c a.navi_c_1:active ,
.inc_navi div.c a.navi_c_1:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) 0 0 no-repeat ;
}

.inc_navi div.c a.navi_c_2:active ,
.inc_navi div.c a.navi_c_2:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) -120px 0 no-repeat ;
}

.inc_navi div.c a.navi_c_3:active ,
.inc_navi div.c a.navi_c_3:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) -240px 0 no-repeat ;
}

.inc_navi div.c a.navi_c_4:active ,
.inc_navi div.c a.navi_c_4:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) -360px 0 no-repeat ;
}

.inc_navi div.c a.navi_c_5:active ,
.inc_navi div.c a.navi_c_5:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) -480px 0 no-repeat ;
}

.inc_navi div.c a.navi_c_6:active ,
.inc_navi div.c a.navi_c_6:hover {
	background: url(({t_img_url_skin filename=skin_navi_c_2})) -600px 0 no-repeat ;
}
({/if})

-->
</style>
({$inc_html_head|smarty:nodefaults})
</head>
