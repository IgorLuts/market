// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require respond.min
//= require jquery-1.11.0.min
//= require bootstrap.min
//= require jquery.cookie
//= require waypoints.min
//= require modernizr
//= require bootstrap-hover-dropdown
//= require owl.carousel.min
//= require ckeditor/init
//= require_tree .

$(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto();

    var url = window.location;
    var element = $('ul.nav.category-menu a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().addClass('active').parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }

    var element2 = $('ul.nav.navbar-left a').filter(function() {
        var url_head = url.href.split('#', 1)[0];
        return this.href ==url_head;
    }).parent().addClass('active');


});