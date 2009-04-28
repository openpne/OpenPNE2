var add_event = function () {
    // 選択したIDを取得
    var do_select_delete = function () {
        var select = document.getElementsByName("del");
        var ids_ary = new Array();
        for (var i=0; i<select.length; ++i) {
            if (select[i].checked) {
                ids_ary.push(select[i].value);
            }
        }
        // IDの格納
        $("del-ids").value = ids_ary.join(":");

        // フォームの送信
        $("select-delete-form").submit();
    };

    // ボタンにイベントを追加
    Event.observe("select-delete", "click", do_select_delete, false);
};

// ページのロード時にイベントをセット
Event.observe(window, "load", add_event, false);

