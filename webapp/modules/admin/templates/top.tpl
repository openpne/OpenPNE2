({$inc_header|smarty:nodefaults})

({if $msg})
<p class="caution">({$msg})</p>
({else})
<p>左側のメニューから設定したい項目を選択してください。</p>
({/if})

<br>
<br>
<div class="info" style="margin: 70px 0 100px 0; text-align:  font-weight: bold; font-size: 1.2emx; color: #666; ">
<dl class="section" id="information">
<dt style="font-size:11px;">OpenPNE管理者向け情報</dt>
<dd>
<ul>
({foreach from=$admin_info item=item})
<li><a href="({$item.link})">({$item.title})</a></li>
</ul>
({/foreach})
</dd>
</dd>
</div>

({$inc_footer|smarty:nodefaults})