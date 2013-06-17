(function() {
  var fixColumnHeights;

  fixColumnHeights = function() {
    $('body').removeClass('assets-resized'); // ie7
    if ($('html').css('content') == "\u2063") {
      $('.asset').css('height', '');

    } else {
      $('#pop').imagesLoaded(function() {
        $('.columnizer-row').each(function(idx, el) {
          $(this).find('.asset').height($(this).height());
        });
      });
      $('body').addClass('assets-resized'); // ie7
    }
  };

  $(document).on('pop-initialized', function() {
    $(window).on('resize', _.throttle(fixColumnHeights));
    $('.columnizer-row .asset').live('initialize', _.throttle(fixColumnHeights));
    $('.columnizer-row .asset').live('destroy', function() {
      $(this).find('.asset').css('height', '');
    });
  });

}).call(this);
