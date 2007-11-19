 /**
  * Amazon review CMD
  *
  * @license http://www.php.net/license/3_0.txt PHP License ver3.0
  * @copylight 2007-2007 imoto<imoto@tejimaya.com>
  * @copylight 2007-2007 Tejimaya .inc
  * @author Imoto<imoto@tejimaya.com>
  * @author Mamoru Tejima<tejima@tejimaya.com>
  */
function url2cmd(url) {
	var match = url.match(/^.*(?:ASIN|product|dp)\/([^\/]+)(?:\/.*)*$/);
		
	if (match) {
	   var id = RegExp.$1;
	   main(id);
    } else {
       pne_url2a(url);
    }
}

function main(id) {
	id = htmlSpecialChars(id);
	var url = "http://amazon.openpne.jp/?id=" + id ;
    var html = ''
	+ '<iframe MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" src="' + url + '" name="sample" width="425" height="350">'
	+ 'この部分はインラインフレームを使用しています。'
	+ '</iframe>';
	
    document.write(html);
}

function htmlSpecialChars(value) {
	value = value.replace(/\</g, "&lt;").replace(/\>/g, "&gt;").replace(/\&/g, "&amp;").replace(/\"/g, "&quot;");
	//value = value.replace(/\'/g, "&#039;");
	return value;
}
