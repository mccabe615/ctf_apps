(function(a){a.plugins.ForceBlocks=function(b){function m(){d=b.dom,c.add(b.getDoc(),"keyup",p),b.onSetContent.add(p),b.onBeforeGetContent.add(p),f||(b.onPreProcess.add(function(a,b){j(b.node.getElementsByTagName("br"),function(b){var c=b.parentNode;c&&c.nodeName=="p"&&(c.childNodes.length==1||c.lastChild==b)&&c.replaceChild(a.getDoc().createTextNode(" "),b)})}),c.add(b.getDoc(),"keypress",function(a){if(a.keyCode==13&&!a.shiftKey&&!t(a))return c.cancel(a)}),g&&c.add(b.getDoc(),"keydown",function(a){(a.keyCode==8||a.keyCode==46)&&!a.shiftKey&&u(a,a.keyCode==8)}))}function n(a){var b,c;return b=a.document,c=b.compatMode=="CSS1Compat"?b.documentElement:b.body,{x:a.pageXOffset||c.scrollLeft,y:a.pageYOffset||c.scrollTop,w:a.innerWidth||c.clientWidth,h:a.innerHeight||c.clientHeight}}function o(a,c,d){var e=b.getDoc().createTreeWalker(a,4,null,!1),a,f=-1;while(a=e.nextNode()){f++;if(c==0&&a==d)return f;if(c==1&&f==d)return a}return-1}function p(){var a=this,c=b.getBody(),d=b.getDoc(),e=b.selection,g=e.getSel(),h=e.getRng(),i=-2,j,k,m,n,p=-16777215,r,s,t,u,v,w=c.childNodes,x,y,z;for(x=w.length-1;x>=0;x--){r=w[x];if(r.nodeType==3||!q(r)&&r.nodeType!=8)if(!s){if(r.nodeType!=3||/[^\s]/g.test(r.nodeValue))i==-2&&h&&(f?(n=d.body.createTextRange(),n.moveToElementText(c),n.collapse(1),t=n.move("character",p)*-1,n=h.duplicate(),n.collapse(1),u=n.move("character",p)*-1,n=h.duplicate(),n.collapse(0),v=n.move("character",p)*-1-u,i=u-t,j=v):h.startContainer.nodeType==1&&(y=h.startContainer.childNodes[h.startOffset])&&y.nodeType==1?(z=y.getAttribute("id"),y.setAttribute("id","__mce")):b.dom.getParent(h.startContainer,function(a){return a===c})&&(k=h.startOffset,m=h.endOffset,i=o(c,0,h.startContainer),j=o(c,0,h.endContainer))),s=b.dom.create(l.element),s.appendChild(r.cloneNode(1)),r.parentNode.replaceChild(s,r)}else s.hasChildNodes()?s.insertBefore(r,s.firstChild):s.appendChild(r);else s=null}if(i!=-2)if(!f)s=c.getElementsByTagName(l.element)[0],h=d.createRange(),i!=-1?h.setStart(o(c,1,i),k):h.setStart(s,0),j!=-1?h.setEnd(o(c,1,j),m):h.setEnd(s,0),g&&(g.removeAllRanges(),g.addRange(h));else try{h=g.createRange(),h.moveToElementText(c),h.collapse(1),h.moveStart("character",i),h.moveEnd("character",j),h.select()}catch(A){}else!f&&(y=b.dom.get("__mce"))&&(z?y.setAttribute("id",z):y.removeAttribute("id"),h=d.createRange(),h.setStartBefore(y),h.setEndBefore(y),e.setRng(h))}function q(a){return a.nodeType==1&&/^(H[1-6]|P|DIV|ADDRESS|PRE|FORM|TABLE|LI|OL|UL|TD|CODE|CAPTION|BLOCKQUOTE|CENTER|DL|DT|DD|DIR|FIELDSET|NOSCRIPT|NOFRAMES|MENU|ISINDEX|SAMP)$/.test(a.nodeName)}function r(a){return d.getParent(a,function(a){return q(a)})}function s(a){return a=a.innerHTML,a=a.replace(/<img|hr|table/g,"d"),a=a.replace(/<[^>]+>/g,""),a.replace(/[ \t\r\n]+/g,"")==""}function t(c){var e=b.getDoc(),f=b.selection.getSel(),g=b.selection.getRng(),i=e.body,j,k,m,o,p,t,u,v,w,x,y,z,A,B,C,D,E;if(a.isOldWebKit)return!0;j=e.createRange(),j.setStart(f.anchorNode,f.anchorOffset),j.collapse(!0),k=e.createRange(),k.setStart(f.focusNode,f.focusOffset),k.collapse(!0),m=j.compareBoundaryPoints(j.START_TO_END,k)<0,o=m?f.anchorNode:f.focusNode,p=m?f.anchorOffset:f.focusOffset,t=m?f.focusNode:f.anchorNode,u=m?f.focusOffset:f.anchorOffset,o=o.nodeName=="BODY"?o.firstChild:o,t=t.nodeName=="BODY"?t.firstChild:t,v=r(o),w=r(t),x=v?v.nodeName:l.element;if(d.getParent(v,function(a){return/OL|UL/.test(a.nodeName)}))return!0;v&&(v.nodeName=="CAPTION"||/absolute|relative|static/gi.test(v.style.position))&&(x=l.element,v=null),w&&(w.nodeName=="CAPTION"||/absolute|relative|static/gi.test(w.style.position))&&(x=l.element,w=null);if(/(TD|TABLE|TH|CAPTION)/.test(x)||v&&x=="DIV"&&/left|right/gi.test(v.style.cssFloat))x=l.element,v=w=null;y=v&&v.nodeName==x?v.cloneNode(0):e.createElement(x),z=w&&w.nodeName==x?w.cloneNode(0):e.createElement(x),z.id="",/^(H[1-6])$/.test(x)&&o.nodeValue&&p==o.nodeValue.length&&(z=e.createElement(l.element)),C=A=o;do{if(C==i||C.nodeType==9||q(C)||/(TD|TABLE|TH|CAPTION)/.test(C.nodeName))break;A=C}while(C=C.previousSibling?C.previousSibling:C.parentNode);C=B=t;do{if(C==i||C.nodeType==9||q(C)||/(TD|TABLE|TH|CAPTION)/.test(C.nodeName))break;B=C}while(C=C.nextSibling?C.nextSibling:C.parentNode);return A.nodeName==x?j.setStart(A,0):j.setStartBefore(A),j.setEnd(o,p),y.appendChild(j.cloneContents()),k.setEndAfter(B),k.setStart(t,u),z.appendChild(k.cloneContents()),g=e.createRange(),!A.previousSibling&&A.parentNode.nodeName==x?g.setStartBefore(A.parentNode):j.startContainer.nodeName==x&&j.startOffset==0?g.setStartBefore(j.startContainer):g.setStart(j.startContainer,j.startOffset),!B.nextSibling&&B.parentNode.nodeName==x?g.setEndAfter(B.parentNode):g.setEnd(k.endContainer,k.endOffset),g.deleteContents(),y.firstChild&&y.firstChild.nodeName==x&&(y.innerHTML=y.firstChild.innerHTML),z.firstChild&&z.firstChild.nodeName==x&&(z.innerHTML=z.firstChild.innerHTML),s(y)&&(y.innerHTML=h?" <br />":"<br />"),s(z)&&(z.innerHTML=h?" <br />":"<br />"),h?(g.insertNode(y),g.insertNode(z)):(g.insertNode(z),g.insertNode(y)),z.normalize(),y.normalize(),g=e.createRange(),g.selectNodeContents(z),g.collapse(1),f.removeAllRanges(),f.addRange(g),vp=n(b.getWin()),D=b.dom.getPos(z).y,E=z.clientHeight,(D<vp.y||D+E>vp.y+vp.h)&&b.getWin().scrollTo(0,D<vp.y?D:D-vp.h+25),!1}function u(a,d){function l(a){var b;a=a.target;if(a&&a.parentNode&&a.nodeName=="BR"&&(f=r(a))){b=a.previousSibling,c.remove(e,"DOMNodeInserted",l);if(b&&b.nodeType==3&&/\s+$/.test(b.nodeValue))return;(a.previousSibling||a.nextSibling)&&a.parentNode.removeChild(a)}}var e=b.getBody(),f,g=b.selection,h=g.getRng(),i=h.startContainer,f,j,k;if(i&&q(i)&&!/^(TD|TH)$/.test(i.nodeName)&&d)if(i.childNodes.length==0||i.childNodes.length==1&&i.firstChild.nodeName=="BR"){f=i;while((f=f.previousSibling)&&!q(f));if(f){if(i!=e.firstChild){j=b.getDoc().createTreeWalker(f,NodeFilter.SHOW_TEXT,null,!1);while(k=j.nextNode())f=k;h=b.getDoc().createRange(),h.setStart(f,f.nodeValue?f.nodeValue.length:0),h.setEnd(f,f.nodeValue?f.nodeValue.length:0),g.getSel().removeAllRanges(),g.getSel().addRange(h),i.parentNode.removeChild(i)}return c.cancel(a)}}c._add(e,"DOMNodeInserted",l),window.setTimeout(function(){c._remove(e,"DOMNodeInserted",l)},1)}var c=a.Event,d,e=this,f,g,h,i,j,k,l;f=a.isIE,g=a.isGecko,h=a.isOpera,i=a.isWebKit,j=a.each,k=a.extend,this.settings=l=k({element:"P"},b.settings.forceblocks),b.onPreInit.add(m,e),f||b.onSetContent.add(function(a,b){b.format=="html"&&(b.content=b.content.replace(/<p>[\s\u00a0]+<\/p>/g,"<p><br /></p>"))}),b.onPostProcess.add(function(a,b){b.content=b.content.replace(/<p><\/p>/g,"<p> </p>")})}})(punymce);