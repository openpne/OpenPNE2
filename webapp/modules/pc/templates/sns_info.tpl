({***************************************})
({**ここから：旧inc_html_header.tplの内容**})
({***************************************})
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
({$INC_HEADER_inc_html_head|smarty:nodefaults})
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
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









<body>


<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:240px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:180px;padding:2px 0px;" class="bg_06"><b class="c_00">
({if $requests.type == 'member'})

({if $requests.order == 'new'})最近登録した({elseif $requests.order == 'random'})ランダム({/if})メンバー

({elseif $requests.type == 'diary'})

({if $requests.order == 'new'})最新({elseif $requests.order == 'random'})ランダム({/if})日記

({elseif $requests.type == 'commu'})

({if $requests.order == 'new'})最新({elseif $requests.order == 'random'})ランダム({/if})コミュニティ

({elseif $requests.type == 'topic'})

({if $requests.order == 'new'})最新({elseif $requests.order == 'random'})ランダム({/if})コミュニティ書き込み

({/if})
</b></td>
</tr>
</table>
</div>

<table border="0" cellspacing="0" cellpadding="0" style="width:240px;">
<!-- ここから：主内容 -->
<tr>
<td class="border_01 bg_02 padding_s" style="width:240px;border-top:none;">



({if $requests.type == 'member'})

({foreach from=$list item=item})
({if !$item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1">　<br>
({else})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_parent">({$item.nickname|t_truncate:30})</a><br>
({/if})

({/foreach})

({elseif $requests.type == 'diary'})

({foreach from=$list item=item})

({if !$item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1">　<br>
({else})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" target="_parent">({$item.subject|t_truncate:16}) (({$item.num_comment}))</a> (({$item.nickname|t_truncate:9}))<br>
({/if})

({/foreach})

({elseif $requests.type == 'commu'})

({foreach from=$list item=item})

({if !$item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1">　<br>
({else})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_1"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" target="_parent">({$item.name|t_truncate:28}) (({$item.num_member}))</a><br>
({/if})

({/foreach})

({elseif $requests.type == 'topic'})

({foreach from=$list item=item})

({if !$item})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_2">　<br>
({else})
<img src="./skin/dummy.gif" alt="dummy" style="width:14px;height:14px;clear:both;" class="icon icon_2"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.num_comment})" target="_parent">({$item.name|t_truncate:17}) (({$item.num_comment}))</a> (({$item.commu_name|t_truncate:11}))<br>
({/if})

({/foreach})

({/if})


</td>
</tr>

</table>

</body>
</html>