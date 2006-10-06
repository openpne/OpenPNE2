({$inc_header|smarty:nodefaults})

({if $msg})
<p class="caution">({$msg})</p>
({else})
<p>左側のメニューから設定したい項目を選択してください。</p>
({/if})

({if $smarty.const.DISPLAY_OPENPNE_INFO})
({if $admin_info})
<div class="info" style="margin: 70px 0 100px 0; text-align:  font-weight: bold; font-size: 1.2emx; color: #666; ">
<dl class="section" id="information">
<dt style="font-size:11px;">OpenPNE管理者向け情報</dt>
<dd>
<ul>
({foreach from=$admin_info item=item})
<li><a href="({$item.link})">({$item.date}) ({$item.title})</a></li>
({/foreach})
</ul>
</dd>
</dl>
</div>
({/if})
({/if})

({$inc_footer|smarty:nodefaults})