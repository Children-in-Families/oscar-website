Oscar.Initializer =
  exec: (pageName) ->
    if pageName && Oscar[pageName]
      Oscar[pageName]['init']()

  currentPage: ->
    return '' unless $('#oscar-content > section').attr('id')

    sectionId   = $('#oscar-content > section').attr('id').split('-')
    prefix  = Oscar.Util.capitalize(sectionId[0])
    if sectionId[1]
      suffix  = Oscar.Util.capitalize(sectionId[1])
      prefix + suffix
    else
      prefix

  init: ->
    Oscar.Initializer.exec('Common')
    if @currentPage()
      Oscar.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  Oscar.Initializer.init()