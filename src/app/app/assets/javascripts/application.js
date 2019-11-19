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

function resizeIcons() {
    if($(window).width() > 400) {
        $('.user#show #icon').addClass('fa-2x');
        $('.user#show #icon').removeClass('fa-lg');
    }else{
        $('.user#show #icon').addClass('fa-lg');
        $('.user#show #icon').removeClass('fa-2x');
    }

    if($(window).width() > 439) {
        $('.college_whitelists#form .actions .botao').addClass('large');
    }else{
        $('.college_whitelists#form .actions .botao').removeClass('large');
    }
}

$( window ).on( 'load', resizeIcons );
$( window ).on( 'resize', resizeIcons );

$(document).ready(function(){
    $('.favorite_colleges#show .jumbotron .collegebox .college').click(function() {
        var $this = $(this).children('.details');

        var openDetails = $('.favorite_colleges#show .jumbotron .collegebox .college .details').not($this).filter(function () { 
            return this.style.display == 'block' 
        });
        openDetails.css('display', 'none');

        if( $this.css('display') === 'block' ){
            $this.css('display', 'none');
        } else {
            $this.css('display', 'block');
        }
    });
});

$(document).ready(function(){
    $('.colleges#index .jumbotron .collegebox .college').click(function() {
        var $this = $(this).children('.details');

        var openDetails = $('.colleges#index .jumbotron .collegebox .college .details').not($this).filter(function () { 
            return this.style.display == 'block' 
        });
        openDetails.css('display', 'none');

        if( $this.css('display') === 'block' ){
            $this.css('display', 'none');
        } else {
            $this.css('display', 'block');
        }
    });
});

$(document).ready(function(){

    $('.colleges#index .jumbotron .collegebox .college .summary').each(function() {
        var newId = $(this).children('.name').text().replace(/ /g,'');
        $(this).attr('id', newId);
    });

    $('.favorite_colleges#show .jumbotron .collegebox .college .summary').each(function() {
        var newId = $(this).children('.name').text().replace(/ /g,'');
        $(this).attr('id', newId);
    });
});