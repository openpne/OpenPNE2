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
削除予定
----------------------------------------------------*/

function menu_ctrl(parent_object_id){
	
	if(!document.hasChildNodes){
		return false;
	}
	
	var child_object = document.getElementById(parent_object_id).getElementsByTagName('ul');
	var i_child_object = child_object.item(0);
	
	if (i_child_object.style.display == 'block'){
		i_child_object.style.display = 'none';
		for(i=0;i<child_object.length;i++){
				child_object.item(i).style.display = 'none';
		}
	}else{
		i_child_object.style.display = 'block';
	}

}

function all_menu_ctrl(host_object_id){
	
	if(!document.hasChildNodes){
		return false;
	}
	
	if(menu_info[host_object_id]=='none' || !menu_info[host_object_id]){
		menu_info[host_object_id]='block';
	}else{
		menu_info[host_object_id]='none';
	}
	
	var child_object = document.getElementById(host_object_id).getElementsByTagName('ul');

	for (i=0;i<child_object.length;i++){
		child_object.item(i).style.display = menu_info[host_object_id];
	}
}

/*----------------------------------------------------
メンバーリスト
----------------------------------------------------*/

function checkAll(){
    var sm = document.formSendMessages;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}

function clearAll(){
    var sm = document.formSendMessages;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}

function Link(linkLoc) {
    if (linkLoc != "") {
        window.location.href=linkLoc;
    }
}
