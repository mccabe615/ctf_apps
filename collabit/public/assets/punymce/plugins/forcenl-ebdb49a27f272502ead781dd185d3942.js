punymce.plugins.ForceNL=function(a){a.onGetContent.add(function(a,b){(b.format=="forcenl"||b.save)&&punymce.each([[/<(br\s*\/)>/gi,"\n"],[/<(br.*?\/)>/gi,""]],function(a){b.content=b.content.replace(a[0],a[1])})}),a.onSetContent.add(function(a,b){(b.format=="forcenl"||b.load)&&punymce.each([[/\n/gi,"<br />"]],function(a){b.content=b.content.replace(a[0],a[1])})})};