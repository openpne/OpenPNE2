var menulist_num= 7;//ドロップダウンメニューの数
var menulist= new Array(menulist_num);
menulist['adminSiteMember']= {'count_mouseout':0,'display':false};
menulist['adminImageKakikomi']= {'count_mouseout':0,'display':false};
menulist['adminStatisticalInformation']= {'count_mouseout':0,'display':false};
menulist['adminDesign']= {'count_mouseout':0,'display':false};
menulist['adminSNSConfig']= {'count_mouseout':0,'display':false};
menulist['adminInfoKiyaku']= {'count_mouseout':0,'display':false};
menulist['adminAdminConfig']= {'count_mouseout':0,'display':false};

var count= 0;//main関数の実行回数
var count_limit= 1000000;//main関数の実行回数（100万でリセット）

var delay= 1;//ドロップダウンメニューを非表示にするまでのディレイ

function main() {

	//メニューの制御
	if (count > delay) {
	
	for (var key in menulist) {
		var key_cont = key+"Cont";
		if(document.getElementById){
			var host_object = document.getElementById(key);
			var visible_object = document.getElementById(key_cont);
		}else if(document.all){
			var host_object = document.all[key];
			var visible_object = document.all[key_cont];
		}

		////メニューを表示する
		if ((count - menulist[key]['count_mouseout'] < delay) || menulist[key]['display']) {
			
			if(document.getElementById){
				visible_object.style.left = host_object.offsetLeft + "px";
				visible_object.style.top = host_object.offsetTop + host_object.offsetHeight + "px";
			}else if(document.all){
				visible_object.style.left = host_object.offsetLeft;
				visible_object.style.top = host_object.offsetTop + host_object.offsetHeight;	
			}
			visible_object.style.visibility="visible";
			
		////メニューを隠す
		} else {
			if (menulist[key]['count_mouseout'] > 0) {
				if (visible_object.style.visibility == "visible"){
					visible_object.style.visibility="hidden";
				}
			}
		}
	}
	
	}
	
	count ++;
	
}

function menu(id) {
	//onmouseover時の処理
	menulist[id]['display']= true;
}

function menu_hide(id) {
	//onmouseout時の処理
	menulist[id]['count_mouseout']= count;
	menulist[id]['display']= false;
}

main_timer_ID = setInterval('main()',100);//main関数の実行

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

/*----------------------------------------------------
スクリプトリンク
----------------------------------------------------*/

function Link(linkLoc) {
    if (linkLoc != "") {
        window.location.href=linkLoc;
    }
}
