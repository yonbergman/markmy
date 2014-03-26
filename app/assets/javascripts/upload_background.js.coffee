class UploadBackground
  constructor: ()->
    _.bindAll(@, 'click')
    $('body').on('click', '.btn-upload-file', @click)

  click: (ev)->
    buttonEl = $(ev.target)
    form = buttonEl.parent()
    inputEl = form.find('.file-input')

    inputEl.click()
    inputEl.on 'change', ->
      buttonEl.find('.before').hide()
      buttonEl.find('.during').removeClass('hidden')
      form.submit()


$(document).on 'ready page:load', ->
  new UploadBackground()
