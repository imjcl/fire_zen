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
    $(".#{name}").append('<i class="fa fa-thumbs-up fa-lg"></i><i class="fa fa-thumbs-down fa-lg"></i>')

  addVote = (ref_name, direction) ->
    zen_ref = myDataRef.child("#{ref_name}/#{direction}")
    zen_ref.transaction (current_value) ->
      (current_value || 0) + 1  

  $('.fa-thumbs-up').click ->
    ref_name = $(this).parent().attr('class')
    addVote(ref_name, 'likes')

  $('.fa-thumbs-down').click ->
    ref_name = $(this).parent().attr('class')
    addVote(ref_name, 'dislikes')

  myDataRef.on 'child_changed', (snapshot) ->
    zen = snapshot.val()
    zen_name = snapshot.name()
    $(".#{zen_name} span.likes").text(zen.likes)
    $(".#{zen_name} span.dislikes").text(zen.dislikes)

