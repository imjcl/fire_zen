$ ->
  myDataRef = new Firebase('https://popping-heat-1530.firebaseio.com/zen')

  first = true
  myDataRef.endAt().limit(1).on 'child_added', (snapshot) ->
    if (first)
      first = false
    else
      message = snapshot.val()
      displayZen(message.quote)

  displayZen = (quote) ->
    $('<li/>').text(quote).appendTo($('ul.zen'))