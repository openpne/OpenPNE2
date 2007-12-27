/**
 * Amazon review CMD
 *
 * @license http://www.php.net/license/3_0.txt PHP License ver3.0
 * @copylight 2007-2007 imoto<imoto@tejimaya.com>
 * @copylight 2007-2007 Tejimaya .inc
 * @author Imoto<imoto@tejimaya.com>
 * @author Mamoru Tejima<tejima@tejimaya.com>
 */

function url2cmd(url)
{
    var match = url.match(/(?:ASIN|product|dp)\/([^\/]+)/i);

    if (match) {
        var id = RegExp.$1;
        main(id);
    } else {
        pne_url2a(url);
    }
}

function main(id)
{
    var url = "http://amazon.openpne.jp/?id=" + id ;
    var html = ''
    + '<iframe MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" src="' + url + '" name="sample" width="420" height="320">'
    + 'この部分はインラインフレームを使用しています。'
    + '</iframe>';

    document.write(html);
}
