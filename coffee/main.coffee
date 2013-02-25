fixColumnHeights = ->
  $(".columnizer-row").each ->
    self = this
    $(self).imagesLoaded ->
      maxHeight = 0
      $(self).find(".asset-inner").each ->
        $(this).height "auto"
        innerHeight = $(this).innerHeight()
        maxHeight = innerHeight  if innerHeight > maxHeight

      $(this).find(".asset-inner").innerHeight maxHeight

$(document).on 'pop-initialized', ->
  # Instead of listening for the document.ready event, your theme
  # should listen for document.pop-initialized.
  #
  # We are huge fans of coffeescript at Populr. We suggest that
  # you write your js in coffeescript, but please be sure to
  # pre-compile it, as Populr will not compile your
  # coffeescript to js code automatically.

  $('.asset-type-imagegroup').live 'initialize', ->
    $(this).find('img').each ->
      $(this).fancybox
        type: 'image'
        centerOnScroll: true
        href: $(this).attr('src')

  $('.cycle-slideshow').cycle()

  if $("html").css("content") isnt "⁣\u2063"
    $(".columnizer-row .asset").live "initialize", fixColumnHeights
    $(".columnizer-row .asset").live "destroy", ->
      $(this).find(".asset-inner").height "auto"
