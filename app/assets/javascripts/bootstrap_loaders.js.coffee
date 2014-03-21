$(document).on 'ready page:load', ->
  $('.has-popover').popover()
  $('.has-link').on 'click', (ev,el)->
    Turbolinks.visit $(ev.target).data('url')
