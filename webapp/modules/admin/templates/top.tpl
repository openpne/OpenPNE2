({$inc_header|smarty:nodefaults})
<div class="subNavi"></div>
</div>

({*ここまで:navi*})


({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<div class="contents">

({ext_include file="inc_dashboard.tpl"})

({$inc_footer|smarty:nodefaults})
