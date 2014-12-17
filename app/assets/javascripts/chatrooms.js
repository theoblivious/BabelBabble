// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready(function() {
  $(function() {
    // Create a new client to connect to Faye
    var fayeUrl = '/faye';
    var client = new Faye.Client(fayeUrl);
// Subscribe to the public channel. This allows connected users to receive chats.this the <p> tags are going to be used  to take.  Its a method that takes in two arguments.  Where it subscribes to and then the data or mesage.(http://faye.jcoglan.com/browser/subscribing.html). this is how people receive other peoples chats.
    var public_subscription = client.subscribe('/messages/public', function(data) {
      $('<p></p>').html(data.username + ": " + data.msg).prependTo('#chat_room');
      if (data.scores) {
        $(".userScores").html();
      }
    });

     // Our own private channel. Allows an individual to receive messages on a private terminal.
    // var private_subscription = client.subscribe('/messages/private/<%= session[:username] %>', function(data) {
    //   $('<p></p>').addClass('private').html(data.username + ": " + data.msg).appendTo('#chat_room');
    // });

  }),

$( ".chat_container" ).submit(function(event) {
  alert( "Handler for .submit() called." );
  event.preventDefault();
});




});
