$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/chat/message', function(data) {
    eval(data);
  });
});
