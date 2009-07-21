({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="書き込みデータダウンロード"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $errors})
<p class="actionMsg">
({foreach name=err from=$errors item=i})({$i})<br />({/foreach})
</p>
({/if})
({if $msg})
<p class="actionMsg">
({$msg})<br />
</p>
({/if})
<h2 id ="ttl01">書き込みデータダウンロード</h2>
<div class="contents">

<p class="info">書き込みデータをダウンロードします。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('download_xml','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />

<table class="basicType2">
<tr class="cell01">
<th colspan="2">対象</th>
<td style="border-right-style:none">
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_0" type="radio" value="0"({if $requests.GET_DATA_TYPE == 0}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_0">日記</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_2" type="radio" value="2"({if $requests.GET_DATA_TYPE == 2}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_2">トピック</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_4" type="radio" value="4"({if $requests.GET_DATA_TYPE == 4}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_4">イベント</label><br />
</td>
<td style="border-left-style:none">
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_1" type="radio" value="1"({if $requests.GET_DATA_TYPE == 1}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_1">日記とコメント</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_3" type="radio" value="3"({if $requests.GET_DATA_TYPE == 3}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_3">トピックとコメント</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_5" type="radio" value="5"({if $requests.GET_DATA_TYPE == 5}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_5">イベントとコメント</label><br />
</td>
</tr>
<tr class="cell01">
<th colspan="2" rowspan="2">メンバー</th>
<td style="border-right-style:none">
<input class="basicRadio" name="SELECT_MEMBER" id="SELECT_MEMBER_0" type="radio" value="0"({if $requests.SELECT_MEMBER == 0}) checked="checked"({/if}) /><label for="SELECT_MEMBER_0">全員</label>
</td>
<td style="border-left-style:none">
<input class="basicRadio" name="SELECT_MEMBER" id="SELECT_MEMBER_1" type="radio" value="1"({if $requests.SELECT_MEMBER == 1}) checked="checked"({/if}) /><label for="SELECT_MEMBER_1">ＩＤ</label>
<input class="basic" name="SELECT_MEMBER_ID" type="text" value="({$requests.SELECT_MEMBER_ID})" size="11" /><br />
</td>
</tr>
<tr>
<td colspan="2"><span class="caution">※指定IDメンバーが作成したコンテンツが対象になります。<br />ただし、コメントは指定メンバー以外が作成したものも含みます。</span></td>
</tr>
<tr class="cell01">
<th colspan="2">期間</th>
<td colspan = "2">
<input class="basicRadio" name="IS_PERIOD" id="IS_PERIOD_0" type="radio" value="0"({if $requests.IS_PERIOD == 0}) checked="checked"({/if}) /><label for="IS_PERIOD_0">指定なし</label><br />
<input class="basicRadio" name="IS_PERIOD" id="IS_PERIOD_1" type="radio" value="1"({if $requests.IS_PERIOD == 1}) checked="checked"({/if}) /><label for="IS_PERIOD_1">期間指定</label><br />
<input class="basic" name="PERIOD_FROM_YEAR" type="text" value="({$requests.PERIOD_FROM_YEAR})" size="4" />年
<select name="PERIOD_FROM_MONTH">
({foreach from=$date.month item=item})<option value="({$item})"({if $requests.PERIOD_FROM_MONTH == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>月
<select name="PERIOD_FROM_DAY">
({foreach from=$date.day item=item})<option value="({$item})"({if $requests.PERIOD_FROM_DAY == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>日 ～ <br />
<input class="basic" name="PERIOD_TO_YEAR" type="text" value="({$requests.PERIOD_TO_YEAR})" size="4" />年
<select name="PERIOD_TO_MONTH">
({foreach from=$date.month item=item})<option value="({$item})"({if $requests.PERIOD_TO_MONTH == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>月
<select name="PERIOD_TO_DAY">
({foreach from=$date.day item=item})<option value="({$item})"({if $requests.PERIOD_TO_DAY == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>日 まで
</td>
</tr>
<tr class="cell01">
<th colspan="2">({$WORD_COMMUNITY})指定</th>
<td colspan = "2">
<span class="caution">※トピックのダウンロード選択時のみ有効です</span><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_0" type="radio" value="0"({if $requests.IS_COMMU == 0}) checked="checked"({/if}) /><label for="IS_COMMU_0">指定なし</label><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_1" type="radio" value="1"({if $requests.IS_COMMU == 1}) checked="checked"({/if}) /><label for="IS_COMMU_1">({$WORD_COMMUNITY})・カテゴリ</label>
<select name="CATEGORY_ID">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $requests.CATEGORY_ID == $item.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_2" type="radio" value="2"({if $requests.IS_COMMU == 2}) checked="checked"({/if}) /><label for="IS_COMMU_2">({$WORD_COMMUNITY})ＩＤ</label>
<input class="basic" name="COMMU_ID" type="text" value="({$requests.COMMU_ID})" size="11" />
</td>
</tr>
</table>

<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

({$inc_footer|smarty:nodefaults})
