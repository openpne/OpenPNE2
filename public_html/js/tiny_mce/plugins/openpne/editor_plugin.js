/**
 * TinyMCE Plugin for OpenPNE
 *
 * @author Kousuke Ebihara 
 */

(function() {
    tinymce.PluginManager.requireLangPack('openpne');

    tinymce.create('tinymce.plugins.OpenPNEPlugin', {
        init : function(ed, url) {
            var t = this;

            // change the editor setting
            ed.settings.content_css = url + "/css/editor.css";

            var config = pne_mce_editor_get_config();

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
            ed.addCommand('mceOpenPNE_op_color', function() {
                var color = "";
                tinyMCE.execCommand('mceColorPicker', true, {
                    func : function(c) {
                        tinyMCE.execCommand("Forecolor", false, c);
                    }
                });
            });

            // button
            for (var key in config) {
                var value = config[key];
                if (value.isEnabled) {
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

        getInfo : function() {
            return {
                longname : 'OpenPNE plugin',
                author : 'Kousuke Ebihara',
                version : "1.0"
            }
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
                var count = tagList.length;
                var org_tagname = tagname;
                var args = {};

                while (tagList.length) {
                    targetObj = tagList[0];

                    if (org_tagname == 'font') {
                        var size = targetObj.getAttribute('size');
                        var color = targetObj.getAttribute('color');

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

                    var newObj = document.createElement(tagname);
                    for (var key in args) {
                        newObj.setAttribute(key, args[key]);
                    }
                    editor.dom.replace(newObj, targetObj, true);
                    tagList = doc.getElementsByTagName(org_tagname);
                }
                s = editorDoc.innerHTML;
            }

            var convertList = new Array('span', 'b', 'u', 's', 'i', 'font');
            for (var i = 0; i < convertList.length; i++) {
                convertHtmlTagToDecoTag(editor.getBody(), convertList[i]);
            }
            rep(/<\/?div>/gi,"");  // for Safari
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
            var rule = /&lt;op:(b|u|s|i|large|small|color)( code="(#[0-9a-f]{3,6})"|)&gt;(.*?)&lt;\/op:\1&gt;/;

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
