({***************************************})
({**ここから：旧inc_html_header.tplの内容**})
({***************************************})
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
({$INC_HEADER_inc_html_head|smarty:nodefaults})
<meta http-equiv="Content-Style-Type" content="text/css">
<title>({$INC_HEADER_title})</title>
<link rel="stylesheet" href="./css/default.css" type="text/css">
<script type="text/javascript" src="./js/prototype.js"></script>
<script type="text/javascript" src="./js/pne.js"></script>
<style type="text/css">
<!--
/*枠線要素*/
.border_01 { border: #({$INC_HEADER_color_config.border_01}) 1px solid ; }
.border_07 { border: #({$INC_HEADER_color_config.border_07}) 1px solid ; }
.border_10 { border: #({$INC_HEADER_color_config.border_10}) 1px solid ; }

/*背景要素*/
.bg_00 { background-color: #({$INC_HEADER_color_config.bg_00}) ; }
.bg_01 { background-color: #({$INC_HEADER_color_config.bg_01}) ; }
.bg_02 { background-color: #({$INC_HEADER_color_config.bg_02}) ; }
.bg_03 { background-color: #({$INC_HEADER_color_config.bg_03}) ; }
.bg_04 { background-color: #({$INC_HEADER_color_config.bg_04}) ; }
.bg_05 { background-color: #({$INC_HEADER_color_config.bg_05}) ; }
.bg_06 { background-color: #({$INC_HEADER_color_config.bg_06}) ; }
.bg_07 { background-color: #({$INC_HEADER_color_config.bg_07}) ; }
.bg_08 { background-color: #({$INC_HEADER_color_config.bg_08}) ; }
.bg_09 { background-color: #({$INC_HEADER_color_config.bg_09}) ; }
.bg_10 { background-color: #({$INC_HEADER_color_config.bg_10}) ; }
.bg_11 { background-color: #({$INC_HEADER_color_config.bg_11}) ; }
.bg_12 { background-color: #({$INC_HEADER_color_config.bg_12}) ; }
.bg_13 { background-color: #({$INC_HEADER_color_config.bg_13}) ; }
.bg_14 { background-color: #({$INC_HEADER_color_config.bg_14}) ; }
.color_19 { background-color: #({$INC_HEADER_color_config.color_19}) ; }

body { background-color: #({$INC_HEADER_color_config.bg_12}) ; }
.container { background-color: #({$INC_HEADER_color_config.bg_13}) ; }

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

* { font-family: "Hiragino Kaku Gothic Pro", "Hiragino Kaku Ghothic Pro W3", "ヒラギノ角ゴ Pro W3",({* "メイリオ", Meiryo,*}) "ＭＳ Ｐゴシック", Osaka, sans-serif ; }

/*ここから：safari1.xパスワードフォーム非表示対策*/
html:\66irst-child input[type="password"] { font-family: "Lucida Grande", "Hiragino Kaku Gothic Pro", "Hiragino Kaku Ghothic Pro W3", "ヒラギノ角ゴ Pro W3",sans-serif,"Osaka" ; }
/*ここまで：safari1.xパスワードフォーム非表示対策*/

/*テキスト入力欄のフォーカス時のクラス*/
.text       { background-color:#F8F8F8; }
.text_focus { background-color:#FFFFFF; }


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

({$INC_HEADER_inc_custom_css|smarty:nodefaults})

-->
</style>
<script type="text/javascript">
<!--
({*テキスト入力欄の背景色変更*})
TextFiledClassName_normal = 'text';
TextFiledClassName_focus  = 'text_focus';

Event.observe(window, 'load', setFocusClass, false);

function setFocusClass() {
	var TFs = $A(document.getElementsByClassName(TextFiledClassName_normal));
	TFs.each(function (node){
		node.TFclass = node.className;
		node.TFclass_onfocus = TextFiledClassName_focus;
		node.onfocus = function() { this.className = this.TFclass_onfocus; };
		node.onblur  = function() { this.className = this.TFclass; };
	});
}
//-->
</script>
</head>
({***************************************})
({**ここまで：旧inc_html_header.tplの内容**})
({***************************************})

({if $smarty.const.OPENPNE_USE_COMMU_MAP && $c_commu.is_display_map && $INC_HEADER_page_name == 'c_home'})
<script src="http://maps.google.co.jp/maps?file=api&amp;v=2.x&amp;key=({$smarty.const.GOOGLE_MAPS_API_KEY})" type="text/javascript"></script>
<script type="text/javascript">
<!--
function load() {
    if (GBrowserIsCompatible()) {
        var point = new GLatLng(({$c_commu.map_latitude}), ({$c_commu.map_longitude}));
        var zoom = ({$c_commu.map_zoom});
        var html = '<div><img src="({t_img_url filename=$c_commu.image_filename w=120 h=120 noimg=no_logo})" width="60" height="60" align="left" hspace="5">({$c_commu.name})</div>';

        var map = new GMap2(document.getElementById("map"));
        map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());
        map.setCenter(point, zoom);

        var marker = new GMarker(point);
        map.addOverlay(marker);
        GEvent.addListener(marker, "click", function() {
            marker.openInfoWindowHtml(html);
        });
    }
}
//-->
</script>
<body onLoad="load()" onUnload="GUnload()" id="pc_page_({$INC_HEADER_page_name})">
({else})
<body id="pc_page_({$INC_HEADER_page_name})">
({/if})

({$INC_HEADER_inc_page_top2|smarty:nodefaults})

<div align="left">

<table class="ext_sub_container" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="ext_sub_container_left" align="left" valign="top">

({$INC_HEADER_inc_page_top|smarty:nodefaults})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">

({if !$INC_HEADER_is_login})
({***************************************})
({**ここから：旧inc_page_header.tplの内容**})
({***************************************})
({* before_login / after_login *})
<div class="w_screen inc_page_header ({$before_after})_login">

({* skin_before_header / skin_after_header *})
({* bg_before / bg_after *})
<img src="({t_img_url_skin filename=skin_`$before_after`_header})" class="bg_({$before_after})">

({if $INC_HEADER_top_banner_html_before || $INC_HEADER_top_banner_html_after})
<div class="banner">
({if $before_after == 'before'})
({$INC_HEADER_top_banner_html_before|smarty:nodefaults})
({else})
({$INC_HEADER_top_banner_html_after|smarty:nodefaults})
({/if})
</div>
({elseif $INC_HEADER_top_banner.c_banner_id})
<div class="banner">
({strip})
({if $INC_HEADER_top_banner.a_href})
    ({if $before_after == "before"})
    <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_HEADER_top_banner.c_banner_id})" target="_blank">
    ({else})
    <a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_HEADER_top_banner.c_banner_id})&amp;sessid=({$PHPSESSID})" target="_blank">
    ({/if})
    <img src="({t_img_url filename=$INC_HEADER_top_banner.image_filename})">
    </a>
({else})
    <img src="({t_img_url filename=$INC_HEADER_top_banner.image_filename})">
({/if})
({/strip})
</div>
({/if})

<a class="logo_home" href="({t_url})"><img src="./skin/dummy.gif" alt="({$smarty.const.SNS_NAME})"></a>

({if $before_after == "after"})
<div class="navi_global">
({foreach from=$INC_HEADER_global_navi key=key item=item})
({if $item.url})
<a class="navi_global_({$key+1})" href="({$item.url})"><img src="./skin/dummy.gif" alt="({$item.caption})"></a>
({/if})
({/foreach})
<a class="navi_global_9" href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})"><img src="./skin/dummy.gif" alt="ログアウト"></a>
</div>
({/if})

</div>
({***************************************})
({**ここまで：旧inc_page_header.tplの内容**})
({***************************************})

</td>
</tr>
({if $inc_entry_point[1]})
<tr>
<td class="container">
({$inc_entry_point[1]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
</td>
</tr>
({/if})
({if $inc_navi})
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
({/if})
({if $inc_entry_point[2]})
<tr>
<td class="container">
({$inc_entry_point[2]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})
</td>
</tr>
({/if})
({if !$no_use_alert && ($msg || $msg1 || $msg2 || $msg3 || $err_msg)})
<tr>
<td class="container main_content" align="center">

({*************************************})
({**ここから：旧inc_alert_box.tplの内容**})
({*************************************})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：警告****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width})({else})580({/if})px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:({if $width})({$width-14})({else})566({/if})px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：警告＞内容* -->
({*ここから：header*})
<!-- 無し -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:({if $width})({$width-16})({else})564({/if})px;">
<tr>
<td style="width:({if $width})({$width-16})({else})564({/if})px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:150px;" class="bg_03" align="center" valign="middle">
<!-- ここから：主内容＞警告アイコン -->
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="({t_img_url_skin filename=icon_alert_l})" class="icon">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<!-- ここまで：主内容＞警告アイコン -->
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:({if $width})({$width-153})({else})427({/if})px;height:50px;" class="bg_02" align="left" valign="middle">
<div style="padding:8px 6px;" class="caution">
<!-- ここから：主内容＞警告文本体 -->
({if $msg})({$msg})<br>({/if})
({if $msg1})({$msg1})<br>({/if})
({if $msg2})({$msg2})<br>({/if})
({if $msg3})({$msg3})<br>({/if})
({foreach from=$err_msg item=item})
({$item})<br>
({/foreach})
<!-- ここまで：主内容＞警告文本体 -->
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：警告＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：警告****** -->
<!-- ************************* -->

({*************************************})
({**ここまで：旧inc_alert_box.tplの内容**})
({*************************************})

</td>
</tr>
({/if})
({/if})
