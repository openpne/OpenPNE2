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

({****************************
<img src="./skin/dummy.gif" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;">
<tr>

<td align="center">
<div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="bg_11">
    <tr>
        <td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
        <td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tfcb})</span></td>
    </tr>
</table>
<table border="0" cellspacing="1" cellpadding="0" style="width:636px;" class="border_01">
    <tr>
        <td class="bg_02"  style="width:136px;">
        <div class="padding_s">
        ({$ltag.album_Title})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" style="width:500px;" valign="middle">
        <div class="padding_s">
        ({$form_val.subject})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({if $form_val.upfile_1.name})
    <tr>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$ltag.album_cover}) 
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$form_val.upfile_1.name})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({/if})
    <tr>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s" style="overflow: auto;">
        ({$ltag.album})({$ltag.description})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$form_val.description|nl2br})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({if $form_val.category})
    <tr>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$ltag.group_blog})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$form_val.category})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({/if})
    ({if $form_val.c_commu_id})
        <tr>
            <td class="bg_02" align="left" valign="middle">
            <div class="padding_s">
            ({$ltag.h_album_add_commu_choose})
            </div>
            </td>
            <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
            <td class="bg_02" align="left" valign="middle">
            <div class="padding_s">
            ({$commu_name})
            </div>
            </td>
        </tr>
        <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
        ({/if})
    <tr>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$ltag.open_range})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({if $form_val.public_flag == "public"})
        ({$ltag.album_public})
        ({elseif $form_val.public_flag == "friend"})
        ({$ltag.album_face})({$WORD_MY_FRIEND})({$ltag.album_op})
        ({elseif $form_val.public_flag == "private"})
        ({$ltag.not_open})
        ({/if})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({if $form_val.album_pwd})
    <tr>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$ltag.fh_album_list_password})
        </div>
        </td>
        <td style="width:1px;" class="bg_01" align="center">
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        <td class="bg_02" align="left" valign="middle">
        <div class="padding_s">
        ({$form_val.album_pwd})
        </div>
        </td>
    </tr>
    <tr>
            <td style="height:1px;" class="bg_01" align="center" colspan=3>
            <img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy">
            </td>
        </tr>
    ({/if})
    <tr>
        <td class="bg_02" align="center" valign="middle" colspan="3">
        <div class="padding_w_s">
            <table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;">
                <tr>
                ({t_form m=pc a=do_h_album_cover_edit_insert_c_album})
                <input type="hidden" name="sessid" value="({$PHPSESSID})">
                <input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
                <input type="hidden" name="target_c_commu_id" value="({$form_val.c_commu_id})">
                <input type="hidden" name="subject" value="({$form_val.subject})">
                <input type="hidden" name="description" value="({$form_val.description})">
                <input type="hidden" name="category" value="({$form_val.category})">
                <input type="hidden" name="public_flag" value="({$form_val.public_flag})">
                <input type="hidden" name="album_pwd" value="({$form_val.album_pwd})">
                <input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
                <td><input type="submit" class="submit" value="　({$ltag.released_2})　"></td>
                </form>
                ({t_form m=pc a=page_h_album_cover_edit})
                <input type="hidden" name="sessid" value="({$PHPSESSID})">
                <input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})">
                <input type="hidden" name="target_c_commu_id" value="({$form_val.c_commu_id})">
                <input type="hidden" name="subject" value="({$form_val.subject})">
                <input type="hidden" name="description" value="({$form_val.description})">
                <input type="hidden" name="category" value="({$form_val.category})">
                <input type="hidden" name="public_flag" value="({$form_val.public_flag})">
                <input type="hidden" name="album_pwd" value="({$form_val.album_pwd})">
                <input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
                <input type="hidden" name="description" value="({$form_val.description})">
                <td><input type="submit" class="submit" value="　({$ltag.Changes})　"></td>
                </form>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>    
</td>
</tr>
</table>
<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- delete by openkaku team on 080313
({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
-->
**************************})
