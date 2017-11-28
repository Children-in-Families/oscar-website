OSCAR.Common = do ->
  _init = ->
    _scrollToTop()

  _scrollToTop = ->
    $(window).scroll ->
      if $(this).scrollTop() > 50
        $('#back-to-top').fadeIn()
      else
        $('#back-to-top').fadeOut()

        $('#back-to-top').click ->
          $('#back-to-top').tooltip 'hide'
          $('body,html').animate { scrollTop: 0 }, 800

          $('#back-to-top').tooltip 'show'

  { init: _init }