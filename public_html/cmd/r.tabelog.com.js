function url2cmd(url)
{
    var rcd;
    var tag;
    var match_rcd = url.match(/[a-z]+\/A[0-9]+\/A[0-9]+\/([0-9]+)\/?/);
    if (match_rcd) {
        rcd = RegExp.$1;
    }

    var match_tag = url.match(/([a-zA-Z0-9_\-]+)/);
    if (match_tag) {
        tag = RegExp.$1;
    } else {
        tag = '';
    }

    if (rcd) {
        main(rcd, tag);
    } else {
        pne_url2a(url);
    }
}

function main(rcd, tag)
{
    var url = 'http://api.tabelog.com/RstPNEParts/?RestaurantCD=' + rcd;
    if (tag) {
        url += '' + tag;
    }

    var html = ''
    + '<iframe WIDTH="420" HEIGHT="280" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" src="' + url + '">'
    + '</iframe>';

    document.write(html);
}

