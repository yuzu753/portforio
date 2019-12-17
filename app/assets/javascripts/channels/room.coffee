document.addEventListener 'turbolinks:load', ->
  chat_room_id = $('#messages').data('chat_room_id')
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", chat_room_id: chat_room_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages').append(data['message'])

    speak: (message) ->
      @perform 'speak', message: message

    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()