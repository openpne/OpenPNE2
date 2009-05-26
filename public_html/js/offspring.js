
var offspring={firstChildClass:"first-child",lastChildClass:"last-child",oddChildClass:"nth-child-odd",evenChildClass:"nth-child-even",onlyChildClass:"only-child",nthChildClassPrefix:"nth-child-",classNamesArray:[],classNameSubstringsArray:[],cacheLevel:0,nthChildren:[],regularHashTable:[],regularHashTableArray:[],lastChildHashTable:[],lastChildHashTableArray:[],configuration:{runningMode:'full',autoStart:true,shouldRemoveOldOffspringClassesFirst:false},init:function(){if(typeof offspringConfiguration!="undefined")
{for(var configParameter in offspringConfiguration)
{this.configuration[configParameter]=offspringConfiguration[configParameter];}
this.configuration.runningMode=this.configuration.runningMode.toLowerCase();}
switch(this.configuration.runningMode)
{case'full':this.classNamesArray=[this.firstChildClass,this.lastChildClass,this.oddChildClass,this.evenChildClass,this.onlyChildClass];this.classNameSubstringsArray=[this.nthChildClassPrefix];break;case'light':this.classNamesArray=[this.firstChildClass,this.lastChildClass,this.onlyChildClass];this.classNameSubstringsArray=[];break;}
this.defineTraverseChildrenFunction();this.defineFillCacheToFunction();this.fillCacheTo();if(this.configuration.autoStart)
{var _this=this;this.ContentLoaded(window,function(){_this.start();});}},start:function(){var startTime=new Date();this.traverseChildren(document.getElementsByTagName("body")[0]);var endTime=new Date();},defineTraverseChildrenFunction:function(){switch(this.configuration.shouldRemoveOldOffspringClassesFirst)
{case true:switch(this.configuration.runningMode)
{case'full':this.traverseChildren=function(parent)
{if(!parent.childNodes.length)return;var childElementNodes=[];var testNode=parent.childNodes[0];while(testNode)
{if(testNode.nodeType==1)
{childElementNodes.push(testNode);}
testNode=testNode.nextSibling;}
testNode=null;var childElementNodesLength=childElementNodes.length;if(!childElementNodesLength)return;if(childElementNodesLength>this.cacheLevel)
{this.fillCacheTo(childElementNodesLength);}
var lastIndex=childElementNodesLength-1;for(var i=0;i<lastIndex;i++)
{var currentElement=childElementNodes[i];this.removeMultipleClassNames(currentElement,this.classNamesArray,this.classNameSubstringsArray);this._addOffspringClassNames(currentElement,i,false);this.traverseChildren(currentElement);}
currentElement=null;var lastElement=childElementNodes[lastIndex];this.removeMultipleClassNames(lastElement,this.classNamesArray,this.classNameSubstringsArray);this._addOffspringClassNames(lastElement,lastIndex,true);this.traverseChildren(lastElement);lastElement=null;lastElement=null;parent=null;};break;case'light':this.traverseChildren=function(parent)
{if(!parent.childNodes.length)return;var childElementNodes=[];var testNode=parent.childNodes[0];while(testNode)
{if(testNode.nodeType==1)
{childElementNodes.push(testNode);}
testNode=testNode.nextSibling;}
testNode=null;var childElementNodesLength=childElementNodes.length;if(!childElementNodesLength)return;if(childElementNodesLength>this.cacheLevel)
{this.fillCacheTo(childElementNodesLength);}
var lastIndex=childElementNodesLength-1;switch(childElementNodesLength)
{case 0:return;break;case 1:var onlyElement=childElementNodes[0];this.removeMultipleClassNames(onlyElement,this.classNamesArray,this.classNameSubstringsArray);this._addOffspringClassNames(onlyElement,lastIndex,true);onlyElement=null;break;default:var firstElement=childElementNodes[0];this.removeMultipleClassNames(firstElement,this.classNamesArray,this.classNameSubstringsArray);this._addOffspringClassNames(firstElement,0,false);firstElement=null;var lastElement=childElementNodes[lastIndex];this.removeMultipleClassNames(lastElement,this.classNamesArray,this.classNameSubstringsArray);this._addOffspringClassNames(lastElement,lastIndex,true);lastElement=null;break;}
for(var i=0;i<childElementNodesLength;i++)
{this.traverseChildren(childElementNodes[i]);}
lastElement=null;parent=null;};break;}
break;case false:switch(this.configuration.runningMode)
{case'full':this.traverseChildren=function(parent)
{if(!parent.childNodes.length)return;var childElementNodes=[];var testNode=parent.childNodes[0];while(testNode)
{if(testNode.nodeType==1)
{childElementNodes.push(testNode);}
testNode=testNode.nextSibling;}
testNode=null;var childElementNodesLength=childElementNodes.length;if(!childElementNodesLength)return;if(childElementNodesLength>this.cacheLevel)
{this.fillCacheTo(childElementNodesLength);}
var lastIndex=childElementNodesLength-1;for(var i=0;i<lastIndex;i++)
{var currentElement=childElementNodes[i];this._addOffspringClassNames(currentElement,i,false);this.traverseChildren(currentElement);}
currentElement=null;var lastElement=childElementNodes[lastIndex];this._addOffspringClassNames(lastElement,lastIndex,true);this.traverseChildren(lastElement);lastElement=null;lastElement=null;parent=null;};break;case'light':this.traverseChildren=function(parent)
{if(!parent.childNodes.length)return;var childElementNodes=[];var testNode=parent.childNodes[0];while(testNode)
{if(testNode.nodeType==1)
{childElementNodes.push(testNode);}
testNode=testNode.nextSibling;}
testNode=null;var childElementNodesLength=childElementNodes.length;if(!childElementNodesLength)return;if(childElementNodesLength>this.cacheLevel)
{this.fillCacheTo(childElementNodesLength);}
var lastIndex=childElementNodesLength-1;switch(childElementNodesLength)
{case 0:break;case 1:this._addOffspringClassNames(childElementNodes[0],lastIndex,true);for(var i=0;i<childElementNodesLength;i++)
{this.traverseChildren(childElementNodes[i]);}
break;default:this._addOffspringClassNames(childElementNodes[0],0,false);this._addOffspringClassNames(childElementNodes[lastIndex],lastIndex,true);for(var i=0;i<childElementNodesLength;i++)
{this.traverseChildren(childElementNodes[i]);}
break;}
lastElement=null;parent=null;};break;}
break;}},traverseChildren:function(parent){if(!parent.childNodes.length)return;var childElementNodes=[];var testNode=parent.childNodes[0];while(testNode)
{if(testNode.nodeType==1)
{childElementNodes.push(testNode);}
testNode=testNode.nextSibling;}
testNode=null;var childElementNodesLength=childElementNodes.length;if(!childElementNodesLength)return;if(childElementNodesLength>this.cacheLevel)
{this.fillCacheTo(childElementNodesLength);}
var lastIndex=childElementNodesLength-1;this._childrenIterator(childElementNodes,childElementNodesLength,lastIndex);lastElement=null;parent=null;},_addOffspringClassNames:function(element,index,isLastElement){index++;if(this.configuration.targetElement instanceof Array&&this.configuration.targetElement.length){var isTargetElement=false;for(key in this.configuration.targetElement){if(element.nodeName.toLowerCase()==this.configuration.targetElement[key]){isTargetElement=true;break;}}
if(!isTargetElement){return;}}
if((!element.className)||(!element.className.length))
{switch(isLastElement)
{case false:element.className=this.regularHashTable[index];return;break;case true:element.className=this.lastChildHashTable[index];return;break;}}
switch(isLastElement)
{case false:var applicableClassNames=this.regularHashTableArray[index];break;case true:var applicableClassNames=this.lastChildHashTableArray[index];break;}
var originalClassNames=element.className.split(' ');var classNamesToAdd=originalClassNames;for(var i=0,applicableClassNamesLength=applicableClassNames.length;i<applicableClassNamesLength;i++)
{var alreadyThere=false;var testApplicableClassName=applicableClassNames[i];for(var j=0,originalClassNamesLength=originalClassNames.length;j<originalClassNamesLength;j++)
{if(originalClassNames[j]==testApplicableClassName)
{alreadyThere=true;break;}}
if(!alreadyThere)
{classNamesToAdd.push(testApplicableClassName);}}
element.className=classNamesToAdd.join(' ');element=null;return;},defineFillCacheToFunction:function(){switch(this.configuration.runningMode)
{case'full':this.fillCacheTo=function(fillAmount)
{var fillAmount=fillAmount||15;if(!this.cacheLevel)this.cacheLevel=0;if(this.cacheLevel>=fillAmount)return;var startingPoint=this.cacheLevel++;var isOdd=!((startingPoint%2)==0);var firstChildClass=this.firstChildClass;var lastChildClass=this.lastChildClass;var oddChildClass=this.oddChildClass;var evenChildClass=this.evenChildClass;var onlyChildClass=this.onlyChildClass;var nthChildClassPrefix=this.nthChildClassPrefix;for(var i=startingPoint;i<=fillAmount;i++)
{this.nthChildren[i]=[nthChildClassPrefix,i].join('');var nthChildrenI=this.nthChildren[i];switch(i)
{case 1:this.regularHashTableArray[i]=[firstChildClass,oddChildClass,nthChildrenI];this.lastChildHashTableArray[i]=[firstChildClass,oddChildClass,onlyChildClass,nthChildrenI,lastChildClass];break;default:switch(isOdd)
{case true:this.regularHashTableArray[i]=[oddChildClass,nthChildrenI];this.lastChildHashTableArray[i]=[oddChildClass,nthChildrenI,lastChildClass];break;case false:this.regularHashTableArray[i]=[evenChildClass,nthChildrenI];this.lastChildHashTableArray[i]=[evenChildClass,nthChildrenI,lastChildClass];break;}}
this.regularHashTable[i]=this.regularHashTableArray[i].join(' ');this.lastChildHashTable[i]=this.lastChildHashTableArray[i].join(' ');isOdd=!isOdd;}
this.cacheLevel=fillAmount;};break;case'light':this.fillCacheTo=function(fillAmount)
{var fillAmount=fillAmount||15;if(!this.cacheLevel)this.cacheLevel=0;if(this.cacheLevel>=fillAmount)return;var startingPoint=this.cacheLevel++;var firstChildClass=this.firstChildClass;var lastChildClass=this.lastChildClass;var onlyChildClass=this.onlyChildClass;for(var i=startingPoint;i<=fillAmount;i++)
{switch(i)
{case 1:this.regularHashTableArray[i]=[firstChildClass];this.lastChildHashTableArray[i]=[firstChildClass,onlyChildClass,lastChildClass];break;default:this.regularHashTableArray[i]=[];this.lastChildHashTableArray[i]=[lastChildClass];}
this.regularHashTable[i]=this.regularHashTableArray[i].join(' ');this.lastChildHashTable[i]=this.lastChildHashTableArray[i].join(' ');}
this.cacheLevel=fillAmount;};break;}},fillCacheTo:function(fillAmount){var fillAmount=fillAmount||15;if(!this.cacheLevel)this.cacheLevel=0;if(this.cacheLevel>=fillAmount)return;var startingPoint=this.cacheLevel++;this._fillCacheToIterator(startingPoint,fillAmount);this.cacheLevel=fillAmount;},_checkIfStringFoundInArray:function(testString,testArray){for(var i=0,len=testArray.length;i<len;i++)
{if(testString==testArray[i])return true;}
return false;},_checkIfStringMatchInSubstringArray:function(testString,testArray){for(var i=0,len=testArray.length;i<len;i++)
{var currentArrayItem=testArray[i];var testSubstring=testString.substr(0,currentArrayItem.length);if(testSubstring==currentArrayItem)return true;}
return false;},removeMultipleClassNames:function(element,classNameStrings,classNameSubstrings){if(!element)return;var newClassName='';var classNamesArray=element.className.split(' ');for(var i=0,len=classNamesArray.length;i<len;i++)
{var currentClassName=classNamesArray[i];var isStringInClassNameStrings=this._checkIfStringFoundInArray(currentClassName,classNameStrings);if(isStringInClassNameStrings)continue;var isStringMatchingClassNameSubstrings=this._checkIfStringMatchInSubstringArray(currentClassName,classNameSubstrings);if(isStringMatchingClassNameSubstrings)continue;if(i>0)newClassName=newClassName+' ';newClassName=newClassName+currentClassName;}
element.className=newClassName;},ContentLoaded:function(w,fn){var d=w.document,u=w.navigator.userAgent.toLowerCase();function init(e){if(!arguments.callee.done){arguments.callee.done=true;fn(e);}}
if(/khtml|webkit/.test(u)){(function(){if(/complete|loaded/.test(d.readyState)){init('poll');}else{setTimeout(arguments.callee,10);}})();}else if(/msie/.test(u)&&!w.opera){(function(){try{d.documentElement.doScroll('left');}catch(e){setTimeout(arguments.callee,10);return;}
init('poll');})();d.attachEvent('onreadystatechange',function(e){if(d.readyState=='complete'){d.detachEvent('on'+e.type,arguments.callee);init(e.type);}});}else if(d.addEventListener&&(/gecko/.test(u)&&parseFloat(u.split('rv:')[1])>=1.8)||(/opera/.test(u)&&parseFloat(u.split('opera ')[1])>9)){d.addEventListener('DOMContentLoaded',function(e){this.removeEventListener(e.type,arguments.callee,false);init(e.type);},false);}else{var oldonload=w.onload;w.onload=function(e){if(typeof oldonload=='function'){oldonload(e||w.event);}
init((e||w.event).type);};}}}
offspring.init();