({if $smarty.const.OPENPNE_USE_DECORATION})
<script type="text/javascript" src="./js/pne_decoration.js"></script>
<script type="text/javascript" src="./js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
//<![CDATA[
function pne_mce_editor_get_config()
{
    return {
        op_b : {
            isEnabled : ({$INC_HEADER_decoration_config.op_b}),
            imageURL : "({t_img_url_skin filename=deco_op_b})"
        },
        op_u : {
            isEnabled : ({$INC_HEADER_decoration_config.op_u}),
            imageURL : "({t_img_url_skin filename=deco_op_u})"
        },
        op_s : {
            isEnabled : ({$INC_HEADER_decoration_config.op_s}),
            imageURL : "({t_img_url_skin filename=deco_op_s})"
        },
        op_i : {
            isEnabled : ({$INC_HEADER_decoration_config.op_i}),
            imageURL : "({t_img_url_skin filename=deco_op_i})"
        },
        op_large : {
            isEnabled : ({$INC_HEADER_decoration_config.op_large}),
            imageURL : "({t_img_url_skin filename=deco_op_large})"
        },
        op_small : {
            isEnabled : ({$INC_HEADER_decoration_config.op_small}),
            imageURL : "({t_img_url_skin filename=deco_op_small})"
        },
        op_color : {
            isEnabled : ({$INC_HEADER_decoration_config.op_color}),
            imageURL : "({t_img_url_skin filename=deco_op_color})"
        },
        op_image : {
            isEnabled : ({$smarty.const.OPENPNE_USE_ALBUM}),
            imageURL : "({t_img_url_skin filename=deco_op_image})",
            contentURL : "({t_url _html=0 m=pc a=page_h_album_insert_dialog})"
        }
    }
}
//]]>
</script>
<script type="text/javascript" src="./js/pc_emoji_palet/pc_emoji_palet.js"></script>
<input type="radio" name="mce_editor_mode_changer" id="mce_editor_mode_changer_1" onclick="pne_toggle_mce_editor('mce_editor_textarea')" checked="checked" /><label for="mce_editor_mode_changer_1">テキストモード</label>&nbsp;<input type="radio" name="mce_editor_mode_changer" id="mce_editor_mode_changer_2" onclick="pne_toggle_mce_editor('mce_editor_textarea')" /><label for="mce_editor_mode_changer_2">プレビューモード</label>
<div id="mce_editor_buttonmenu">
({foreach from=$INC_HEADER_decoration_config item=item key=key})
({if $item})
<a id="mce_textmode_button_({$key})" href="#" onclick="pne_mce_insert_tagname('mce_editor_textarea', '({$key|replace:"_":":"})');"><img src="({t_img_url_skin filename=deco_`$key`})" alt="" /></a>
({/if})
({/foreach})
({if $smarty.const.OPENPNE_USE_ALBUM})
<a id="mce_textmode_button_op_image" href="#" onclick="window.open('({t_url m=pc a=page_h_album_insert_dialog})', '', 'width=600,height=550,toolbar=no,scrollbars=yes,left=10,top=10')"><img src="({t_img_url_skin filename=deco_op_image})" alt="" /></a>
({/if})
({if $smarty.const.OPENPNE_EMOJI_DOCOMO_FOR_PC})
<a id="mce_textmode_button_op_emoji_docomo" href="#" onclick="togglePallet('epDocomo');"><img src="({t_img_url_skin filename=deco_op_emoji_docomo})" alt="" /></a>
<script type="text/javascript">
//<![CDATA[
createEmojiPalletDoCoMo();
//]]>
</script>
({else})
<a id="mce_textmode_button_op_emoji_docomo" href="#" onclick="togglePallet('epDocomo');"><img src="({t_img_url_skin filename=deco_op_emoji_docomo})" alt="" /></a>
<a id="mce_textmode_button_op_emoji_au" href="#" onclick="togglePallet('epAu');"><img src="({t_img_url_skin filename=deco_op_emoji_au})" alt="" /></a>
<a id="mce_textmode_button_op_emoji_softbank" href="#" onclick="togglePallet('epSb');"><img src="({t_img_url_skin filename=deco_op_emoji_softbank})" alt="" /></a>
<script type="text/javascript">
//<![CDATA[
createEmojiPalletDoCoMo();
createEmojiPalletAu();
createEmojiPalletSoftBank();
//]]>
</script>
({/if})
</div>

<script type="text/javascript">
//<![CDATA[
pne_mce_editor_init();
//]]>
</script>

({/if})

<textarea id="mce_editor_textarea" name="({$_name|default:'body'})" rows="({$_rows|default:'15'})" cols="({$_cols|default:'50'})">({$_body})</textarea>
