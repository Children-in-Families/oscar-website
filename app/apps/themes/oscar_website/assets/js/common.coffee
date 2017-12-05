Oscar.Common = do ->
  _init = ->
    _addCurrentLinkToNavbar()

  _addCurrentLinkToNavbar = ->
    about_me = $("a[href='/about-us']")
    about_me.addClass('current-link') unless about_me.hasClass('current-link')

  { init: _init }