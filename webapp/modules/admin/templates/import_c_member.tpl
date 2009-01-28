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
<li>※この処理には長時間かかる場合があります。</li>
</ul>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('import_c_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p><input type="file" name="member_file" /></p>
<p class="textBtn"><input type="submit" class="submit" value="　登　録　" /></p>
</form>

<h3 class="item">CSVファイル形式</h3>
<ul>
<li>文字コード： UTF-8</li>
<li>ファイルの拡張子： .csv</li>
</ul>
<p>1行目にタイトル行、2行目以降にメンバー情報を記載します。</p>
<p>タイトル行には以下の項目が記載できます。</p>

<table class="basicType2">
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr><th>login_id ※</th><td>ログインID</td></tr>
({/if})
<tr><th>nickname ※</th><td>ニックネーム</td></tr>
<tr><th>mail_address ※</th><td>メールアドレス（PCメールアドレス、携帯メールアドレスどちらでも入力可能）</td></tr>
<tr><th>password ※</th><td>パスワード</td></tr>
<tr><th>birth_year</th><td>生まれた年</td></tr>
<tr><th>birth_month</th><td>誕生月</td></tr>
<tr><th>birth_day</th><td>誕生日</td></tr>
<tr><th>public_flag_birth_year</th><td>生まれた年の公開設定（public, friend, private）</td></tr>
<tr><th>public_flag_birth_month_day</th><td>誕生月・誕生日の公開設定（public, friend, private）</td></tr>
<tr><th>profile[識別名]</th><td>プロフィール項目（[]内に<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile','page')})">プロフィール項目設定</a>で設定した識別名を入れます）<br />
<br />
フォームタイプが「単一選択」もしくは「複数選択」の場合は、2行目以降にプロフィール選択肢のIDを入力します。<br />
「複数選択」の場合にはプロフィール選択肢のIDをカンマ(,)区切りで複数入力することができます。</td></tr>
</table>
<p>※({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})「login_id」({/if})「nickname」「mail_address」「password」は必須項目です。</p>

<h3 class="item">CSVファイル例</h3>
<textarea cols="120" rows="5" readonly="readonly">
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})login_id,({/if})nickname,mail_address,password,birth_year,birth_month,birth_day,profile[blood_type],profile[self_intro],profile[sample]
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})"user1",({/if})"ヤマダ","yamada@example.com","password1",1977,3,25,3,"よろしくお願いします。","150,151"
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})"user2",({/if})"さとう","sato@example.com","password2",1985,12,2,5,"がんばります。","152"
</textarea>

({$inc_footer|smarty:nodefaults})
