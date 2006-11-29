/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//日記カテゴリ追加支援セレクトボックス用JavaScript

/**
 * カテゴリ追加支援セレクトボックスを生成する
 *
 * @param string id オブジェクトのID
 * @param array values カテゴリ名のリスト
 */
function diaryCategoryForm(id, values)
{
    document.write(this.getInsertCategoryForm(id, values));
}

/**
 * カテゴリ追加支援セレクトボックスを得る
 *
 * @param string id オブジェクト名
 * @param array values カテゴリ名のリスト
 *
 * @return string result セレクトボックスのHTML
 */
diaryCategoryForm.prototype.getInsertCategoryForm = function(id, values)
{
    var defaultValue = "";  //未選択時文言
    var beginSelect = "<select>";
    var finishSelect = "</select>";
    var insertAction = id + ".insertCategory";  //項目クリック時に実行される関数名
    var beginOption = "<option onClick=\"" + insertAction + "('";
    var finishOption = "')\">";
    var resultOption = "<option>" + defaultValue;  //結果用変数

    for (var i=0; i<values.length; i++) {
        resultOption += beginOption + id + "', '" + values[i] + finishOption + values[i];
    }

    var result = beginSelect + resultOption + finishSelect;
    return result;
}

diaryCategoryForm.prototype.insertCategory = function(id, value)
{
    var insertText = "";

    if (document.getElementById(id).value) {
        insertText = " " + value;
    } else {
        insertText = value;
    }

    document.getElementById(id).value += insertText;
}

