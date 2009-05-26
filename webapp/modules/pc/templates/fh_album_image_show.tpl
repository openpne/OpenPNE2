<div id="LayoutC">
<div id="Center">

<div class="dparts albumImageBox"><div class="parts">
<div class="partsHeading"><h3>写真の表示</h3></div>

({capture name=pager})({strip})
({if $c_album_image_id_prev || $c_album_image_id_next})
<div class="block prevNextLinkLine">
({if $c_album_image_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_prev})">«前の写真</a></p>({/if})
({if $c_album_image_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_next})">次の写真»</a></p>({/if})
</div>
({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<p class="photo"><img src="({t_img_url filename=$c_album_image.image_filename w=600 h=600})" alt="({$c_album_image.image_description|t_truncate:30})" /></p>

<table>
<tr>
<th>写真説明</th>
<td>({$c_album_image.image_description})</td>
</tr>
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$c_album_image.c_album_id})">アルバムに戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
