$(document).on "page:update", ->
  myDataRef = new Firebase('https://popping-heat-1530.firebaseio.com/zen')

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

