<div id="LayoutC">
<div id="Center">

({* unknown *})<div class="dparts formTable"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>写真の表示</h3></div>
({* unknown *})
({* unknown *})({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の写真</a></p>({/if})
({* unknown *})({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の写真»</a></p>({/if})
({* unknown *})</div>
({* unknown *})({/if})
({* unknown *})
({* unknown *})<table>
({* unknown *})<tr>
({* unknown *})<td colspan="2">
({* unknown *})<img src="({t_img_url filename=$c_album_image.image_filename w=600 h=600})" alt="photo" vspace="4" />
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td>写真説明</td>
({* unknown *})<td>({$c_album_image.image_description})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})
({* unknown *})({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の写真</a></p>({/if})
({* unknown *})({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の写真»</a></p>({/if})
({* unknown *})</div>
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div></div>

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$c_album_image.c_album_id})">アルバムに戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
