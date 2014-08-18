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
    $('<h1/>').text(zen.quote).appendTo($('.zen')).wrap("<div class='#{name}'/>")
    $(".#{name}").append("<i class='fa fa-thumbs-up fa-2x'><span class='likes'>#{zen.likes}</span></i><i class='fa fa-thumbs-down fa-2x'><span class='dislikes'>#{zen.dislikes}</span></i>")

  addVote = (ref_name, direction) ->
    zen_ref = myDataRef.child("#{ref_name}/#{direction}")
    zen_ref.transaction (current_value) ->
      (current_value || 0) + 1  

  $('body').on 'click', '.fa-thumbs-up', ->
    ref_name = $(this).parent().attr('class')
    addVote(ref_name, 'likes')

  $('body').on 'click', '.fa-thumbs-down',  ->
    ref_name = $(this).parent().attr('class')
    addVote(ref_name, 'dislikes')

  myDataRef.on 'child_changed', (snapshot) ->
    zen = snapshot.val()
    zen_name = snapshot.name()
    $(".#{zen_name} span.likes").text(zen.likes)
    $(".#{zen_name} span.dislikes").text(zen.dislikes)

