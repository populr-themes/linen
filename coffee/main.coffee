$(document).on 'pop-initialized', ->
  # Instead of listening for the document.ready event, your theme
  # should listen for document.pop-initialized.
  #
  # We are huge fans of coffeescript at Populr. We suggest that
  # you write your js in coffeescript, but please be sure to
  # pre-compile it, as Populr will not compile your
  # coffeescript to js code automatically.

  $(".fancybox").eq(0).trigger 'click'

  $('.cycle-slideshow').cycle()

  currentTallest = 0
  currentRowStart = 0
  rowDivs = new Array()
  topPosition = 0

  $(".asset").each ->
    $el = $(this)
    topPostion = $el.position().top
    unless currentRowStart is topPostion

      # we just came to a new row.  Set all the heights on the completed row
      currentDiv = 0
      while currentDiv < rowDivs.length
        rowDivs[currentDiv].height currentTallest
        currentDiv++

      # set the variables for the new row
      rowDivs.length = 0 # empty the array
      currentRowStart = topPostion
      currentTallest = $el.height()
      rowDivs.push $el
    else

      # another div on the current row.  Add it to the list and check if it's taller
      rowDivs.push $el
      currentTallest = Math.max(currentTallest, $el.height())

    # do the last row
    currentDiv = 0
    while currentDiv < rowDivs.length
      rowDivs[currentDiv].height currentTallest
      currentDiv++
