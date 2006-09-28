({$inc_header|smarty:nodefaults})

<h2>配色・CSS変更</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<ul>
<li><a href="#color">配色設定</a></li>
<li><a href="#css">カスタムCSS追加</a></li>
</ul>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">スキン画像設定</a> (別ページ)</li>
</ul>

<hr>

<h3><a name="color">配色設定</a></h3>

<script type="text/javascript">
<!--

function reflect_color (n) {
	var str_1 = n.name ;
	var color = document.forms["color"].elements[str_1].value ;
	var str_2 = "({if $preset_bgcolors})preview_display_({else})bgcolor_({/if})"+str_1 ;
	var str_3 = "#" + color ;
	document.getElementById(str_2).style.backgroundColor = str_3 ;
	
	for (key in bgcolors) {
		if (key == str_1) {
			bgcolors[str_1] = color;
		}
	}
	set_textarea_for_color_config ();
}

function set_preset_color (target,color) {
	document.forms["color"].elements[target].value=color;
	var str_1 = "({if $preset_bgcolors})preview_display_({else})bgcolor_({/if})"+target ;
	var str_2 = "#" + color;
	document.getElementById(str_1).style.backgroundColor=str_2;
	
	bgcolors[target] = color;
}

function set_textarea_for_color_config () {
	var str_1 = "";
	for (key in bgcolors) {
		str_1 += key;
		str_1 += ":#";
		str_1 += bgcolors[key];
		str_1 += "\n";
	}
	document.forms["color"].elements["copy_area"].value=str_1;
}

bgcolors = new Array();

({foreach from=$bgcolor_scheme_names item=item})bgcolors['({$item})']="({$c_sns_config[$item]})";
({/foreach})

function hoge() {
}

({foreach from=$preset_bgcolors key=key item=item})
function assign_color_({$key})() {
	({foreach from=$item key=key_x item=item_x})
		({foreach from=$bgcolor_scheme_names item=item_xx})
		({if $key_x == $item_xx})
		set_preset_color ("({$key_x})","({$item_x})");
		({/if})
		({/foreach})
	({/foreach})
	
	set_textarea_for_color_config ();
    return 0;
}
({/foreach})

({if $user_save_bgcolors})

({foreach from=$user_save_bgcolors key=key item=item})
function assign_color_user_({$key})() {
	({foreach from=$item key=key_x item=item_x})
		({foreach from=$bgcolor_scheme_names item=item_xx})
		({if $key_x == $item_xx})
		set_preset_color ("({$key_x})","({$item_x})");
		({/if})
		({/foreach})
	({/foreach})

	set_textarea_for_color_config ();
    return 0;
}
({/foreach})

({/if})

// -->
</script>

<p class="caution">※色は16進数表記で指定してください。</p>
<p class="caution">※色のプレビューが変更されてもそのままでは色設定は反映されません。必ず確定してください。</p>

<form action="./" method="post" name="color">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_sns_config','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table border="0" cellspacing="0" cellpadding="0" class="bgcolor_scheme-config preset_bgcolors">
<tr>

<th>&nbsp;</th>
({foreach from=$preset_bgcolors name="PB" item=item})
({/foreach})
<th colspan="({$smarty.foreach.PB.total})">プリセットカラー</th>

({if $user_save_bgcolors})
({foreach from=$user_save_bgcolors name="USB" item=item})
({/foreach})
<th colspan="({$smarty.foreach.USB.total})">Save Colors</th>
({/if})

</tr>
<tr>

<th>セット名</th>
({foreach from=$preset_bgcolors key=key item=item})
<th><span>({$item.caption|default:"&nbsp;"})</span></th>
({/foreach})
({if $user_save_bgcolors})
({foreach from=$user_save_bgcolors key=key item=item})
<th><span>({$item.caption|default:"&nbsp;"})</span></th>
({/foreach})
({/if})
</tr>
<tr>
<th>&nbsp;</th>
({foreach from=$preset_bgcolors key=key item=item})
<td style="background:#({$item.symbol|default:"FFFFFF"});" align="center"><input type="button" value="設定" onclick="assign_color_({$key})()"></td>
({/foreach})
({if $user_save_bgcolors})
({foreach from=$user_save_bgcolors key=key item=item})
<td style="background:#({$item.symbol|default:"FFFFFF"});"><input type="button" value="load" onclick="assign_color_user_({$key})()">&nbsp;<input type="button" value="save">&nbsp;<input type="button" value="del"></td>
({/foreach})
({/if})

</tr>
</table>

<br>

<table border="0" cellspacing="0" cellpadding="0" class="bgcolor_scheme-config">
<tr>
<th>&nbsp;</th>
<th>カラーコード</th>
<th>変更後</th>
<th>変更前</th>
</tr>
({foreach from=$bgcolor_scheme_names item=item})
<tr>
<th>({$item})</th>
<td>#<input type="text" name="({$item})" value="({$c_sns_config[$item]})" onChange="reflect_color(this)" size="8" maxlength="6"></td>
<td style="background-color:#({$c_sns_config[$item]});" id="preview_display_({$item})">&nbsp;</td>
<td style="background-color:#({$c_sns_config[$item]});">&nbsp;</td>
</tr>
({/foreach})
</table>

({if $user_save_bgcolors})
<p>セット名：<input type="text" name="input_name" value="" onChange="reflect_color(this)" size="16"></p>

<p>見本色　：#<input type="text" name="input_sample" value="" onChange="reflect_color(this)" size="8" maxlength="6"><span id="preview_display_input_sample" style="border:1px solid #000000;width:1.5em;height:1.5em;vertical-align:middle;">&nbsp;&nbsp;</span><span class="caution">&nbsp;指定しない場合は白になります。</span></p>
({/if})

<div style="margin: 5px;"><input type="submit" class="submit" value="色変更を確定する">({if $user_save_bgcolors})&nbsp;<input type="submit" class="submit" value="新規に設定を保存する">({/if})</div>

<p>配色設定をバックアップする場合は下記の内容をコピーしてテキストファイルなどに保存してください。</p>

<textarea name="copy_area" style="width:40em;height:20em;">
({if $preset_bgcolors})
({foreach from=$c_sns_config key=key item=item})({foreach from=$bgcolor_scheme_names item=item_x})({if $item_x == $key})({$key}):#({$item})
({/if})({/foreach})({/foreach})
({/if})
</textarea>

</form>

<hr>

<h3><a name="css">カスタムCSS追加</a></h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_siteadmin_css','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<textarea name="body" cols="72" rows="20">({$inc_custom_css})</textarea>
<div style="margin: 5px;"><input type="submit" class="submit" value="変更"></div>
</form>

({$inc_footer|smarty:nodefaults})
