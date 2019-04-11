App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
      debugger
    return $('#messages').append(data['message']);
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message[1],
      user_id: message[0]
    });
  }
});

$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.room.speak(values);
  $(this).trigger('reset');
});
