function main(type,order,num) {

    var height = 50 + num * 16;

    var html = ''
	+ '<iframe MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" src="?m=pc&a=page_sns_info'+'&type='+type+'&order='+ order +'&num='+ num + '" name="sample" width="240" height="' + height + '">'
	+ 'この部分はインラインフレームを使用しています。'
	+ '</iframe>';
	
    document.write(html);
}
