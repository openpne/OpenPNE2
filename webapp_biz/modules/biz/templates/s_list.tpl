<div id="LayoutC">

({$calendar|smarty:nodefaults})

<div id="Center">

({* {{{ linkLine *})
<div class="parts linkLine">
({if !$is_closed_shisetsu})<ul class="moreInfo">
<li><a href="({t_url m=biz a=page_s_add_shisetsu})">施設登録</a></li>
</ul>({/if})
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_home})">ホームに戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
