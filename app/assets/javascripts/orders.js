// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
  $('.buy').click(function(){
    $('.form').show();
  });
  $('.show_sended').click(function(){
    $('.sended').show();
    $('.show_sended').css('color', 'blue')
    $('.completed').hide();
    $('.show_completed').css('color', 'gray')
    $('.canceled').hide();
    $('.show_canceled').css('color', 'gray')
  });
  $('.show_completed').click(function(){
    $('.completed').show();
    $('.show_completed').css('color', 'blue')
    $('.sended').hide();
    $('.show_sended').css('color', 'gray')
    $('.canceled').hide();
    $('.show_canceled').css('color', 'gray')
  });
  $('.show_canceled').click(function(){
    $('.canceled').show();
    $('.show_canceled').css('color', 'blue')
    $('.sended').hide();
    $('.show_sended').css('color', 'gray')
    $('.completed').hide();
    $('.show_completed').css('color', 'gray')
  });
});
