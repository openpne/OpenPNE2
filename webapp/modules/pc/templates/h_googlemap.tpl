({* unknown *})<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
({* unknown *})<html>
({* unknown *})<head>
({* unknown *})<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
({* unknown *})<title>h_googlemap</title>
({* unknown *})<script src="http://www.google.co.jp/uds/api?file=uds.js&amp;v=1.0&amp;key=({$smarty.const.GOOGLE_AJAX_SEARCH_API_KEY})" type="text/javascript"></script
({* unknown *})>
({* unknown *})<script src="http://maps.google.co.jp/maps?file=api&amp;v=2.x&amp;key=({$smarty.const.GOOGLE_MAPS_API_KEY})" type="text/javascript"></script>
({* unknown *})<script type="text/javascript">
({* unknown *})<!--
({* unknown *})var gls;
({* unknown *})var gMap;
({* unknown *})function OnLocalSearch() {
({* unknown *})        if (!gls.results) return;
({* unknown *})        var first = gls.results[0];
({* unknown *})        var point = new GLatLng(parseFloat(first.lat), parseFloat(first.lng));
({* unknown *})        var zoom = ({$z});
({* unknown *})        gMap.addControl(new GSmallMapControl());
({* unknown *})        gMap.addControl(new GMapTypeControl());
({* unknown *})        gMap.setMapType(({$MapType}));
({* unknown *})        gMap.setCenter(point, zoom);
({* unknown *})        var marker = new GMarker(point);
({* unknown *})        gMap.addOverlay(marker);
({* unknown *})        GEvent.addListener(marker, "click", function() {
({* unknown *})                marker.openInfoWindowHtml(html);
({* unknown *})        });
({* unknown *})        geocoder = new GClientGeocoder();
({* unknown *})}
({* unknown *})function load() {
({* unknown *})    if (GBrowserIsCompatible()) {
({* unknown *})        if((({$x}) == 0) && (({$y}) == 0)){
({* unknown *})                gMap = new GMap2(document.getElementById("map"));
({* unknown *})                gMap.addControl(new GSmallMapControl());
({* unknown *})                gMap.addControl(new GMapTypeControl());
({* unknown *})                gMap.setCenter(new GLatLng(0, 0));
({* unknown *})                gls = new GlocalSearch();
({* unknown *})                gls.setCenterPoint(gMap);
({* unknown *})                gls.setSearchCompleteCallback(null, OnLocalSearch);
({* unknown *})                var q = "({$q})";
({* unknown *})                gls.execute(q);
({* unknown *})        }else{
({* unknown *})                var point = new GLatLng(({$x}), ({$y}));
({* unknown *})                var zoom = ({$z});
({* unknown *})                gMap = new GMap2(document.getElementById("map"));
({* unknown *})                gMap.addControl(new GSmallMapControl());
({* unknown *})                gMap.addControl(new GMapTypeControl());
({* unknown *})                gMap.setCenter(point, zoom);
({* unknown *})                gMap.setMapType(({$MapType}));
({* unknown *})                var marker = new GMarker(point);
({* unknown *})                gMap.addOverlay(marker);
({* unknown *})                GEvent.addListener(marker, "click", function() {
({* unknown *})                        marker.openInfoWindowHtml(html);
({* unknown *})                });
({* unknown *})                geocoder = new GClientGeocoder();
({* unknown *})        }
({* unknown *})    }
({* unknown *})}
({* unknown *})//-->
({* unknown *})</script>
({* unknown *})</head>
({* unknown *})<body onLoad="load()" onUnload="GUnload()">
({* unknown *})<div id="map" style="width:100%; height: 320px"></div>
({* unknown *})</body>
({* unknown *})</html>