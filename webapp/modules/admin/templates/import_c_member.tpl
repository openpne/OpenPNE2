({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="CSVインポート"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>CSVインポート</h2>
<div class="contents">

({if $requests.msg})
<p class="actionMsg">({$requests.msg})</p>
({/if})

<p>以下のフォームからメンバー情報の記載されたCSVファイルをアップロードすると、メンバーを登録することができます。</p>

<ul class="caution">
<li>※1ファイルで登録処理がおこなわれるのは1000行目までです。以降の行は無視されます。</li>
<li>※文字コード、ファイル形式を守ってください。</li>
<li>※この処理には10分以上かかる場合があります。</li>
</ul>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('import_c_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p><input type="file" name="member_file" /></p>
<p class="textBtn"><input type="submit" class="submit" value="登録" /></p>
</form>

<h3 class="item">メンバー情報CSVファイル形式</h3>
<ul>
<li>文字コード： UTF-8</li>
<li>ファイルの拡張子： .csv</li>
</ul>
<p>1行目にタイトル行、2行目以降にメンバー情報を記載します。</p>
<p>タイトル行には以下の項目が記載できます。</p>
<ul>
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})<li>login_id</li>({/if})
<li>nickname</li>
<li>mail_address</li>
<li>password</li>
<li>birth_year</li>
<li>birth_month</li>
<li>birth_day</li>
<li>public_flag_birth_year</li>
<li>public_flag_birth_month_day</li>
<li>profile[識別名]</li>
</ul>
<p>※({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})「login_id」({/if})「nickname」「mail_address」「password」は必須項目です。</p>

({$inc_footer|smarty:nodefaults})
