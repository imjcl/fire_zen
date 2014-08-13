$ ->
  myDataRef = new Firebase('https://popping-heat-1530.firebaseio.com/zen')

  first = true
  myDataRef.endAt().limit(1).on 'child_added', (snapshot) ->
    if (first)
      first = false
    else
      zen = snapshot.val()
      console.log(zen)
      displayZen(zen)

  displayZen = (zen) ->
    $('<li/>').text(zen.quote).addClass('hi').appendTo($('ul.zen'))