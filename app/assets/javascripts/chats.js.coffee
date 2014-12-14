// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/messages/public', (payload) ->
    $('#chat-room').find('.alert').prepend(payload.message) if payload.message
