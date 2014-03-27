jQuery.fn.shake = (shakes=4, distance=3, duration=400)->
  @stop(true, true)
  @css('position','relative')
  @each(->
    for i in [1..shakes]
      $(@).animate(left:(distance*-1), ((duration/shakes) / 4))
        .animate(left:distance, ((duration/shakes) / 2 ))
        .animate(left:0, ((duration/shakes) / 4))
  )
