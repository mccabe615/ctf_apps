// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var app = {

loadReport: function () {
      $("div.inner_main").load("/test"
                               , null,
                        function (responseText, status, response) {
                          //alert(JSON.stringify(response));
                        }).fadeIn(2000);
    },
};
     jQuery(function () {
      
      app.loadReport()
      setInterval(app.loadReport, 15000);
     
     });