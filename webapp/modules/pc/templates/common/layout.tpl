<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
({if $INC_HEADER_inc_html_head})({$INC_HEADER_inc_html_head|smarty:nodefaults})({/if})
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>({$INC_HEADER_title})</title>
<link rel="stylesheet" href="./css/default.css" type="text/css" />
<link rel="stylesheet" href="./xhtml_style.php" type="text/css" />
<script type="text/javascript" src="./js/prototype.js"></script>
<script type="text/javascript" src="./js/Selection.js"></script>
<script type="text/javascript" src="./js/pne.js"></script>
<script type="text/javascript" src="./js/tiny_mce/tiny_mce.js"></script>
<style type="text/css">
.border_01 { border: #({$INC_HEADER_color_config.border_01}) 1px solid; }
.border_07 { border: #({$INC_HEADER_color_config.border_07}) 1px solid; }
.border_10 { border: #({$INC_HEADER_color_config.border_10}) 1px solid; }
.bg_00 { background-color: #({$INC_HEADER_color_config.bg_00}); }
.bg_01 { background-color: #({$INC_HEADER_color_config.bg_01}); }
.bg_02 { background-color: #({$INC_HEADER_color_config.bg_02}); }
.bg_03 { background-color: #({$INC_HEADER_color_config.bg_03}); }
.bg_04 { background-color: #({$INC_HEADER_color_config.bg_04}); }
.bg_05 { background-color: #({$INC_HEADER_color_config.bg_05}); }
.bg_06 { background-color: #({$INC_HEADER_color_config.bg_06}); }
.bg_07 { background-color: #({$INC_HEADER_color_config.bg_07}); }
.bg_08 { background-color: #({$INC_HEADER_color_config.bg_08}); }
.bg_09 { background-color: #({$INC_HEADER_color_config.bg_09}); }
.bg_10 { background-color: #({$INC_HEADER_color_config.bg_10}); }
.bg_11 { background-color: #({$INC_HEADER_color_config.bg_11}); }
.bg_12 { background-color: #({$INC_HEADER_color_config.bg_12}); }
.bg_13 { background-color: #({$INC_HEADER_color_config.bg_13}); }
.bg_14 { background-color: #({$INC_HEADER_color_config.bg_14}); }
.color_19 { background-color: #({$INC_HEADER_color_config.color_19}); }
body { background-color: #({$INC_HEADER_color_config.bg_12}); }
.container { background-color: #({$INC_HEADER_color_config.bg_13}); }

/* 文字装飾 */
({if $INC_HEADER_decoration_config.op_b})
span.op_b {
    font-weight : bold;
    font-size: inherit;
}
({/if})

({if $INC_HEADER_decoration_config.op_u})
span.op_u {
    text-decoration : underline;
    font-size: inherit;
}
({/if})

({if $INC_HEADER_decoration_config.op_s})
span.op_s {
    text-decoration : line-through;
    font-size: inherit;
}
({/if})

({if $INC_HEADER_decoration_config.op_i})
span.op_i {
    font-style : italic;
    font-size: inherit;
}
({/if})

({if $INC_HEADER_decoration_config.op_large})
span.op_large {
    font-size : 20px;
}
({/if})

({if $INC_HEADER_decoration_config.op_small})
span.op_small {
    font-size : 8px;
}
({/if})

({if !$INC_HEADER_decoration_config.op_color})
span.op_color {
    color : #000 !important;
    font-size: inherit;
}
({/if})

</style>

<script type="text/javascript">
function pne_mce_editor_get_config()
{
    return {
        op_b : {
            isEnabled : ({$INC_HEADER_decoration_config.op_b}),
            imageURL : "({t_img_url_skin filename=deco_op_b})"
        },
        op_u : {
            isEnabled : ({$INC_HEADER_decoration_config.op_u}),
            imageURL : "({t_img_url_skin filename=deco_op_u})"
        },
        op_s : {
            isEnabled : ({$INC_HEADER_decoration_config.op_s}),
            imageURL : "({t_img_url_skin filename=deco_op_s})"
        },
        op_i : {
            isEnabled : ({$INC_HEADER_decoration_config.op_i}),
            imageURL : "({t_img_url_skin filename=deco_op_i})"
        },
        op_large : {
            isEnabled : ({$INC_HEADER_decoration_config.op_large}),
            imageURL : "({t_img_url_skin filename=deco_op_large})"
        },
        op_small : {
            isEnabled : ({$INC_HEADER_decoration_config.op_small}),
            imageURL : "({t_img_url_skin filename=deco_op_small})"
        },
        op_color : {
            isEnabled : ({$INC_HEADER_decoration_config.op_color}),
            imageURL : "({t_img_url_skin filename=deco_op_color})"
        }
    }
}
</script>
</head>
<body id="pc_page_({$INC_HEADER_page_name})"><div id="Body">
({if $INC_HEADER_inc_page_top2})({$INC_HEADER_inc_page_top2|smarty:nodefaults})({/if})
<div id="Container">
({if $INC_HEADER_inc_page_top})({$INC_HEADER_inc_page_top|smarty:nodefaults})({/if})

({if !$INC_HEADER_is_login})
<div id="Header">

<div id="({if $before_after == "after"})globalNav({else})globalNavBefore({/if})">
<h1><a href="({t_url})">({$smarty.const.SNS_NAME})</a></h1>
({if $before_after == "after"})
<ul>
({foreach from=$INC_HEADER_global_navi key=key item=item})
({if $item.url})
<li id="globalNav_({$key+1})"><a href="({$item.url})">({$item.caption})</a></li>
({/if})
({/foreach})
<li id="globalNav_9"><a href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})">ログアウト </a></li>
</ul>
({/if})
</div><!-- globalNav -->

({if $INC_HEADER_top_banner_html_before || $INC_HEADER_top_banner_html_after})
({* {{{ topBanner *})
<div id="topBanner">
({if $before_after == 'after'})
({$INC_HEADER_top_banner_html_after|smarty:nodefaults})
({else})
({$INC_HEADER_top_banner_html_before|smarty:nodefaults})
({/if})
</div>
({elseif $INC_HEADER_top_banner.c_banner_id})
<div id="topBanner">
({if $INC_HEADER_top_banner.a_href})
<a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_HEADER_top_banner.c_banner_id})({if $before_after == "after"})&amp;sessid=({$PHPSESSID})({/if})" target="_blank"><img src="({t_img_url filename=$INC_HEADER_top_banner.image_filename})" alt="({$INC_HEADER_top_banner.nickname})" /></a>
({else})
<img src="({t_img_url filename=$INC_HEADER_top_banner.image_filename})" alt="({$INC_HEADER_top_banner.nickname})" />
({/if})
</div>
({* }}} *})
({/if})

</div><!-- Header -->

({if $inc_entry_point[1]})({$inc_entry_point[1]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})
({if $inc_navi})({$inc_navi|smarty:nodefaults})({/if})
({if $inc_entry_point[2]})({$inc_entry_point[2]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if !$no_use_alert && ($msg || $msg1 || $msg2 || $msg3 || $err_msg)})
({* {{{ alertBox *})
<div class="dparts alertBox"><div class="parts">
<table><tr>
<th><img src="({t_img_url_skin filename=icon_alert_l})" alt="警告" /></th>
<td>
({if $msg})({$msg})<br />({/if})
({if $msg1})({$msg1})<br />({/if})
({if $msg2})({$msg2})<br />({/if})
({if $msg3})({$msg3})<br />({/if})
({foreach from=$err_msg item=item})
({$item})<br />
({/foreach})
</td>
</tr></table>
</div></div>
({* }}} *})
({/if})
({/if})({* !$INC_HEADER_is_login *})

<!-- start of op_content -->
({$op_content|smarty:nodefaults})
<!-- end of op_content -->

({if !$INC_FOOTER_is_login})
<div id="Footer">
<p>({$INC_FOOTER_inc_page_footer|smarty:nodefaults})</p>
</div>
({/if})

({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after || $INC_FOOTER_inc_side_banner})
<div id="sideBanner">
({strip})
({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_side_banner_html_after})
	({if $before_after == 'before'})
		({$INC_FOOTER_side_banner_html_before|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
	({else})
		({$INC_FOOTER_side_banner_html_after|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
	({/if})
({else})
	({if $INC_FOOTER_inc_side_banner.a_href})
		<a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})({if $PHPSESSID})&amp;sessid=({$PHPSESSID})({/if})" target="_blank"><img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})" alt="({$INC_FOOTER_inc_side_banner.nickname})" /></a>
	({else})
		<img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})" alt="({$INC_FOOTER_inc_side_banner.nickname})" />
	({/if})
({/if})
({/strip})
</div>
({/if})

({if $INC_FOOTER_inc_page_bottom2})({$INC_FOOTER_inc_page_bottom2|smarty:nodefaults})({/if})
</div><!-- Container -->
({if $INC_FOOTER_inc_page_bottom})({$INC_FOOTER_inc_page_bottom|smarty:nodefaults})({/if})
</div><!-- Body -->
</body>
</html>
