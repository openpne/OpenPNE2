({$inc_header|smarty:nodefaults})

<h2>SNS設定変更</h2>

({if $msg})<p class="caution">({$msg})</p>({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_config','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table>

<tr>
<th>SNS名</th>
<td><input name="SNS_NAME" type="text" class="text" value="({$smarty.const.SNS_NAME})" size="30"></td>
</tr>
<tr>
<th>ページタイトル</th>
<td><input name="SNS_TITLE" type="text" class="text" value="({$smarty.const.SNS_TITLE})" size="30"><br>
<span class="caution">※HTMLのtitle要素の内容になります。省略時はSNS名が使用されます</span></td>
</tr>
<tr>
<th>管理用メールアドレス</th>
<td><input name="ADMIN_EMAIL" type="text" class="text" value="({$smarty.const.ADMIN_EMAIL})" size="40"><br>
<span class="caution">※ユーザに送られるメールのFromに設定されます</span></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>招待制/オープン制</th>
<td>
<input name="IS_CLOSED_SNS" id="IS_CLOSED_SNS_1" type="radio" value="1"({if $smarty.const.IS_CLOSED_SNS}) checked="checked"({/if})><label for="IS_CLOSED_SNS_1">招待制</label>
<span class="caution">(参加者の招待がなければ登録できません)</span><br>
<input name="IS_CLOSED_SNS" id="IS_CLOSED_SNS_0" type="radio" value="0"({if !$smarty.const.IS_CLOSED_SNS}) checked="checked"({/if})><label for="IS_CLOSED_SNS_0">オープン制</label>
<span class="caution">(参加者の招待なしでも登録できます)</span><br>
</td>
</tr>
<tr>
<th>ユーザ招待可否</th>
<td>
<select name="IS_USER_INVITE">
<option value="1"({if $smarty.const.IS_USER_INVITE}) selected="selected"({/if})>招待可にする</option>
<option value="0"({if !$smarty.const.IS_USER_INVITE}) selected="selected"({/if})>招待不可にする</option>
</select>
</td>
</tr>
<tr>
<th>PC版使用設定</th>
<td>
<select name="OPENPNE_ENABLE_PC">
<option value="1"({if $smarty.const.OPENPNE_ENABLE_PC}) selected="selected"({/if})>使用可にする</option>
<option value="0"({if !$smarty.const.OPENPNE_ENABLE_PC}) selected="selected"({/if})>使用不可にする</option>
</select>
</td>
</tr>
<tr>
<th>携帯版使用設定</th>
<td>
<select name="OPENPNE_ENABLE_KTAI">
<option value="1"({if $smarty.const.OPENPNE_ENABLE_KTAI}) selected="selected"({/if})>使用可にする</option>
<option value="0"({if !$smarty.const.OPENPNE_ENABLE_KTAI}) selected="selected"({/if})>使用不可にする</option>
</select>
</td>
</tr>
<tr>
<th>登録の可否</th>
<td>
<input name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_PCKTAI" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_PCKTAI})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PCKTAI}) checked="checked"({/if})><label for="OPENPNE_REGIST_FROM_PCKTAI">PC・携帯両方から登録可</label><br>
<input name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_PC" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_PC})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC}) checked="checked"({/if})><label for="OPENPNE_REGIST_FROM_PC">PCからのみ登録可</label><br>
<input name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_KTAI" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_KTAI})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI}) checked="checked"({/if})><label for="OPENPNE_REGIST_FROM_KTAI">携帯からのみ登録可</label><br>
<input name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_NONE" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_NONE})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE}) checked="checked"({/if})><label for="OPENPNE_REGIST_FROM_NONE">登録一時停止</label><br>
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>AmazonアソシエイトID</th>
<td><input name="AMAZON_AFFID" type="text" class="text" value="({$smarty.const.AMAZON_AFFID})" size="30"><br>
<span class="caution">※空にするとレビュー機能が正常に動作しません</span></td>
</tr>
<tr>
<th>外部ログインページURL</th>
<td><input name="LOGIN_URL_PC" type="text" class="text" value="({$smarty.const.LOGIN_URL_PC})" size="50"><br>
<span class="caution">
※通常のログインページを使用する場合は空欄にしておきます<br>
<br>
ログアウトした場合やログインに失敗した場合、ここで指定したURLに遷移します<br>
ここで指定するページには<a href="#form">ログインフォーム</a>を置いておく必要があります</span></td>
</tr>
<tr>
<th>通常ログインページ<br>表示設定</th>
<td><select name="DISPLAY_LOGIN">
<option value="1"({if $smarty.const.DISPLAY_LOGIN}) selected="selected"({/if})>通常のログインページも表示する</option>
<option value="0"({if !$smarty.const.DISPLAY_LOGIN}) selected="selected"({/if})>外部ログインページへリダイレクトする</option>
</select><br>
<span class="caution">
※外部ログインページURLを指定している場合に、<br>
通常のログインページを表示するかどうかを設定します
</span></td>
</tr>
<tr>
<th>PC版ホーム<br>週間スケジュール</th>
<td><select name="DISPLAY_SCHEDULE_HOME">
<option value="1"({if $smarty.const.DISPLAY_SCHEDULE_HOME}) selected="selected"({/if})>表示する</option>
<option value="0"({if !$smarty.const.DISPLAY_SCHEDULE_HOME}) selected="selected"({/if})>表示しない</option>
</select></td>
</tr>
<tr>
<th>PC版ホーム<br>検索バー</th>
<td><select name="DISPLAY_SEARCH_HOME">
<option value="1"({if $smarty.const.DISPLAY_SEARCH_HOME}) selected="selected"({/if})>表示する</option>
<option value="0"({if !$smarty.const.DISPLAY_SEARCH_HOME}) selected="selected"({/if})>表示しない</option>
</select></td>
</tr>

<tr>
<th>デイリーニュース<br>受信頻度の設定</th>
<td>
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_mon" type="checkbox" value="月"({if in_array("月", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_mon">月</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_tue" type="checkbox" value="火"({if in_array("火", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_tue">火</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_wed" type="checkbox" value="水"({if in_array("水", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_wed">水</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_thu" type="checkbox" value="木"({if in_array("木", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_thu">木</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_fri" type="checkbox" value="金"({if in_array("金", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_fri">金</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_sat" type="checkbox" value="土"({if in_array("土", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_sat">土</label>&nbsp;
<input name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_sun" type="checkbox" value="日"({if in_array("日", $DAILY_NEWS_DAY)}) checked="checked"({/if})><label for="DAILY_NEWS_DAY_sun">日</label><br>
<span class="caution">※「毎日」「受信しない」以外の選択肢に設定したときの受信頻度を設定します
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>お気に入りフィード<br>使用設定</th>
<td><select name="USE_BOOKMARK_FEED">
<option value="1"({if $smarty.const.USE_BOOKMARK_FEED}) selected="selected"({/if})>使用する</option>
<option value="0"({if !$smarty.const.USE_BOOKMARK_FEED}) selected="selected"({/if})>使用しない</option>
</select><br>
<span class="caution">※お気に入りに登録しているメンバーの最新情報をPC版ホームに表示するかどうかを設定します</td>
</tr>
<tr>
<th>忍び足機能<br>使用設定</th>
<td><select name="USE_SHINOBIASHI">
<option value="1"({if $smarty.const.USE_SHINOBIASHI}) selected="selected"({/if})>使用する</option>
<option value="0"({if !$smarty.const.USE_SHINOBIASHI}) selected="selected"({/if})>使用しない</option>
</select><br>
<span class="caution">※忍び足機能(ユーザによるあしあとを残すかどうかの設定)を有効にするかどうかを設定します</span></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>cmdタグ使用設定</th>
<td><select name="OPENPNE_USE_CMD_TAG">
<option value="1"({if $smarty.const.OPENPNE_USE_CMD_TAG}) selected="selected"({/if})>使用する</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_CMD_TAG}) selected="selected"({/if})>使用しない</option>
</select><br>
<span class="caution">※独自タグ cmd をユーザが使えるようにするかどうかを設定します</span></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>ログイン制限</th>
<td>
<input name="LOGIN_CHECK_ENABLE" type="radio" value="0"({if !$smarty.const.LOGIN_CHECK_ENABLE}) checked="checked"({/if})>制限しない<br>
<input name="LOGIN_CHECK_ENABLE" type="radio" value="1"({if $smarty.const.LOGIN_CHECK_ENABLE}) checked="checked"({/if})>制限する<br>
　　<input name="LOGIN_CHECK_TIME" type="text" class="text" value="({$smarty.const.LOGIN_CHECK_TIME})" size="5">分間に
<input name="LOGIN_CHECK_NUM" type="text" class="text" value="({$smarty.const.LOGIN_CHECK_NUM})" size="8">回ログインに失敗したら<br>
　　<input name="LOGIN_REJECT_TIME" type="text" class="text" value="({$smarty.const.LOGIN_REJECT_TIME})" size="5">分間同一IPからのログインを制限する
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>(メール用)キャッチコピー</th>
<td><input name="CATCH_COPY" type="text" class="text" value="({$smarty.const.CATCH_COPY})" size="30"></td>
</tr>
<tr>
<th>(メール用)運営会社</th>
<td><input name="OPERATION_COMPANY" type="text" class="text" value="({$smarty.const.OPERATION_COMPANY})" size="30"></td>
</tr>
<tr>
<th>(メール用)Copyright</th>
<td><input name="COPYRIGHT" type="text" class="text" value="({$smarty.const.COPYRIGHT})" size="30"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>(名称)フレンド</th>
<td><input name="WORD_FRIEND" type="text" class="text" value="({$smarty.const.WORD_FRIEND})" size="30"></td>
</tr>
<tr>
<th>(名称)マイフレンド</th>
<td><input name="WORD_MY_FRIEND" type="text" class="text" value="({$smarty.const.WORD_MY_FRIEND})" size="30"></td>
</tr>
<tr>
<th>(名称)(携帯)ﾌﾚﾝﾄﾞ</th>
<td><input name="WORD_FRIEND_HALF" type="text" class="text" value="({$smarty.const.WORD_FRIEND_HALF})" size="30"></td>
</tr>
<tr>
<th>(名称)(携帯)ﾏｲﾌﾚﾝﾄﾞ</th>
<td><input name="WORD_MY_FRIEND_HALF" type="text" class="text" value="({$smarty.const.WORD_MY_FRIEND_HALF})" size="30"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>アフィリエイト用タグ</th>
<td>
<textarea name="AFFILIATE_TAG" cols="60" rows="3">({$smarty.const.AFFILIATE_TAG})</textarea><br>
<span class="caution">※PC版登録完了ページに挿入されます</span><br><br>
【記入例】<br>
({literal})
&lt;img src="https://px.a8.net/cgi-bin/a8fly/sales?pid=s0001&amp;so=<strong>({$ID})</strong>&amp;si=000.000.A8&amp;ts=<strong>({$DATETIME})</strong>"<br>
&nbsp;width="1" height="1"&gt;<br>
<br>
【タグ内で利用可能な変数】<br>
({$ID})： メンバーID<br>
({$DATETIME})： 日時（YYYYMMDDHHMMSS形式）
({/literal})
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>


