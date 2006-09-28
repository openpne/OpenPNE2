function url2cmd(url){
    if (!url.match(/^http:\/\/www\.watchme\.tv\/v\/\?mid=([a-z0-9]+)$/)) {
        return;
    }
    var id =  RegExp.$1;
    main(id,425,350);
}
function main(id, width, height) {
	if (!id.match(/^[a-zA-Z0-9_-]+$/)) {
		return;
	}
	width = parseInt(width);
	height = parseInt(height);
	if (width <= 0 || width > 425) {
		width = 400;
	}
	if (height <= 0 || height > 350) {
		height = 330;
	}

	var html =
			'<object width="'
			+width
			+'" height="'
			+height
			+'">'
			+'<param name="movie" value="http://www.watchme.tv/p/video_output.swf?mid='
			+id
			+'"></param>'
			+'<embed src="http://www.watchme.tv/p/video_output.swf?mid='
			+id
			+'" type="application/x-shockwave-flash" width="'
			+ width
			+ '" height="'
			+ height
			+ '"></embed></object>';
	document.write(html);
}
