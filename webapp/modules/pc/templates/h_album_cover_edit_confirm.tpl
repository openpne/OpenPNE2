<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下の内容でよろしいですか？</h3></div>
<table>
<tr>
<th>タイトル</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>アルバム説明</th>
<td>({$form_val.description|nl2br})</td>
</tr>
<tr>
<th>表紙</th>
<td>({$form_val.upfile_1.name})</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
({* #1931 *})({if $form_val.public_flag == "public"})
({* #1931 *})全員に公開
({* #1931 *})({elseif $form_val.public_flag == "friend"})
({* #1931 *})({$WORD_MY_FRIEND})まで公開
({* #1931 *})({elseif $form_val.public_flag == "private"})
({* #1931 *})公開しない
({* #1931 *})({/if})
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_cover_edit_insert_c_album})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　決　定　">
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_cover_edit})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　修 　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->

({* unknown *})({****************************
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;">
({* unknown *})<tr>
({* unknown *})
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="bg_11">
({* unknown *})    <tr>
({* unknown *})        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tfcb})</span></td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="1" cellpadding="0" style="width:636px;" class="border_01">
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02"  style="width:136px;">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$ltag.album_Title})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" style="width:500px;" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$form_val.subject})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({if $form_val.upfile_1.name})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$ltag.album_cover}) 
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$form_val.upfile_1.name})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({/if})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s" style="overflow: auto;">
({* unknown *})        ({$ltag.album})({$ltag.description})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$form_val.description|nl2br})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({if $form_val.category})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$ltag.group_blog})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$form_val.category})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({/if})
({* unknown *})    ({if $form_val.c_commu_id})
({* unknown *})        <tr>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div class="padding_s">
({* unknown *})            ({$ltag.h_album_add_commu_choose})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})            <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})            <td class="bg_02" align="left" valign="middle">
({* unknown *})            <div class="padding_s">
({* unknown *})            ({$commu_name})
({* unknown *})            </div>
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})        ({/if})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$ltag.open_range})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({if $form_val.public_flag == "public"})
({* unknown *})        ({$ltag.album_public})
({* unknown *})        ({elseif $form_val.public_flag == "friend"})
({* unknown *})        ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
({* unknown *})        ({elseif $form_val.public_flag == "private"})
({* unknown *})        ({$ltag.not_open})
({* unknown *})        ({/if})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({if $form_val.album_pwd})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$ltag.fh_album_list_password})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})        <td style="width:1px;" class="bg_01" align="center">
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        <td class="bg_02" align="left" valign="middle">
({* unknown *})        <div class="padding_s">
({* unknown *})        ({$form_val.album_pwd})
({* unknown *})        </div>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})    <tr>
({* unknown *})            <td style="height:1px;" class="bg_01" align="center" colspan=3>
({* unknown *})            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
({* unknown *})            </td>
({* unknown *})        </tr>
({* unknown *})    ({/if})
({* unknown *})    <tr>
({* unknown *})        <td class="bg_02" align="center" valign="middle" colspan="3">
({* unknown *})        <div class="padding_w_s">
({* unknown *})            <table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
({* unknown *})                <tr>
({* unknown *})                ({t_form m=pc a=do_h_album_cover_edit_insert_c_album})
({* unknown *})                <input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})                <input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
({* unknown *})                <input type="hidden" name="target_c_commu_id" value="({$form_val.c_commu_id})">
({* unknown *})                <input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})                <input type="hidden" name="description" value="({$form_val.description})">
({* unknown *})                <input type="hidden" name="category" value="({$form_val.category})">
({* unknown *})                <input type="hidden" name="public_flag" value="({$form_val.public_flag})">
({* unknown *})                <input type="hidden" name="album_pwd" value="({$form_val.album_pwd})">
({* unknown *})                <input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
({* unknown *})                <td><input type="submit" class="submit" value="　({$ltag.released_2})　"></td>
({* unknown *})                </form>
({* unknown *})                ({t_form m=pc a=page_h_album_cover_edit})
({* unknown *})                <input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})                <input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
({* unknown *})                <input type="hidden" name="target_c_commu_id" value="({$form_val.c_commu_id})">
({* unknown *})                <input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})                <input type="hidden" name="description" value="({$form_val.description})">
({* unknown *})                <input type="hidden" name="category" value="({$form_val.category})">
({* unknown *})                <input type="hidden" name="public_flag" value="({$form_val.public_flag})">
({* unknown *})                <input type="hidden" name="album_pwd" value="({$form_val.album_pwd})">
({* unknown *})                <input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
({* unknown *})                <input type="hidden" name="description" value="({$form_val.description})">
({* unknown *})                <td><input type="submit" class="submit" value="　({$ltag.Changes})　"></td>
({* unknown *})                </form>
({* unknown *})                </tr>
({* unknown *})            </table>
({* unknown *})        </td>
({* unknown *})    </tr>
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
({* unknown *})-->
({* unknown *})**************************})
