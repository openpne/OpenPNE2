({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="フリーエリア設定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNSポータルクリエイター</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
    <tr>
    ({ext_include file="inc_menu_adminPortalConfig.tpl"})
        <td class="detail">
            <h3>({$page_name})</h3>
            <p>
            自由にHTMLを記述したコンテンツを5つまで作成することができます。<br />
            自分のSNSの紹介文やロゴ画像などで「SNSポータル」を演出しましょう。<br />
            小窓機能をつかって、地図や動画を貼ることも可能です。<br />
            <br />
            表示位置は、 [ コンテンツ設定 ] ページで設定してください。
            </p>
            <p class="caution" id="c01">
            ※HTMLタグが使用できますが、タグの閉じ忘れ等がありますと表示が崩れるなどの問題が起こることがありますのでご注意ください。
            </p>

            <form action="./" method="post">
            <input type="hidden" name="m" value="({$module_name})" />
            <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_free_area','do')})" />
            <input type="hidden" name="sessid" value="({$PHPSESSID})" />

            <script type="text/javascript">
            <!--
                function insertOutLineToFreeAreaTextBox(free_area_num)
                {
                    var input_area = document.getElementById('input_area');
                    var free_area_list = input_area.getElementsByTagName('textarea');
                    var target_free_area = free_area_list[(free_area_num - 1)];
                    var text_to_insert = '<div class="box PatternE">\n<div class="ttl"><h2>タイトルを入れてください<\/h2><\/div>\n<div class="innerBox">\n<div class="freeArea">本文を入れてください<\/div>\n<\/div>\n<\/div>\n';
                    target_free_area.value += text_to_insert;
                }

                function fireOnClickEventByKeyPress(e, obj)  // 特定キーが押下された場合のみ、指定されたオブジェクトの OnClick イベントを発行する
                {
                    var key;

                    if (!document.all) {
                        return false;
                    }

                    if (e) {
                        key = e.keyCode;
                    } else {
                        key = e.charCode;
                    }

                    if (key == 13 || key == 32 || key == 3) {
                        obj.onclick();
                    }
                }

                function toggleImageInsertArea(id)
                {
                    var imageInsertArea = document.getElementById(id);
                    if (imageInsertArea.style.display == "none" || !imageInsertArea.style.display) {
                        imageInsertArea.src = "?m=({$module_name})&a=page_({$hash_tbl->hash('edit_portal_image', 'page')})&target_area=target_" + id;
                        imageInsertArea.style.display = "block";
                    } else {
                        imageInsertArea.style.display = "none";
                    }
                }
            //-->
            </script>

            <table id="input_area">
                <tr>
                    <td>
                        <dl>
                        <dt class="title"><input type="text" name="free_area_name_1" value="({$portal_free_area.free_area_name_1|default:'フリーエリア1'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_1')" onkeypress="fireOnClickEventByKeyPress(event, this)">画像の挿入／アップロード</button></p>
                            <p class="textBtn"><button type="button" onclick="insertOutLineToFreeAreaTextBox(1)" onkeypress="fireOnClickEventByKeyPress(event, this)">ポートレット（枠）のHTMLを挿入</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_1" id="target_image_insert_area_1">({$portal_free_area.free_area_1})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_1" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_name_2" value="({$portal_free_area.free_area_name_2|default:'フリーエリア2'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_2')" onkeypress="fireOnClickEventByKeyPress(event, this)">画像の挿入／アップロード</button></p>
                            <p class="textBtn"><button type="button" onclick="insertOutLineToFreeAreaTextBox(2)" onkeypress="fireOnClickEventByKeyPress(event, this)">ポートレット（枠）のHTMLを挿入</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_2" id="target_image_insert_area_2">({$portal_free_area.free_area_2})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_2" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_name_3" value="({$portal_free_area.free_area_name_3|default:'フリーエリア3'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_3')" onkeypress="fireOnClickEventByKeyPress(event, this)">画像の挿入／アップロード</button></p>
                            <p class="textBtn"><button type="button" onclick="insertOutLineToFreeAreaTextBox(3)" onkeypress="fireOnClickEventByKeyPress(event, this)">ポートレット（枠）のHTMLを挿入</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_3" id="target_image_insert_area_3">({$portal_free_area.free_area_3})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_3" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_name_4" value="({$portal_free_area.free_area_name_4|default:'フリーエリア4'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_4')" onkeypress="fireOnClickEventByKeyPress(event, this)">画像の挿入／アップロード</button></p>
                            <p class="textBtn"><button type="button" onclick="insertOutLineToFreeAreaTextBox(4)" onkeypress="fireOnClickEventByKeyPress(event, this)">ポートレット（枠）のHTMLを挿入</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_4" id="target_image_insert_area_4">({$portal_free_area.free_area_4})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_4" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_name_5" value="({$portal_free_area.free_area_name_5|default:'フリーエリア5'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_5')" onkeypress="fireOnClickEventByKeyPress(event, this)">画像の挿入／アップロード</button></p>
                            <p class="textBtn"><button type="button" onclick="insertOutLineToFreeAreaTextBox(5)" onkeypress="fireOnClickEventByKeyPress(event, this)">ポートレット（枠）のHTMLを挿入</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_5" id="target_image_insert_area_5">({$portal_free_area.free_area_5})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_5" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>
                        </dl>

                        <p class="textBtn"><input type="submit" value="　変　更　" /></p>
                    </td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
</table>
<div class="contents">

({$inc_footer|smarty:nodefaults})
