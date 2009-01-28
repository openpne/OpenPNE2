function url2cmd(url, target_c_member_id)
{
    if (!url.match(/(https?:\/\/[a-zA-Z0-9_\-\/.,:;~@=+$%#!\()]+)\/?\?(?:[a-zA-Z0-9_\-\/.,:;~?@=+$%#!\()]|&amp;)*&amp;target_c_album_image_id=([a-zA-Z0-9_\-]+)/)) {
        pne_url2a(url);
        return;
    }
    var openpne_url = RegExp.$1;
    var target_c_album_image_id = RegExp.$2;

    var request_headers = [];
    if (Prototype.Browser.IE) {
        request_headers.push('If-Modified-Since', 'Thu, 01 Jun 1970 00:00:00 GMT');
    }

    var xml_url = openpne_url + "?m=pc&a=page_fh_album_image_show_output_xml&target_c_album_image_id=" + target_c_album_image_id;
    new Ajax.Request(xml_url, {
        asynchronous : false ,
        method: "get",

        onSuccess: function(obj) {
            var c_album_image = obj.responseXML.firstChild;

            var image_filename = c_album_image.getElementsByTagName('image_filename')[0].firstChild.nodeValue.unescapeHTML();
            if (!image_filename.match(/^[a-z0-9_\-\/.\/&;=?]+$/)) {
                pne_url2a(url);
                return;
            }

            var image_description = c_album_image.getElementsByTagName('image_description')[0].firstChild.nodeValue;

            var c_member_id = c_album_image.getElementsByTagName('c_member_id')[0].firstChild.nodeValue;
            if (target_c_member_id != c_member_id) {
                pne_url2a(url);
                return;
            }

            var str = '<a href="' + url + '">'
                    + '<img src="' + image_filename + '" alt="' + image_description + '" />'
                    + '</a>';
            document.write(str);
        },

        onFailure: function(obj) {
            pne_url2a(url);
        },

        requestHeaders: request_headers
    });
}
