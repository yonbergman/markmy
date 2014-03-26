
class Home
  texts: [
    'This app is going to go viral',
    '$FB stock will pass $100 per share',
    'DOGE coin is going to overtake BitCoin in value',
    'You\'ll get more than 750 on your SATs',
    'At the age of 21 I\'ll make it to the moon',
    'Winds of Winter will be relased this year (2014)',
  ]
  constructor: (@$el)->
    _.bindAll(@, 'run', 'inputKeyup')
    @ui =
      input: @$el.find('.demo-text')
      btn:   @$el.find('.btn-create-blurb')
    @originalPlaceholder = @$el.attr('placeholder')
    @focused = false
    @bindActions()
    @startInterval()
    new App.InputPresentValidator(@ui.input, @ui.btn)

  bindActions: ->
    @ui.input.on('focus', => @focused = true)
    @ui.input.on('blur', => @focused = false)
    @ui.input.on('keydown', @inputKeyup)

  startInterval: ->
    setTimeout(
      ( => @run(); setInterval(@run, 2400) )
    , 1800)

  run: ->
    return if @focused
    @ui.input.attr('placeholder', _.sample(@texts))

  inputKeyup: (ev) ->
    if (ev.keyCode == 13) #ENTER
      ev.preventDefault()
      $(ev.target).parents('form').submit() unless @ui.btn.hasClass('disabled')
      return false;

$(document).on 'ready page:load', ->
  el = $('#home')
  return unless el[0]
  window.home = new Home(el);
