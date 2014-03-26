
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
    _.bindAll(@, 'run')
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

  startInterval: ->
    setTimeout(
      ( => @run(); setInterval(@run, 2400) )
    , 1800)

  run: ->
    return if @focused
    @ui.input.attr('placeholder', _.sample(@texts))

$(document).on 'ready page:load', ->
  el = $('#home')
  return unless el[0]
  window.home = new Home(el);
