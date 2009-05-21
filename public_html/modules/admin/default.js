/*----------------------------------------------------
プルダウンメニュー
----------------------------------------------------*/

var menu_info = new Array();

function menu(host_object_id, visible_object_id){
	if(document.all){
		var visible_object = document.all[visible_object_id];
		var host_object = document.all[host_object_id];
	}else if(document.getElementById){
		var visible_object = document.getElementById(visible_object_id);
		var host_object = document.getElementById(host_object_id);
	}

	if(visible_object.style.visibility == 'visible'){
		visible_object.style.visibility="hidden";
	}else{
		if(document.all){
			visible_object.style.left = host_object.offsetLeft;
			visible_object.style.top = host_object.offsetTop + host_object.offsetHeight;	
			visible_object.style.visibility="visible";
		}else if(document.getElementById){
			visible_object.style.left = host_object.offsetLeft + "px";
			visible_object.style.top = host_object.offsetTop + host_object.offsetHeight + "px";
			visible_object.style.visibility="visible";
		}		
	}
}
/*----------------------------------------------------
二度押し対策

Event.observe(window, 'load', setSubmitFunction, false);

function setSubmitFunction() {
	var SFs = $A(document.getElementsByTagName('form'));
	SFs.each(function (node){
		node.onsubmit = function() {
			var obj= $A(node.elements);
			obj.each( function(n){if(n.type== 'submit') n.disabled= true;})
		};
	});
}
----------------------------------------------------*/

/*----------------------------------------------------
メンバーリスト
----------------------------------------------------*/

function checkAll(targetForm) {
    var sm = document.getElementById(targetForm);
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}

function clearAll(targetForm) {
    var sm = document.getElementById(targetForm);
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}

/*----------------------------------------------------
スクリプトリンク
----------------------------------------------------*/

function Link(linkLoc) {
    if (linkLoc != "") {
        window.location.href=linkLoc;
    }
}

