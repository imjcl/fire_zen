$ ->
  myDataRef = new Firebase('https://popping-heat-1530.firebaseio.com/zen')

  first = true
  myDataRef.endAt().limit(1).on 'child_added', (snapshot) ->
    if (first)
      first = false
    else
      zen = snapshot.val()
      zen_name = snapshot.name()
      displayZen(zen, zen_name)

  displayZen = (zen, name) ->
    $('<li/>').text(zen.quote).addClass(name).appendTo($('ul.zen'))