//MASTER:flipclip.net.js SLAVE:www.flipclip.net.js
function url2cmd(url) {
    if (!url.match(/^http:\/\/(?:www\.|)flipclip\.net\/clips\/(?:[a-zA-Z0-9_\-]+\/|)([a-zA-Z0-9_\-]+)\/?$/)) {
        pne_url2a(url);
        return;
    }
    var clipid = RegExp.$1;
    main(clipid);
}

function main(clipid) {
    if (!clipid.match(/^[a-zA-Z0-9_\-]+$/)) {
        return;
    }

    document.writeln('<script type="text/javascript" src="http://www.flipclip.net/js/'+clipid+'" >');
    document.writeln('</script>');
}
