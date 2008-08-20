function url2cmd(url, target_c_member_id)
{
    if (!url.match(/(https?:\/\/[a-zA-Z0-9_\-\/.,:;~@=+$%#!\()]+)\/?\?(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!\()]|&amp;)*&amp;target_c_album_id=([a-zA-Z0-9_\-]+)/)) {
        pne_url2a(url);
        return;
    }
    var openpne_url = RegExp.$1;
    var target_c_album_id = RegExp.$2;

    var xml_url = openpne_url + "?m=pc&a=page_fh_album_output_xml&target_c_album_id=" + target_c_album_id;

    var request_headers = [];
    if (Prototype.Browser.IE) {
        request_headers.push('If-Modified-Since', 'Thu, 01 Jun 1970 00:00:00 GMT');
    }

    new Ajax.Request(xml_url, {
        asynchronous : false ,
        method: "get",

        onSuccess: function(obj) {
            var c_album = obj.responseXML.firstChild;
            var c_member = c_album.getElementsByTagName('c_member')[0];
            var word_my_friend = c_album.getElementsByTagName('word_my_friend')[0].firstChild.nodeValue;

            if (target_c_member_id != c_member.getElementsByTagName('c_member_id')[0].firstChild.nodeValue) {
                pne_url2a(url);
                return;
            }

            var subject = c_album.getElementsByTagName('subject')[0].firstChild.nodeValue;
            var nickname = c_member.getElementsByTagName('nickname')[0].firstChild.nodeValue;
            var album_cover_image = c_album.getElementsByTagName('album_cover_image')[0].firstChild.nodeValue.unescapeHTML();
            if (!album_cover_image.match(/^[a-z0-9_\-\/.\/&;=?]+$/)) {
                pne_url2a(url);
                return;
            }

            var public_flag = '';
            switch (c_album.getElementsByTagName('public_flag')[0].firstChild.nodeValue) {
            case 'public' :
                public_flag = "(全員に公開)";
                break;
            case 'friend' :
                public_flag += "(" + word_my_friend + "まで公開)";
                break;
            case 'private' :
                public_flag += "(公開しない)";
                break;
            default :
            }

            var str = '<div class="dparts" style="width: 200px; margin: 4px auto 0"><div class="parts">'
                    + '<div class="partsHeading" style="border-top-width: 0;"><h3>' + subject + '</h3></div>'
                    + '<div style="text-align: center; padding: 10px;"><img src="' + album_cover_image + '" alt="' + subject + '" style="margin: 0 auto;" /></div>'
                    + '<div style="text-align: center; padding: 5px;">' + public_flag + '</div>'
                    + '<div style="text-align: center; padding: 5px;"><a href="' + url + '">アルバムを見る</a></div>'
                    + '</div></div>';

            document.write(str);
        },

        onFailure: function(obj) {
            pne_url2a(url);
        },

        requestHeaders: request_headers
    });
}
