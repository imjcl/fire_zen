$ ->
  myDataRef = new Firebase('https://popping-heat-1530.firebaseio.com/zen')

  first = true
  myDataRef.endAt().limit(1).on 'child_added', (snapshot) ->
    if (first)
      first = false
    else
      zen = snapshot.val()
      zen_name = snapshot.name()
      if $("##{zen_name}").length == 0
        displayZen(zen, zen_name)

  myDataRef.on 'child_removed', (snapshot) ->
    zen = snapshot.val()
    zen_name = snapshot.name()
    removeZen(zen, zen_name)

  removeZen = (zen, name) ->
    console.log 'something changed'
    $('#'+ "#{name}").remove()

  displayZen = (zen, name) ->
    rng = Math.floor(Math.random() * 6) + 1
    $('<h1/>').text(zen.quote).appendTo($('.zen')).wrap("<div id='#{name}' class='font-bg-#{rng}'/>")
    $("##{name}").append("<i class='fa fa-thumbs-up fa-2x'><span class='likes'>#{zen.likes}</span></i><i class='fa fa-thumbs-down fa-2x'><span class='dislikes'>#{zen.dislikes}</span></i>")

  addVote = (ref_name, direction) ->
    zen_ref = myDataRef.child("#{ref_name}/#{direction}")
    zen_ref.transaction (current_value) ->
      (current_value || 0) + 1  

  $('body').on 'click', '.fa-thumbs-up', ->
    ref_name = $(this).parent().attr('class')
    ref_name = ("#{ref_name}".split " ")[0]
    addVote(ref_name, 'likes')

  $('body').on 'click', '.fa-thumbs-down',  ->
    ref_name = $(this).parent().attr('class')
    ref_name = ("#{ref_name}".split " ")[0]
    addVote(ref_name, 'dislikes')

  myDataRef.on 'child_changed', (snapshot) ->
    zen = snapshot.val()
    zen_name = snapshot.name()
    $(".#{zen_name} span.likes").text(zen.likes)
    $(".#{zen_name} span.dislikes").text(zen.dislikes)

