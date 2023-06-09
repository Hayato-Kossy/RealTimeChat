import consumer from "channels/consumer"
const roomId = "4"
// document.getElementById('room-id').dataset.roomId;
console.log(roomId)
const appRoom = consumer.subscriptions.create({channel: "RoomChannel", room: roomId}, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  const messages = document.getElementById('messages');
  messages.insertAdjacentHTML('beforeend', `<div class="message"><p>${data['message']}</p></div>`);
    console.log(data);
    // $('#chats').append('<p>' + data.message + '</p>');
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.document.onkeydown = function(event) {
  if(event.key == 'Enter') {
    if (!event.isComposing) { // IMEの変換が完了した場合のみ動作
      appRoom.speak(event.target.value);
      event.target.value = '';
      event.preventDefault();
    }
  }
}

window.addEventListener("compositionstart", function(event) {
  event.target.isComposing = true;
});

window.addEventListener("compositionend", function(event) {
  event.target.isComposing = false;
});