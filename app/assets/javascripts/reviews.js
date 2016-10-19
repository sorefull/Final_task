// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
  $('.show_approved').click(function(){
    $('.show_approved').css('color', 'blue');
    $('.show_unapproved').css('color', 'gray');
    $('div.approved').show();
    $('div.unapproved').hide();
  });
  $('.show_unapproved').click(function(){
    $('.show_unapproved').css('color', 'blue');
    $('.show_approved').css('color', 'gray');
    $('div.approved').hide();
    $('div.unapproved').show();
  });
  $(document).on('ajax:success', '.delete_review', function(xhr, data, status) {
    $('.reviews').html(data);
  });
  $(document).on('ajax:success', '#new_review', function(xhr, data, status) {
  $('#new_review').removeAttr('selected');
});
});