<tr>
<th>&nbsp;</th>
<td><input type="submit" class="submit" value="設定変更"></td>
</tr>
</table>
</form>

<hr>

<h3><a name="form">外部ログインフォーム用HTML</a></h3>

<p>通常のログインページ以外の外部ログインページを設定する場合は、<br>
以下のHTMLを使ってログイン用フォームを作成してください。</p>

({capture name=html_form})
<form action="({$smarty.const.OPENPNE_URL})" method="post">
<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="do_o_login">
<dl>
<dt><label for="username">メールアドレス</label></dt>
<dd><input type="text" name="username" id="username" value="" tabindex="1"></dd>
<dt><label for="password">パスワード</label></dt>
<dd><input type="password" name="password" id="password" tabindex="2"></dd>
<dd><input type="checkbox" name="is_save" id="is_save" value="1" tabindex="3"><label for="is_save">次回から自動的にログイン</label></dd>
<dd><input type="submit" value="ログイン" tabindex="4"></dd>
</dl>
</form>({/capture})

<p>
■ログインフォーム<br>
<textarea cols="84" rows="14" readonly="readonly">({$smarty.capture.html_form})</textarea>
</p>


({capture name=html_password})
<a href="({t_url _html=0 _absolute=1 m=pc a=page_o_password_query})">パスワードを忘れた方はこちらへ</a>({/capture})

<p>
■パスワード再発行ページへのリンク<br>
<textarea cols="84" rows="3" readonly="readonly">({$smarty.capture.html_password})</textarea>
</p>

({if !$smarty.const.IS_CLOSED_SNS})
({capture name=html_regist})
<a href="({t_url _html=0 _absolute=1 m=pc a=page_o_public_invite})">新規登録</a>({/capture})

<p>
■新規登録ページへのリンク<br>
<textarea cols="84" rows="3" readonly="readonly">({$smarty.capture.html_regist})</textarea>
</p>
({/if})

({$inc_footer|smarty:nodefaults})