function http2cmd(url) {
    url.match(/http:\/\/www.youtube.com\/watch\?v=([a-zA-Z0-9_-]+)/g);
    var id = RegExp.$1;
	var width = 200;
	var height = parseInt(width * 14 / 17);

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
