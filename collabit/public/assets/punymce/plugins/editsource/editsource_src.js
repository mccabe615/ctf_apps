(function(a){a.plugins.EditSource=function(b){var c=a.DOM,d=a.extend,e=a.each,f=a.isWebKit,g=0;(!b.settings.editsource||b.settings.editsource.skip_css)&&c.loadCSS(a.baseURL+"/plugins/editsource/css/editor.css"),b.onBeforeGetContent.add(function(a,b){b.save&&g&&a.setContent(c.get(a.settings.id+"_editsourcearea").value,{load:!0})}),d(b.commands,{mceEditSource:function(a,d,h){var i,j=b.getIfr(),k=b.settings.id,l=b.width,m=b.height,n,o=c.get(k+"_editsource");return g?(g=0,c.removeClass(o,"active"),f||(j.style.display="block",i=c.get(k+"_edspacer"),i.parentNode.removeChild(i)),i=c.get(k+"_editsourcearea"),b.setContent(i.value,{load:!0}),i.parentNode.removeChild(i),e(c.select("li",k+"_c"),function(a){c.removeClass(a,"disabled")}),!1):(c.addClass(o,"active"),e(c.select("li",k+"_c"),function(a){a!=o&&c.addClass(a,"disabled")}),i=c.add(j.parentNode,"textarea",{id:k+"_editsourcearea","class":"editsource",style:"width:"+l+"px;height:"+m+"px;"}),i.value=b.getContent({save:!0}),i.focus(),f||(c.add(j.parentNode,"div",{id:k+"_edspacer","class":"spacer",style:"width:"+l+"px;height:"+m+"px;"}),j.style.display="none"),g=1,!1)}}),d(b.tools,{editsource:{cmd:"mceEditSource",title:a.I18n.editsource}})},a.extend(a.I18n,{editsource:"Edit HTML source"})})(punymce);