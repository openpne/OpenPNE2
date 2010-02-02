function main(id) {
    if (!id.match(/^[a-zA-Z0-9]+$/)) {
        pne_url2a(url);
        return;
    }
    var html = '<script language="JavaScript" src="http://www.livly.com/room/myroom_b/'
        + id
        + '/"></script>';
    document.write(html);
}
