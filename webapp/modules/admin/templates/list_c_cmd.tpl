({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="CMD設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<script type="text/javascript">
//<![CDATA[
    var permit_list = new Array(
    ({foreach from=$permit_list item=permit name=permits})
    "({$permit})"({if !$smarty.foreach.permits.last}),({/if})
    ({/foreach})
    );
    /***
     * チェックボックスによる小窓使用範囲設定の可否を切り替える
     *
     * 「使用許可」セレクトボックス選択後に呼ばれる
     *
     * @param string cmd_name CMD名称
     */
    function changePermitEnable(cmd_name)
    {
        var select_using = document.getElementById("select_using_" + cmd_name);
        var permit_prefix = "check_permit_";

        for (var i=0; i < permit_list.length; i++) {
            var permit_name = permit_list[i];
            var permit = document.getElementById(permit_prefix + cmd_name + "_" + permit_name);
            if (select_using.selectedIndex == 1) {  // 「使用しない」が選択されている
                permit.setAttribute('disabled', 'disabled');
            } else {  // 「使用する」が選択されている
                permit.removeAttribute('disabled');
                permit.setAttribute('checked', 'checked');  // 全使用範囲を選択済に
            }
        }
    }
//]]>
</script>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD設定</h2>
<div class="contents">

<p>※使用許可が「使用しない」の場合、使用範囲の設定は反映されません。</p>
<p>※小窓キャスト機能で登録された小窓の使用設定は変更できません。</p>

<table class="basicType2">
<thead>
<tr>
<th>CMD名称</th>
<th>使用許可</th>
<th>使用範囲</th>
<th colspan='2'>操作</th>
</tr>
</thead>
<tbody>

({foreach from=$c_cmd_list item=c_cmd key=cmd_name})
<tr>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="name" value="({$cmd_name})" />
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id|default:0})" />

<td>({$cmd_name})</td>
<td>
<select name="using" id="select_using_({$cmd_name})" onchange="changePermitEnable('({$cmd_name})')">
    <option value="0">使用する
    <option value="1"({if $c_cmd.disabled}) selected="selected"({/if})>使用しない
</select>
</td>
<td>

<table>
<tr>
<td>
<input name="permit[]" type="checkbox" value="1" id="check_permit_({$cmd_name})_community" ({if $c_cmd.permit.community || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_community">({$WORD_COMMUNITY})</label><br />
<input name="permit[]" type="checkbox" value="2" id="check_permit_({$cmd_name})_diary"({if $c_cmd.permit.diary || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_diary">({$WORD_DIARY})</label><br />
<input name="permit[]" type="checkbox" value="4" id="check_permit_({$cmd_name})_profile"({if $c_cmd.permit.profile || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_profile">プロフィール</label><br />
<input name="permit[]" type="checkbox" value="64" id="check_permit_({$cmd_name})_message"({if $c_cmd.permit.message || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_message">メッセージ</label><br />
</td>
<td>
<input name="permit[]" type="checkbox" value="8" id="check_permit_({$cmd_name})_side_banner"({if $c_cmd.permit.side_banner || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_side_banner">サイドバナー</label><br />
<input name="permit[]" type="checkbox" value="16" id="check_permit_({$cmd_name})_info"({if $c_cmd.permit.info || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_info">お知らせ</label><br />
<input name="permit[]" type="checkbox" value="32" id="check_permit_({$cmd_name})_entry_point"({if $c_cmd.permit.entry_point || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_entry_point">テンプレート挿入</label><br />
</td>
</tr>
</table>

</td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　変　更　" /></span></td>
</form>
</tr>
({foreachelse})
<tr>
<td colspan="5">小窓が登録されていません</td>
</tr>
({/foreach})
</tbody>

</table>

({$inc_footer|smarty:nodefaults})
