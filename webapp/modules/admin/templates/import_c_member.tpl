({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メンバー情報のインポート"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>メンバー情報のインポート</h2>
<div class="contents">


({if $requests.msg})
<p class="caution">({$requests.msg})</p>
({/if})

<h3>メンバー情報をデータベースに一括登録</h3>

<p class="caution">※文字コード、ファイル形式、項目の順序を守ってください。この処理は10分以上かかる場合があります</p>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('import_c_member','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
≪ユーザデータファイル≫<br>
文字コード：UTF-8<br>
ファイル形式：csv<br>
項目の順序「ニックネーム」「登録メールアドレス」「パスワード」<br>
<input type="file" name="member_file"><br><br>
<input type="submit" class="submit" name="member_file_submit" value="登録">
</form>

({$inc_footer|smarty:nodefaults})
