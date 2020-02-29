document.addEventListener 'turbolinks:load', ->
  App.chat_message = App.cable.subscriptions.create { channel: 'ChatMessageChannel', chat_room_id: $('#chat_room').data('chat_room') },
   connected: ->
     # Called when the subscription is ready for use on the server

   disconnected: ->
     # Called when the subscription has been terminated by the server

   received: (data) ->
     # Called when there's incoming data on the websocket for this channel
     $('#chat_messages').append '<div>' + data['user_name'] + ': ' + data['message'] + '</div>'

   speak: (message, user) ->
     @perform 'speak', message: message, user: user

   $(document).on 'keypress', '[data-behavior~=speak_chat_messages]', (event) ->
     if event.keyCode is 13
       App.chat_message.speak(event.target.value, $('#chat_room').data('user'))
       event.target.value = ''
       event.preventDefault()