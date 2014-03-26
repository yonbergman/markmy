class DemoText
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
    @originalPlaceholder = @$el.attr('placeholder')
    @focused = false
    @$el.on('focus', => @focused = true)
    @$el.on('blur', => @focused = false)
    setTimeout(
      ( => @run(); setInterval(@run, 2400) )
    , 1800)

  run: ->
    return if @focused
    @$el.attr('placeholder', _.sample(@texts))

$(document).on 'ready page:load', ->
  el = $('.demo-text')
  return unless el[0]
  new DemoText(el);
