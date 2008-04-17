
<div id="LayoutC">
<div id="Center">

<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>画像の表示</h3></div>

({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
<div class="pagerRelative">
({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の画像</a></p>({/if})
({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の画像»</a></p>({/if})
</div>
({/if})

<table>
<tr>
<td colspan="2">
<img src="({t_img_album_url filename=$c_album_image.image_filename w=600 h=600})" alt="photo" vspace="4">
</td>
</tr>
<tr>
<td>写真説明</td>
<td>({$c_album_image.image_description})</td>
</tr>
</table>


({if $c_album_iamge_id_prev || $c_album_iamge_id_next})
<div class="pagerRelative">
({if $c_album_iamge_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_prev})">«前の画像</a></p>({/if})
({if $c_album_iamge_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_id=({$c_album_image.c_album_id})&amp;target_c_album_image_id=({$c_album_iamge_id_next})">次の画像»</a></p>({/if})
</div>
({/if})

<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$c_album_image.c_album_id})">アルバムに戻る</a>

</div> <!-- parts -->
</div> <!-- dparts formTable -->

</div><!-- Center -->
</div><!-- LayoutC -->
