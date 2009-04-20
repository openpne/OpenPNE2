({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定確認</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">写真容量 使用状況</font><br>
</td></tr></table>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})
<table>
<tr>
<td bgcolor="#({$ktai_color_config.bg_04})">
<font color="#({$ktai_color_config.color_25})">種別</font>
</td>
<td bgcolor="#({$ktai_color_config.bg_04})">
<font color="#({$ktai_color_config.color_25})">制限容量(MB)</font>
</td>
<td bgcolor="#({$ktai_color_config.bg_04})">
<font color="#({$ktai_color_config.color_25})">使用量(MB)</font>
</tr>
({foreach from=$image_limit_list item=item})
<tr>
<td>({$item.ktai_title})</td>
<td align="right">({$item.limit_size})</td>
<td align="right">({$item.used_size})</td>
</tr>
({/foreach})
</table>
</div>

({$inc_ktai_footer|smarty:nodefaults})
