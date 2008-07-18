({ext_include file="inc_header.tpl" INC_HEADER_is_no_alert=true})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

({if $inc_entry_point[3]})
({$inc_entry_point[3]|smarty:nodefaults})
({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：bizモジュール::スケジュール****** -->
({$calendar|smarty:nodefaults})
<!-- ******ここまで：bizモジュール::スケジュール****** -->
<!-- ******************************** -->

<!-- **************************************** -->
<!-- ******ここから：ホームに戻る****** -->
<div id="link_community_top" align="center">
({if !$is_closed_shisetsu})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=biz a=page_s_add_shisetsu})">施設登録</a>
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_h_home})">ホームに戻る</a>

</div>
<!-- ******ここまで：ホームに戻る****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $inc_entry_point[5]})
({$inc_entry_point[5]|smarty:nodefaults})
({/if})

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
