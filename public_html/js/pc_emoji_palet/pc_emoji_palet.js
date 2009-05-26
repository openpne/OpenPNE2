
useAu=false;useSb=false;selfPallet=true;palletWidth=300;palletHeight=160;PalletURL='./js/pc_emoji_palet/pc_emoji_palet.html';var palletList={docomo:{id:"epDocomo",emoji:[{start:1,end:252}],shortname:"i"},au:{id:"epAu",emoji:[{start:1,end:518},{start:700,end:822}],shortname:"e"},softbank:{id:"epSb",emoji:[{start:1,end:485}],shortname:"s"}};function createEmojiPalletDoCoMo()
{document.write('<div id="epDocomo" style="display:none;"></div>');}
function createEmojiPalletAu()
{document.write('<div id="epAu" style="display:none"></div>');}
function createEmojiPalletSoftBank()
{document.write('<div id="epSb" style="display:none"></div>');}
function renderEmojiPallet(carrier)
{var doc=document;var pl=palletList[carrier];var emoji_set=pl.emoji;var div=doc.getElementById(pl.id);Element.addClassName(pl.id,"isLoadEmojiImage");for(var num in emoji_set){var emoji=emoji_set[num];var emoji_end=emoji.end;for(var i=emoji.start;i<=emoji_end;i++){var src="./skin/default/img/emoji/"+pl.shortname+"/"+pl.shortname+i+".gif";var alt="["+pl.shortname+":"+i+"]";var img=doc.createElement("img");img.setAttribute("src",src);img.setAttribute("alt",alt);img.onclick=function(){var emoji_code=this.getAttribute("alt");putEmojiToSelf(emoji_code);};div.appendChild(img);}}
Element.removeClassName(pl.id,"processLoadEmojiImage");}
function output(){document.write('<div id="emoji_pallet" class="padding_ss" style="width:439px;">');if(selfPallet){document.write('絵文字入力　');document.write('<a href="#" onclick=\'togglePallet("epDocomo"); return false;\'>DoCoMo</a>');if(useAu)document.write('　<a href="#" onclick=\'togglePallet("epAu"); return false;\'>AU</a>');if(useSb)document.write('　<a href="#" onclick=\'togglePallet("epSb"); return false;\'>SoftBank</a>');createEmojiPalletDoCoMo();if(useAu){createEmojiPalletAu();}
if(useSb){createEmojiPalletSoftBank();}}else{document.write('<a href="javascript:popupPallet(PalletURL)">絵文字入力</a>');}
document.write('</div>');}
function emojiPallet(i,career,target){var src="./skin/default/img/emoji/"+career+"/"+career+i+".gif";var alt="["+career+":"+i+"]";if(target){var doc=document;var div=doc.getElementById(target);var img=doc.createElement("img");img.setAttribute("src",src);img.setAttribute("alt",alt);img.onclick=function(){putEmojiToSelf(alt)};div.appendChild(img);}else{var onclick="putEmojiToSelf('["+career+":"+i+"]')";document.write('<img src="'+src+'" alt="'+alt+'" onclick="'+onclick+'">');}}
function putEmojiToSelf(emoji){var body=document.getElementsByName("body");for(var i=0;i<body.length;i++){if(body[i].nodeName.toLowerCase()=='textarea'){var elm=body[i];break;}}
pne_insert_str_to_selection(elm,emoji);}
function togglePallet(pallet){if($(pallet).style.display=="none"){if(!Element.hasClassName(pallet,'isLoadEmojiImage')){Element.addClassName(pallet,"processLoadEmojiImage");var carrier='';if(pallet=='epDocomo'){carrier='docomo';}
if(pallet=='epAu'){carrier='au';}
if(pallet=='epSb'){carrier='softbank';}
renderEmojiPallet(carrier);}
if(Element.hasClassName(pallet,'processLoadEmojiImage')){return togglePallet(pallet);}
closeAllEmojiPallet();Element.show(pallet);}else{Element.hide(pallet);}}
function closeAllEmojiPallet()
{if(document.getElementById("epDocomo")){Element.hide(document.getElementById("epDocomo"));}
if(document.getElementById("epAu")){Element.hide(document.getElementById("epAu"));}
if(document.getElementById("epSb")){Element.hide(document.getElementById("epSb"));}}
function popupPallet(URL){window.open(URL,"pallet","width="+palletWidth+",height="+palletHeight+",scrollbars=yes,status=no,resizable=yes,toolbar=no,location=no,menubar=no");}