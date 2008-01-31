({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="CMDタグ生成"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMDタグ生成</h2>
<div class="contents">
<script type="text/javascript">
<!--

function check_radio(element) {

    var len = element.length;

    // ラジオボタンの数だけ繰り返す
    for (var i=0; i < len; i++) {
        // チェックされているかを判定
        if (element[i].checked) {
            return element[i].value;
        }
    }

}

/* CMDタグ生成 */
function make_cmd_tag() {
    var num = document.forms["form_cmd_tag"].elements["num"].value ;
    var data = check_radio(document.forms["form_cmd_tag"].elements["data"]);
    var order = check_radio(document.forms["form_cmd_tag"].elements["order"]);

    document.forms["form_cmd_tag"].elements["tag"].value = "<cmd src=\"sns_info\" args=\"" + data + ", " + order + ", " + num + "\">";

}

// -->
</script>

<form action="./" method="post" name="form_cmd_tag">

<table class="basicType2">

<tr>

<th>
内容
</th>

<td>
<input class="basicRadio" name="data" id="member" type="radio" value="member" checked="checked" onclick="make_cmd_tag();"/><label for="member">メンバー</label><br>
<input class="basicRadio" name="data" id="diary" type="radio" value="diary" onclick="make_cmd_tag();"/><label for="diary">日記</label><br>
<input class="basicRadio" name="data" id="commu" type="radio" value="commu" onclick="make_cmd_tag();"/><label for="commu">コミュニティ</label><br>
<input class="basicRadio" name="data" id="topic" type="radio" value="topic" onclick="make_cmd_tag();"/><label for="topic">コミュニティ・トピック</label><br>
</td>

</tr>

<tr>

<th>
順序
</th>

<td>
<input class="basicRadio" name="order" id="new" type="radio" value="new" onclick="make_cmd_tag();" checked="checked"/><label for="new">最新</label><br>
<input class="basicRadio" name="order" id="random" type="radio" value="random" onclick="make_cmd_tag();"/><label for="random">ランダム</label><br>
</td>

</tr>

<tr>

<th>
件数
</th>

<td>
<select class="basic" name="num" onkeyup="make_cmd_tag();">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5" selected="selected">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select>
</td>

</tr>

<tr>

<td colspan=2>
<textarea class="basic" name="tag" cols = 50 readonly><cmd src="sns_info" args="member, new, 5"></textarea>
</td>

</tr>


</table>

</form>

<p class="caution" id="c01">
※このタグを小窓が有効な箇所<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})">テンプレート挿入</a>（や<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">バナー設定</a>）に貼り付けてください。
</p>

({$inc_footer|smarty:nodefaults})
