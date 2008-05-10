
document.write('<div id="epDoCoMo">');for(n=1;n<=eNumDocomo;n++){emojiPalletPopup(n,"i");}
document.write('</div>');if(useAu){document.write('<div id="epAu">');for(n=1;n<=eNumAu1;n++){emojiPalletPopup(n,"e");}
for(n=700;n<=eNumAu2;n++){emojiPalletPopup(n,"e");}
document.write('</div>');}
if(useSb){document.write('<div id="epSb">');for(n=1;n<=eNumSb;n++){emojiPalletPopup(n,"s");}
document.write('</div>');}
function emojiPalletPopup(i,career){document.write('<img src="../../skin/default/img/emoji/'+career+'/'+career+i+'.gif" alt="['+career+':'+i+']" onclick=\'putEmojiToParent("['+career+':'+i+']")\'>');}
function putEmojiToParent(emoji){var body=opener.document.getElementsByName("body");for(var i=0;i<body.length;i++){if(body[i].nodeName.toLowerCase()=='textarea'){var elm=body[i];break;}}
var selection=new Selection(elm);var pos=selection.create();var head=elm.value.substring(0,pos.start);var tail=elm.value.substring(pos.end,elm.value.length);elm.value=head+emoji+tail;}