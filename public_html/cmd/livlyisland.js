function main(id, sv) {
    if (!id.match(/^[a-zA-Z0-9]+$/)) {
        return;
    }
    if (!sv.match(/^[0-9]+$/)) {
        return;
    }
    var html = '<script language="JavaScript" src="http://www.livly.com/b.php?uid='
        + id
        + '&s='
        + sv
        + '"></script>';
    document.write(html);
}
