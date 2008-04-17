<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>本当に削除しますか？</h3></div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_album_delete_c_album})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="submit" class="input_submit" value=" は い " />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_album_cover_edit})
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="submit" class="input_submit" value="いいえ" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->


({* unknown *})({************************
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="bg_11">
({* unknown *})        <tr>
({* unknown *})            <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})            <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.h_delete_album_delete_confirm})</span></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})    <table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})        <tr>
({* unknown *})            <td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})            <td style="width:634px;" class="bg_02" align="center" valign="middle">
({* unknown *})            <div class="padding_w_m">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="2" style="width:200px;height:2em;">
({* unknown *})            <tr>
({* unknown *})            ({t_form m=pc a=do_fh_album_delete_c_album})
({* unknown *})            <input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})            <input type="hidden" name="target_c_album_id" value="({$target_c_album.c_album_id})">
({* unknown *})            <td align="right">
({* unknown *})            <input type="submit" class="submit" value=" ({$ltag.yes}) ">
({* unknown *})            </td>
({* unknown *})            </form>
({* unknown *})            ({t_form m=pc a=page_h_album_cover_edit})
({* unknown *})            <input type="hidden" name="target_c_album_id" value="({$target_c_album.c_album_id})">
({* unknown *})            <input type="hidden" name="target_c_member_id" value="({$target_c_album.c_member_id})">
({* unknown *})            <td>
({* unknown *})            <input type="submit" class="submit" value=" ({$ltag.no}) ">
({* unknown *})            </td>
({* unknown *})            </form>
({* unknown *})            </tr>
({* unknown *})            </table>
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})        </tr>
({* unknown *})    </table>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})***********************})
