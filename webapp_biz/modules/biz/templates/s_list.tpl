<div id="LayoutC">

({$calendar|smarty:nodefaults})

<div id="Center">

<!-- **************************************** -->
<!-- ******ここから：ホームに戻る****** -->
<div id="link_community_top" align="center">
({if !$is_closed_shisetsu})
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" />&nbsp;<a href="({t_url m=biz a=page_s_add_shisetsu})">施設登録</a>
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" />&nbsp;<a href="({t_url m=pc a=page_h_home})">ホームに戻る</a>

</div>
<!-- ******ここまで：ホームに戻る****** -->
<!-- **************************************** -->

</div><!-- Center -->
</div><!-- LayoutC -->
