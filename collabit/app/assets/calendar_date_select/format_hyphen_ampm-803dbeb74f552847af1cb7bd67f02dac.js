Date.prototype.toFormattedString=function(a){return str=this.getFullYear()+"-"+Date.padded2(this.getMonth()+1)+"-"+Date.padded2(this.getDate()),a&&(hour=this.getHours(),str+=" "+this.getAMPMHour()+":"+this.getPaddedMinutes()+" "+this.getAMPM()),str},Date.parseFormattedString=function(a){var b="([0-9]{4})(-([0-9]{2})(-([0-9]{2})( ([0-9]{1,2}):([0-9]{2})? *(pm|am)?)?)?)?",c=a.match(new RegExp(b,"i"));if(c==null)return Date.parse(a);var d=0,e=new Date(c[1],0,1);return c[3]&&e.setMonth(c[3]-1),c[5]&&e.setDate(c[5]),c[7]&&(hours=parseInt(c[7],10),d=0,c[9]&&(is_pm=c[9].toLowerCase()=="pm",is_pm&&hours<=11&&(hours+=12),!is_pm&&hours==12&&(hours=0)),e.setHours(hours)),c[8]&&e.setMinutes(c[8]),c[10]&&e.setSeconds(c[10]),c[12]&&e.setMilliseconds(Number("0."+c[12])*1e3),c[14]&&(d=Number(c[16])*60+Number(c[17]),d*=c[15]=="-"?1:-1),e};