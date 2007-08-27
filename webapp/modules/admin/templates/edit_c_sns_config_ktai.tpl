({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="携帯版配色変更"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})


<script type="text/javascript">
<!--

function reflect_color (n) {
    var str_1 = n.name;
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
        if (key.indexOf("border") == -1 &&  key.indexOf("bg") == -1 && key.indexOf("font") == -1) {
            continue;
        }
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
<h2>携帯版配色設定</h2>
<div class="contents">

<form action="./" method="post" name="color">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_sns_config_ktai','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<div class="bg">
<h3 class="item" id="subttl02">カラーコードの設定</h3>

<p class="caution" id="c02">※色の指定は16進数表記で行ってください。</p>
<p class="caution" id="c03">※色のプレビューが変更されてもそのままでは色設定は反映されません。必ず確定してください。</p>
<p class="textBtn"><input type="button" value="デフォルトの設定に戻す" onclick="assign_color_0()"></p>
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

<p class="textBtn" id="c04"><input type="submit" value="色変更を確定する"></p>

<p id="c05">配色設定をバックアップする場合は下記の内容をコピーしてテキストファイルなどに保存してください。</p>

<textarea name="copy_area" id="copy_area">
({if $preset_bgcolors})
({foreach from=$c_sns_config key=key item=item})({foreach from=$bgcolor_scheme_names item=item_x})({if $item_x == $key})({$key}):#({$item})
({/if})({/foreach})({/foreach})
({/if})
</textarea>

</form>

</div>({*/div class="contents"*})

({$inc_footer|smarty:nodefaults})
