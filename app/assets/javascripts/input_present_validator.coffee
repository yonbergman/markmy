class App.InputPresentValidator
  constructor: (@$el, @$buttonEl)->
    _.bindAll(@, 'testInput')
    @$el.on('keyup change', @testInput)
    @testInput()
    # @$buttonEl.addClass('disabled')

  testInput: ->
    @$buttonEl.toggleClass('disabled', _.isBlank(@$el.val()))
