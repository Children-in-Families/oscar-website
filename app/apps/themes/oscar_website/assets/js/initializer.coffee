OSCAR.Initializer =
  exec: (pageName) ->
    if pageName && OSCAR[pageName]
      OSCAR[pageName]['init']()

  currentPage: ->
    return '' unless $('#content-wrapper > section').attr('id')
    sectionId   = $('#content-wrapper > section').attr('id').split('-')
    sectionIdConcated = ''

    $.each sectionId, (index, value) ->
      sectionIdSplitted = OSCAR.Util.capitalize(value)
      sectionIdConcated = "#{sectionIdConcated}#{sectionIdSplitted}"

    sectionIdConcated

  init: ->
    OSCAR.Initializer.exec('Common')
    if @currentPage()
      OSCAR.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  OSCAR.Initializer.init()