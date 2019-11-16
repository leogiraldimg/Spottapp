// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require serviceworker-companion

function changeMenuLayout() {
    if(document.getElementById("btn-change-user-menu").value == "circle"){
        document.getElementById("btn-change-user-menu").value = "list";
        document.getElementById("circle-menu").style.display = "none";
        document.getElementById("list-menu").style.display = "inline-block";
    }
     
    else if(document.getElementById("btn-change-user-menu").value == "list"){
        document.getElementById("btn-change-user-menu").value = "circle";
        document.getElementById("circle-menu").style.display = "inline-block";
        document.getElementById("list-menu").style.display = "none";
    }
}

function resizeIcons() {
    if($(window).width() > 400) {
        $('.user#show #icon').addClass('fa-2x');
        $('.user#show #icon').removeClass('fa-lg');
    }else{
        $('.user#show #icon').addClass('fa-lg');
        $('.user#show #icon').removeClass('fa-2x');
    }
}

$( window ).on( "load", resizeIcons );
$( window ).on( "resize", resizeIcons );