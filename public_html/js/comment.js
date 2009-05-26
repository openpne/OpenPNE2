function response_comment_format(nickname, num, target_textarea){
    var a = document.getElementById(target_textarea);
    a.value += '>>' + num + ' ' + nickname + 'さん' + "\n";
    location.href = '#' + target_textarea;
}
