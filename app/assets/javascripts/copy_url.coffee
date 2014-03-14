window.copyUrl = (el, url)->
  $(el).zclip(
    copy: url,
    afterCopy: (ev)->
      $(ev.target).tooltip(
        title: 'Copied URL',
        trigger: 'manual',
        container: 'body',
      ).tooltip('show')
      setTimeout(
        (-> $(ev.target).tooltip('destroy').show())
        , 1000
      )
  )
