document.write("<script type='text/javascript' src='http://secondlife.com/apps/mapapi/'" + "></sc" + "ript>");
document.write('<div id="map-container" style="height:440px; width:400px; position:relative;"></d' + 'iv>');

function url2cmd(url) {
    if (!url.match(/^http:\/\/slurl\.com\/secondlife\/([a-zA-Z0-9_\-]+)\/([0-9]+)\/([0-9]+)\/([0-9]+)/)) {
        pne_url2a(url);
        return false;
    }
    var name = RegExp.$1;
    var x = RegExp.$2;
    var y = RegExp.$3;
    var z = RegExp.$4;
    main(name, x, y, z);
}

function main(name, x, y, z)
{
    window.onload = function() {
        _main(name, x, y, z);
    }
}

function _main(name, x, y, z)
{
  var region = name;
  var x_code = x;
  var y_code = y;
  var z_code = z;
  
  var destinationWindowMessage = 
    "<div style=\'margin:10px 0px 0px 0px;\'>"
    + "<a href=\'secondlife://" + region + "/" + x_code + "/" + y_code + "/" + z_code + "\' class=\'headline-link\'>"
    + "<img src=\'http://slurl.com/_img/teleport_btn.gif\' align=\'right\'>"
    + "</a>"
    + "<a href=\'secondlife://" + region + "/" + x_code + "/" + y_code + "/" + z_code + "\' class=\'headline-link\'>"
    + "<strong>Visit this location</strong>"
    + "</a>"
    + "<p>"
    + "<a href=\'secondlife://" + region + "/" + x_code + "/" + y_code + "/" + z_code + "\'>"
    + "<img src=\'http://slurl.com/_img/default.gif\'>"
    + "</a>"
    + "</p>"
    + "<p>"
    + "Clicking above will teleport you to this location in <a href=\'http://secondlife.com/?a=b1db2230e011387588f345e9410f7ab1 \'>Second Life</a>.</p>"
    + "<a href='http://secondlife.com/join/?a=b1db2230e011387588f345e9410f7ab1'>"
    + "<img src=\'http://slurl.com/_img/join_btn_default.gif\'>"
    + "</a>"
    + "</div>";

  var slurl_marker = new Img("http://slurl.com/_img/slurl_marker-withshadow.png",76,69, true);
  var slurl_icon = new Icon(slurl_marker);
  var all_images = [slurl_icon, slurl_icon, slurl_icon, slurl_icon, slurl_icon, slurl_icon];

  var map = new SLMap(document.getElementById('map-container'));
  var destinationWindow = new MapWindow(destinationWindowMessage, {"width":297, "height":287});
  map.centerAndZoomAtSLCoord(new SLPoint(region, (x_code), (y_code)), 1);
  var marker = new Marker(all_images, new SLPoint(region, (x_code), (y_code)), {"centerOnClick":true, "verticalAlign":"bottom"});
  map.addMarker(marker, destinationWindow);
  map.clickMarker(marker);
}
