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

function pne_mce_insert_tagname(id, tagname, opt)
{
    var opt = opt || "";

    var elm = document.getElementById(id);
    var selection = new Selection(elm);

    var pos = selection.create(); 

    if (tagname == "op:color" && !opt) {
        pne_mce_show_color_table(id, tagname);
        return;
    }

    var replace = "<" + tagname + opt + ">" + elm.value.substring(pos.start, pos.end) + "</" + tagname + ">";
    var head = elm.value.substring(0, pos.start);
    var tail = elm.value.substring(pos.end, elm.value.length);
    elm.value =  head + replace + tail;
}

function pne_mce_show_color_table(id, tagname)
{
    var table = document.getElementById("mce_editor_color_table")
    if (table) {
        table.parentNode.removeChild(table);
        return;
    }

    var color = null;
    var settings = {
        colors : ["000000","993300","333300","003300","003366","000080","333399","333333","800000","FF6600","808000","008000","008080","0000FF","666699","808080","FF0000","FF9900","99CC00","339966","33CCCC","3366FF","800080","999999","FF00FF","FFCC00","FFFF00","00FF00","00FFFF","00CCFF","993366","C0C0C0","FF99CC","FFCC99","FFFF99","CCFFCC","CCFFFF","99CCFF","CC99FF","FFFFFF"],
        grid_width : 8,
        default_color : "#888888"
    };

    var button = document.getElementById("mce_textmode_button_op_color");
    var x = button.offsetLeft;

    var button_container = document.getElementById("mce_editor_buttonmenu");

    var table = document.createElement("table");
    table.id = "mce_editor_color_table";
    table.style.width = "150px";
    table.style.position = "absolute";
    table.style.left = (x + table.style.width) + "px";
    table.style.zIndex = 150;
    table.style.padding = "5px";
    table.style.border = "1px solid gray";
    table.style.backgroundColor = "#fff";

    var tr;
 
    for (var i = 0; i < settings.colors.length; i++) {
        var code = "#" + settings.colors[i];

        if (i == 0 || i % settings.grid_width == 0) {
            tr = document.createElement("tr");
            table.appendChild(tr);
        }

        var td = document.createElement("td");
        td.style.backgroundColor = "#" + settings.colors[i];
        td.style.height = "10px";
        td.style.border = "1px solid white";

        var a = document.createElement("a");
        a.setAttribute("href", "#");
        a.colorCode = code;
        a.style.width = "9px";
        a.style.height = "9px";
        a.style.display = "block";
        a.onclick = function() {
            pne_mce_insert_tagname(id, tagname, ' code="' + this.colorCode + '"');
            var table = document.getElementById("mce_editor_color_table")
            table.parentNode.removeChild(table);
        };

        td.appendChild(a);
        tr.appendChild(td);
    }

    button_container.appendChild(table);
}

