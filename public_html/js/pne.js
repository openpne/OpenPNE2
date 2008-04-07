function pne_url2a(url) {
    var urlstr = url.replace("&amp;", "&");
    if (urlstr.length > 57) {
       urlstr = urlstr.substr(0, 57) + '...';
    }
    urlstr = urlstr.replace("&", "&amp;");
    document.write('<a href="'+url+'" target="_blank">'+urlstr+'</a>');
}

function pne_toggle_mce_editor(id)
{
    tinyMCE.execCommand("mceToggleEditor", false, id);

    if (tinyMCE.get(id).isHidden()) {
        document.getElementById('mce_editor_buttonmenu').style.display = "block";
    } else {
        document.getElementById('mce_editor_buttonmenu').style.display = "none";
    }
}

function pne_mce_editor_init()
{
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        editor_selector : "mceEditor_dummy_selector",
        plugins : "openpne",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_buttons1 : "op_b,op_u,op_s,op_i,op_large,op_small,op_color,op_album,op_emoji_docomo,op_emoji_au,op_emoji_softbank",
        theme_advanced_buttons2 : "",
        theme_advanced_buttons3 : "",
        valid_elements : "b/strong,u,s/strike,i,font[color|size],br",
        forced_root_block : false,
        force_p_newlines : false,
        force_br_newlines : true,
        inline_styles : false,
        language : "ja"
    });

    var textmode_checkbox = document.getElementById("mce_editor_mode_changer_1");
    var previewmode_checkbox = document.getElementById("mce_editor_mode_changer_2");
    if (previewmode_checkbox.checked) {
        textmode_checkbox.checked = true;
        previewmode_checkbox.checked = false;
    }
}

function pne_mce_insert_tagname(id, tagname)
{
    var opt = "";

    var elm = document.getElementById(id);
    var selection = new Selection(elm);

    var pos = selection.create(); 

    if (tagname == "op:color") {
        opt = " code=\"#000000\"";
    }

    var replace = "<" + tagname + opt + ">" + elm.value.substring(pos.start, pos.end) + "</" + tagname + ">";
    var head = elm.value.substring(0, pos.start);
    var tail = elm.value.substring(pos.end, elm.value.length);
    elm.value =  head + replace + tail;
}

