// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
  $('.buy').click(function(){
    $('.form').show();
  });
  $('.show_sended').click(function(){
    $('#show_sended').addClass('active');
    $('#show_completed').removeClass('active');
    $('#show_canceled').removeClass('active');
    $('.sended').show();
    $('.completed').hide();
    $('.canceled').hide();
  });
  $('.show_completed').click(function(){
    $('#show_sended').removeClass('active');
    $('#show_completed').addClass('active');
    $('#show_canceled').removeClass('active');
    $('.completed').show();
    $('.sended').hide();
    $('.canceled').hide();
  });
  $('.show_canceled').click(function(){
    $('#show_sended').removeClass('active');
    $('#show_completed').removeClass('active');
    $('#show_canceled').addClass('active');
    $('.canceled').show();
    $('.sended').hide();
    $('.completed').hide();
  });
  $(document).on('ajax:success', '.open_order', function(xhr, data, status) {
    $('.info_box').html(data);
    $('.bg-info').removeClass('bg-info');
    $(this).parent().parent().addClass('bg-info');
  });
});
