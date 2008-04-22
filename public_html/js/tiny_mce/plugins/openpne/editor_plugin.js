/**
 * TinyMCE Plugin for OpenPNE
 *
 * @author Kousuke Ebihara 
 */

(function() {

    tinymce.create('tinymce.ui.OpenPNEColorButton:tinymce.ui.ColorSplitButton', {
        renderHTML : function() {
            var s = this.settings, h = '<a id="' + this.id + '" href="javascript:;" class="mceButton mceButtonEnabled ' + s['class']
                + '" onmousedown="return false;" onclick="return false;" title="' + tinymce.DOM.encode(s.title) + '">';

            if (s.image) {
                h += '<img class="mceIcon" src="' + s.image + '" /></a>';
            } else {
                h += '<span class="mceIcon ' + s['class'] + '"></span></a>';
            }

            return h;
        },

        postRender : function() {
            tinymce.dom.Event.add(this.id, 'click', this.showMenu, this);
        },

        setColor : function(c) {
            this.value = c;
            this.hideMenu();
            this.settings.onselect(c);
        }
    });

    tinymce.PluginManager.requireLangPack('openpne');

    var config = pne_mce_editor_get_config();

    tinymce.create('tinymce.plugins.OpenPNEPlugin', {
        init : function(ed, url) {
            var t = this;

            // change the editor setting
            ed.settings.content_css = url + "/css/editor.css";

            // command
            ed.addCommand('mceOpenPNE_op_b', function() {
                tinyMCE.execCommand("Bold");
            });
            ed.addCommand('mceOpenPNE_op_u', function() {
                tinyMCE.execCommand("Underline");
            });
            ed.addCommand('mceOpenPNE_op_s', function() {
                tinyMCE.execCommand("Strikethrough");
            });
            ed.addCommand('mceOpenPNE_op_i', function() {
                tinyMCE.execCommand("Italic");
            });
            ed.addCommand('mceOpenPNE_op_large', function() {
                tinyMCE.execCommand("Fontsize", false, 5);
            });
            ed.addCommand('mceOpenPNE_op_small', function() {
                tinyMCE.execCommand("Fontsize", false, 1);
            });
            ed.addCommand('mceOpenPNE_op_image', function() {
                window.open(config.op_image.contentURL, '', 'width=600,height=550,toolbar=no,scrollbars=yes,left=10,top=10');
            });

            // button
            for (var key in config) {
                var value = config[key];
                if (value.isEnabled && key != "op_color") {
                    ed.addButton(key, {title : '{#openpne.' + key + '}', image: value.imageURL, cmd : 'mceOpenPNE_' + key});
                }
            }

            // event
            ed.onBeforeSetContent.add(function(ed, o) {  // To preview mode
                o.content = t._textToPreview(o.content);
            });
            ed.onPostProcess.add(function(ed, o) {  // To text mode
                if (o.save) {
                    o.content = t._previewToText(o.content, ed);
                }
            });
            ed.onNodeChange.add(function(ed, cm, n) {
                cm.setActive('mce_editor_textarea_op_b', n.nodeName.toLowerCase() == 'b');
                cm.setActive('mce_editor_textarea_op_u', n.nodeName.toLowerCase() == 'u');
                cm.setActive('mce_editor_textarea_op_s', n.nodeName.toLowerCase() == 's');
                cm.setActive('mce_editor_textarea_op_i', n.nodeName.toLowerCase() == 'i');
            });
        },

        createControl: function(n, cm) {
            var c = null;
            if (n == "op_color" && config["op_color"].isEnabled) {
                c = this._createOpenPNEColorButton("op_color", { title : "{#openpne.op_color}", image: config["op_color"].imageURL, cmd : "ForeColor"}, cm);
            }
            return c;
        },

        getInfo : function() {
            return {
                longname : 'OpenPNE plugin',
                author : 'Kousuke Ebihara',
                version : "1.0"
            }
        },

        _createOpenPNEColorButton : function(id, s, cm) {
            var t = cm, ed = t.editor, cmd, c;

            if (t.get(id)) {
                return null;
            }

            s.title = ed.translate(s.title);
            s.scope = s.scope || ed;

            if (!s.onclick) {
                s.onclick = function(v) { ed.execCommand(s.cmd, s.ui || false, v || s.value); };
            }

            if (!s.onselect) {
                s.onselect = function(v) { ed.execCommand(s.cmd, s.ui || false, v || s.value); };
            }

            id = t.prefix + id;

            s = tinymce.extend({ title : s.title, 'class' : 'mce_' + id, 'menu_class' : ed.getParam('skin') + 'Skin', scope : s.scope, more_colors_title : ed.getLang('more_colors') }, s);

            c = new tinymce.ui.OpenPNEColorButton(id, s);
            ed.onMouseDown.add(c.hideMenu, c);

            ed.onRemove.add(function() {
                c.destroy();
            });

            return t.add(c);
        },

        _previewToText : function(s, editor) {
            var editorDoc = editor.getBody();

            function rep(re, str) {
                s = s.replace(re, str);
            };

            if (!tinymce.isWebKit) {  // not safari
                s = tinymce.trim(s);
                rep('/<(\/?)strong>/gi', '<\1b>');
                rep('/<(\/?)strike>/gi', '<\1s>');
                rep('/<(\/?)em>/gi', '<\1i>');
                editor.dom.setHTML(editor.getBody(), s);
            }

            function convertHtmlTagToDecoTag(doc, tagname)
            {
                var tagList = doc.getElementsByTagName(tagname);
                var org_tagname = tagname;
                var args = {};

                while (tagList.length) {
                    targetObj = tagList[0];

                    if (org_tagname == "font") {
                        var size = targetObj.getAttribute("size");
                        var color = targetObj.getAttribute("color");

                        if (size && color) {
                            if (tinymce.isIE) {
                                targetObj.removeAttribute("color");
                                targetObj.innerHTML = '<font color="' + color + '">' + targetObj.innerHTML + "</font>";
                            } else {
                                var fontSize = document.createElement("font");
                                fontSize.setAttribute("size", size);
                                fontSize.removeAttribute("color");

                                var clone = targetObj.cloneNode(true);
                                clone.removeAttribute("size");

                                fontSize.appendChild(clone);
                                targetObj.parentNode.replaceChild(fontSize, targetObj);
                            }

                            // initialize
                            tagList = doc.getElementsByTagName(org_tagname);
                            args = {};

                            continue;
                        }

                        if (size == '5') {
                            tagname = 'op:large';
                        } else if (size == '1') {
                            tagname = 'op:small';
                        }

                        if (color) {
                            tagname = 'op:color';
                            args = {
                                code: color
                            };
                        }
                    } else if (org_tagname == 'span') {  // for safari
                        if (targetObj.style.fontWeight == 'bold') {
                            tagname = 'op:b';
                        } else if (targetObj.style.textDecoration == 'underline') {
                            tagname = 'op:u';
                        } else if (targetObj.style.textDecoration == 'line-through') {
                            tagname = 'op:s';
                        } else if (targetObj.style.fontStyle == 'italic') {
                            tagname = 'op:i';
                        } else if (targetObj.style.color) {
                            var color = tinyMCE.activeEditor.dom.toHex(targetObj.style.color);
                            tagname = 'op:color';
                            args = {
                                code: color
                            };
                        } else if (targetObj.style.fontSize == 'x-large') {
                            tagname = 'op:large';
                        } else if (targetObj.style.fontSize == 'x-small') {
                            tagname = 'op:small';
                        } else {
                            editor.dom.remove(targetObj, true);
                            continue;
                        }
                    } else {
                        tagname = 'op:' + org_tagname;
                    }

                    if (tinymce.isIE) {
                        tagname = tagname.replace("op:", "op");
                    }

                    var newObj = editor.dom.create(tagname);
                    editor.dom.setAttribs(newObj, args);

                    if (tinymce.isIE) {
                        newObj.innerHTML = targetObj.innerHTML;
                        targetObj.parentNode.replaceChild(newObj, targetObj);
                    } else {
                        editor.dom.replace(newObj, targetObj, true);
                    }
                    tagList = doc.getElementsByTagName(org_tagname);
                }
                s = editorDoc.innerHTML;
            }

            var convertList = new Array('span', 'b', 'u', 's', 'i', 'font');
            for (var i = 0; i < convertList.length; i++) {
                convertHtmlTagToDecoTag(editor.getBody(), convertList[i]);
            }

            rep(/<\/?div>/gi,"");  // for Safari

            if (tinymce.isIE) {
                rep(/<op/gi, "<op:");
                rep(/<\/op/gi, "</op:");
            }

            rep(/<br\s?\/?[^>]*>/gi,"\n\n");
            rep(/&nbsp;/gi," ");
            rep(/&quot;/gi,"\"");
            rep(/&lt;/gi,"<");
            rep(/&gt;/gi,">");
            rep(/&amp;/gi,"&");

            return s; 
        },

        _textToPreview : function(s) {
            s = tinymce.trim(s);
            var rule = /&lt;op:(b|u|s|i|large|small|color)( code="(#[0-9a-f]{3,6})"|)&gt;(.*?)&lt;\/op:\1&gt;/i;

            function rep(re, str) {
                s = s.replace(re, str);
            };

            function convertDecoTagToHtmlTag(matches)
            {
                var tagname = matches[1];
                var color = matches[3];
                var value = matches[4].gsub(rule, convertDecoTagToHtmlTag);
                var opt = '';

                if (tagname == 'color' && color) {
                    tagname = 'font';
                    opt = ' color="' + color + '"';
                }

                if (tagname == 'large') {
                    tagname = 'font';
                    opt = ' size="5"';
                }
            
                if (tagname == 'small') {
                    tagname = 'font';
                    opt = ' size="1"';
                }

                var converted = "<" + tagname + opt + ">" + value + "</" + tagname + ">";
                return converted;
            };

            rep(/</gi,"&lt;");
            rep(/>/gi,"&gt;");
            rep(/\n/gi,"<br />");
            s = s.gsub(rule, convertDecoTagToHtmlTag);

            return s; 
        }
    });

    // Register plugin
    tinymce.PluginManager.add('openpne', tinymce.plugins.OpenPNEPlugin);
})();
