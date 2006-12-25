({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="配色設定・カスタムCSS追加"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})


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


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>配色設定</h2>
<div class="contents">

<div class="sampleColors">
<h3 class="item" id="subttl01">プリセットカラー</h3>
<p class="caution" id="c01">※初期設定色の呼出し後必ず『色変更を確定する』を押し配色の設定を確定してください。</p>

({foreach from=$preset_bgcolors key=key item=item})
<dl class="box">
	<dt>({$item.caption|default:"&nbsp;"})</dt>
	<dd style="background:#({$item.symbol|default:"FFFFFF"});"><p class="textBtn"><input type="button" value="この設定を呼び出す" onclick="assign_color_({$key})()"></p></dd>
</dl>
({/foreach})

<br class="clear" />

</div>

({*
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
*})

<form action="./" method="post" name="color">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_sns_config','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">




<div class="bg">
<h3 class="item" id="subttl02">カラーコードの設定</h3>

<p class="caution" id="c02">※色の指定は16進数表記で行ってください。</p>
<p class="caution" id="c03">※色のプレビューが変更されてもそのままでは色設定は反映されません。必ず確定してください。</p>

({foreach from=$bgcolor_scheme_names item=item})
<dl class="box">
	<dt>({$item})</dt>
	<dd>#&nbsp;<input type="text" class="basic" name="({$item})" value="({$c_sns_config[$item]})" onChange="reflect_color(this)" size="8" maxlength="6"></dd>
	<dd class="pre_color" style="background-color:#({$c_sns_config[$item]});"><div>&nbsp;変更前&nbsp;</div></dd>
	<dd class="color" style="background-color:#({$c_sns_config[$item]});" id="preview_display_({$item})"><div>&nbsp;変更後&nbsp;</div></dd>
</dl>
({/foreach})
<br class="clear" />
</div>









({*
({foreach from=$bg_names item=item})
<dl class="box">
	<dt>({$item})</dt>
	<dd class="color" style="background-color:#({$c_sns_config[$item]});"></dd>
</dl>
({/foreach})
<br class="clear" />
</div>
*})

({if $user_save_bgcolors})
<div class="border">
<p>セット名：<input type="text" name="input_name" value="" onChange="reflect_color(this)" size="16"></p>

<p>見本色　：#<input type="text" name="input_sample" value="" onChange="reflect_color(this)" size="8" maxlength="6"><span id="preview_display_input_sample" style="border:1px solid #000000;width:1.5em;height:1.5em;vertical-align:middle;">&nbsp;&nbsp;</span><span class="caution">&nbsp;指定しない場合は白になります。</span></p>
</div>
({/if})

<p class="textBtn" id="c04"><input type="submit" value="色変更を確定する"></p>
({if $user_save_bgcolors})<p class="textBtns"><input type="submit" class="submit" value="新規に設定を保存する"></p>({/if})




<p id="c05">配色設定をバックアップする場合は下記の内容をコピーしてテキストファイルなどに保存してください。</p>

<textarea name="copy_area" style="width:40em;height:20em;">
({if $preset_bgcolors})
({foreach from=$c_sns_config key=key item=item})({foreach from=$bgcolor_scheme_names item=item_x})({if $item_x == $key})({$key}):#({$item})
({/if})({/foreach})({/foreach})
({/if})
</textarea>

</form>

</div>({*/div class="contents"*})




<h2 id="ttl02">カスタムCSS追加</h2>
<div class="contents">
<p id="c06">標準設定されているスタイルは、ここで上書きすることもできます。</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})"/>
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_siteadmin_css','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<textarea id="customCss" name="body" cols="72" rows="20">({$inc_custom_css})</textarea>
<p class="textBtn"><input type="submit" value="CSSを追加する"></p>
</form>

({$inc_footer|smarty:nodefaults})
