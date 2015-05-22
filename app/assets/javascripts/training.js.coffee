#= require moment
#= require fullcalendar

display_calendar = ->
  if $('#calendar').length > 0
    url = $('#calendar').data().url
    $('#calendar').fullCalendar
      events: url
      eventClick: (event) -> event_clicked(event)

event_clicked = (event) ->
  $.ajax
    method: 'get'
    url: event.details_url
    success: (html) ->
      $('aside#sidebar').html(html)

$ -> display_calendar()
$(document).on 'page:load', -> display_calendar()
