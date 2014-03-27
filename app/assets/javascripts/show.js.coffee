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
  # $('.btn-share-link').click (ev)->
  #   ev.preventDefault();
  copyUrl($('.btn-share-link'), $('.btn-share-link').attr('href'))
