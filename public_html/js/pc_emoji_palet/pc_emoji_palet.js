
useAu=false;useSb=false;selfPallet=true;palletWidth=300;palletHeight=160;PalletURL='./js/pc_emoji_palet/pc_emoji_palet.html';eNumDocomo=252;eNumAu1=518;eNumAu2=822;eNumSb=485;function createEmojiPalletDoCoMo()
{document.write('<div id="epDocomo" style="display:none;"></div>');}
function createEmojiPalletAu()
{document.write('<div id="epAu" style="display:none"></div>');}
function createEmojiPalletSoftBank()
{document.write('<div id="epSb" style="display:none"></div>');}
function renderEmojiPalletDoCoMo()
{Element.addClassName("epDocomo","isLoadEmojiImage");for(n=1;n<=eNumDocomo;n++){emojiPallet(n,"i","epDocomo");}
Element.removeClassName("epDocomo","processLoadEmojiImage");}
function renderEmojiPalletAu()
{Element.addClassName("epAu","isLoadEmojiImage");for(n=1;n<=eNumAu1;n++){emojiPallet(n,"e","epAu");}
for(n=700;n<=eNumAu2;n++){emojiPallet(n,"e","epAu");}
Element.removeClassName("epAu","processLoadEmojiImage");}
function renderEmojiPalletSoftBank()
{Element.addClassName("epSb","isLoadEmojiImage");for(n=1;n<=eNumSb;n++){emojiPallet(n,"s","epSb");}
Element.removeClassName("epSb","processLoadEmojiImage");}
function output(){document.write('<div id="emoji_pallet" class="padding_ss" style="width:439px;">');if(selfPallet){document.write('絵文字入力　');document.write('<a href="#" onclick=\'togglePallet("epDocomo"); return false;\'>DoCoMo</a>');if(useAu)document.write('　<a href="#" onclick=\'togglePallet("epAu"); return false;\'>AU</a>');if(useSb)document.write('　<a href="#" onclick=\'togglePallet("epSb"); return false;\'>SoftBank</a>');createEmojiPalletDoCoMo();if(useAu){createEmojiPalletAu();}
if(useSb){createEmojiPalletSoftBank();}}else{document.write('<a href="javascript:popupPallet(PalletURL)">絵文字入力</a>');}
document.write('</div>');}
function emojiPallet(i,career,target){var src="./skin/default/img/emoji/"+career+"/"+career+i+".gif";var alt="["+career+":"+i+"]";var onclick="putEmojiToSelf('["+career+":"+i+"]')";if(target){var div=document.getElementById(target);var img=document.createElement("img");img.setAttribute("src",src);img.setAttribute("alt",alt);Event.observe(img,"click",function(){putEmojiToSelf("["+career+":"+i+"]");});div.appendChild(img);}else{document.write('<img src="'+src+'" alt="'+alt+'" onclick="'+onclick+'">');}}
function putEmojiToSelf(emoji){var body=document.getElementsByName("body");for(var i=0;i<body.length;i++){if(body[i].nodeName.toLowerCase()=='textarea'){var elm=body[i];break;}}
var selection=new Selection(elm);var pos=selection.create();var head=elm.value.substring(0,pos.start);var tail=elm.value.substring(pos.end,elm.value.length);elm.value=head+emoji+tail;}
function togglePallet(pallet){if($(pallet).style.display=="none"){if(!Element.hasClassName(pallet,'isLoadEmojiImage')){Element.addClassName(pallet,"processLoadEmojiImage");if(pallet=='epDocomo'){renderEmojiPalletDoCoMo();}
if(pallet=='epAu'){renderEmojiPalletAu();}
if(pallet=='epSb'){renderEmojiPalletSoftBank();}}
if(Element.hasClassName(pallet,'processLoadEmojiImage')){return togglePallet(pallet);}
closeAllEmojiPallet();Element.show(pallet);}else{Element.hide(pallet);}}
Event.observe(window,"load",function(){renderEmojiPalletDoCoMo();});function closeAllEmojiPallet()
{if(document.getElementById("epDocomo")){Element.hide(document.getElementById("epDocomo"));}
if(document.getElementById("epAu")){Element.hide(document.getElementById("epAu"));}
if(document.getElementById("epSb")){Element.hide(document.getElementById("epSb"));}}
function popupPallet(URL){window.open(URL,"pallet","width="+palletWidth+",height="+palletHeight+",scrollbars=yes,status=no,resizable=yes,toolbar=no,location=no,menubar=no");}