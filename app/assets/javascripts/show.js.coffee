$(document).on 'ready page:load', ->
  $('.change-image-button').popover(
    html: true,
    content: $('.moods').html()
  )
  $('body').on 'click', (ev) ->
    #did not click a popover toggle or popover
    el = $(ev.target)
    if el.data('toggle') != 'popover' && el.parents('.change-image-button').length == 0 && el.parents('.popover.in').length == 0
      $('.change-image-button').popover('hide')


  copyUrl($('.btn-share-link'), $('.btn-share-link').attr('href'))

  $('.btn-share[data-width]').on 'click', (ev) ->
    ev.preventDefault()
    $el = $(ev.target).closest('.btn-share')
    window.open($el.attr('href'), '', "height=#{$el.data('height')}, width=#{$el.data('width')}")
