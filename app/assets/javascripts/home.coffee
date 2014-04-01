#= require typed
class Home
  texts: [ 'This app is going to go viral',
    '$FB stock will pass $100 per share',
    'DOGE coin is going to overtake BitCoin in value',
    'You\'ll get more than 750 on your SATs',
    'At the age of 21 I\'ll make it to the moon',
    'Winds of Winter will be relased this year (2014)',
  ]
  constructor: (@$el)->
    _.bindAll(@, 'typed', 'inputKeyup', 'blur', 'wantToEdit')
    @ui =
      input: @$el.find('.demo-text')
      btn:   @$el.find('.btn-create-blurb')
      overlay: @$el.find('.typed-overlay')
      overlayText: @$el.find('.typed-overlay .text')
    @originalPlaceholder = @ui.input.attr('placeholder')
    @bindActions()
    @typed()
    new App.InputPresentValidator(@ui.input, @ui.btn)


  bindActions: ->
    @ui.overlay.on('click', @wantToEdit)
    @ui.input.on('keydown', @inputKeyup)
    @ui.input.on('blur', @blur)
    @ui.input.on('focus-now', @wantToEdit)

  wantToEdit: ->
    @ui.overlay.hide()
    @ui.input.show().focus()

  typed: ->
    @ui.input.hide()
    @ui.overlay.show()
    @ui.overlayText.typed(
      strings: [@originalPlaceholder].concat(@texts)
      loop: true
      backDelay: 1800, # pause before backspacing
      # startDelay: 1000
    )

  inputKeyup: (ev) ->
    if (ev.keyCode == 13) #ENTER
      ev.preventDefault()
      $(ev.target).parents('form').submit()
      return false;

  blur: ->
    if _.isBlank(@ui.input.val())
      t = @ui.overlayText.data('typed')
      @typed()


$(document).on 'ready page:load', ->
  el = $('#home')
  return unless el[0]
  window.home = new Home(el);
