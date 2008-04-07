<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>h_googlemap</title>
<script src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=({$smarty.const.GOOGLE_AJAX_SEARCH_API_KEY})" type="text/javascript"></script>
<script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=({$smarty.const.GOOGLE_MAPS_API_KEY})" type="text/javascript"></script>
<script type="text/javascript">
<!--

var gls;
var gMap;

function OnLocalSearch() {
        if (!gls.results) return;
        var first = gls.results[0];
        var point = new GLatLng(parseFloat(first.lat), parseFloat(first.lng));
        var zoom = ({$z});
        gMap.addControl(new GSmallMapControl());
        gMap.addControl(new GMapTypeControl());
        gMap.setMapType(({$MapType}));
        gMap.setCenter(point, zoom);
        var marker = new GMarker(point);
        gMap.addOverlay(marker);
        geocoder = new GClientGeocoder();
}

function load() {
    if (GBrowserIsCompatible()) {
        if((({$x}) == 0) && (({$y}) == 0)){
                gMap = new GMap2(document.getElementById("map"));
                gMap.addControl(new GSmallMapControl());
                gMap.addControl(new GMapTypeControl());
                gMap.setCenter(new GLatLng(0, 0));

                gls = new GlocalSearch();
                gls.setCenterPoint(gMap);
                gls.setSearchCompleteCallback(null, OnLocalSearch);
                var q = "({$q})";
                gls.execute(q);
        }else{
                var point = new GLatLng(({$x}), ({$y}));
                var zoom = ({$z});
                gMap = new GMap2(document.getElementById("map"));
                gMap.addControl(new GSmallMapControl());
                gMap.addControl(new GMapTypeControl());
                gMap.setCenter(point, zoom);
                gMap.setMapType(({$MapType}));

                var marker = new GMarker(point);
                gMap.addOverlay(marker);
                geocoder = new GClientGeocoder();
        }
    }
}

//-->
</script>
</head>
<body onLoad="load()" onUnload="GUnload()">
<div id="map" style="width: 410px; height: 320px"></div>
</body>
</html>
