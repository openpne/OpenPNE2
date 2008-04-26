////////
// emoji-pallet
// OpenPNE PCモジュール用　絵文字入力パレット ver1.2
// 外部ウィンドウ用
// (c)2008 Cake All rights reserved.
// SNS  : http://sns.openpne.jp/?m=pc&a=page_f_home&target_c_member_id=1911
// Home : http://trpgtools-onweb.sourceforge.jp/
////////

////////
// 出力
////////
// DoCoMo
document.write('<div id="epDoCoMo">');
for (n=1; n<=eNumDocomo; n++) {
    emojiPalletPopup(n, "i");
}
document.write('</div>');

// AU
if (useAu) {
    document.write('<div id="epAu">');
    for (n=1; n<=eNumAu1; n++) {
        emojiPalletPopup(n, "e");
    }
    for (n=700; n<=eNumAu2; n++) {
       emojiPalletPopup(n, "e");
    }
    document.write('</div>');
}
// SoftBank
if (useSb) {
    document.write('<div id="epSb">');
    for (n=1; n<=eNumSb; n++) {
        emojiPalletPopup(n, "s");
    }
    document.write('</div>');
}

////////
// 関数
////////

// 絵文字出力(外部パレット版）
function emojiPalletPopup(i, career) {
    document.write('<img src="../../skin/default/img/emoji/'+career+'/'+career+i+'.gif" alt="['+career+':'+i+']" onclick=\'putEmojiToParent("['+career+':'+i+']")\'>');
}

// 絵文字コードを親画面のテキストエリアに入力
function putEmojiToParent(emoji) {
    opener.document.getElementsByName("body")[0].focus();

    // selectionStart対応の場合、選択位置に絵文字挿入
    if (opener.document.getElementsByName("body")[0].selectionStart) {
        var position = opener.document.getElementsByName("body")[0].selectionStart;
        var emojiPosition = opener.position + emoji.length;
        var body = opener.document.getElementsByName("body")[0].value.substring(0, position) + emoji + opener.document.getElementsByName("body")[0].value.substring(position, opener.document.getElementsByName("body")[0].value.length);
        opener.document.getElementsByName("body")[0].value = body;   
        opener.document.getElementsByName("body")[0].setSelectionRange(emojiPosition, emojiPosition);
    } else {
        // IEの場合(selection対応)
        if (opener.document.selection) {
            var sel = opener.document.selection.createRange();
            sel.text = emoji;
            sel.move('character', emoji.length+4);
        // その他の場合は入力済み文章の末尾に絵文字を追加
        } else {
            var body = opener.document.getElementsByName("body")[0].value + emoji;
            opener.document.getElementsByName("body")[0].value = body;
        }
    }
}
