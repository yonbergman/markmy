#= require jquery.shake
class App.InputPresentValidator
  constructor: (@$el, @$buttonEl)->
    _.bindAll(@, 'testInput', 'submit')
    @$el.on('keyup change', @testInput)
    @$el.parents('form').on('submit', @submit)
    @testInput()

  testInput: ->
    @$buttonEl.toggleClass('pseudo-disabled', _.isBlank(@$el.val()))

  submit: (ev)->
    if _.isBlank(@$el.val())
      ev.preventDefault()
      @$el.trigger('focus-now')
      @$buttonEl.shake()
      @$buttonEl.tooltip(title: 'Enter a prediction', trigger: 'manual')
      @$buttonEl.tooltip('show')
      setTimeout(
        (=> @$buttonEl.tooltip('destroy').show())
        , 1200
      )
