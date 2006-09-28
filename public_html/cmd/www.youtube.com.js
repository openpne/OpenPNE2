function url2cmd(url) {
    if (!url.match(/^http:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)$/)) {
        return;
    }
    var id = RegExp.$1;
    var width = 425;
    var height = 350;

    var html = '<object width="'
            + width
            + '" height="'
            + height
            + '"><param name="movie" value="http://www.youtube.com/v/'
            + id
            + '"></param><embed src="http://www.youtube.com/v/'
            + id
            + '" type="application/x-shockwave-flash" width="'
            + width
            + '" height="'
            + height
            + '"></embed></object>';
    document.write(html);
}
