#= require moment
#= require fullcalendar
#= require workouts
#= require owl.carousel

display_calendar = ->
  if $('#calendar').length > 0
    url = $('#calendar').data().url
    $('#calendar').fullCalendar
      events: url
      dayClick: (date) -> day_clicked(date.format())
      header:
        left: 'title'
        center: 'month,basicWeek'
        right: 'today prev,next'

day_clicked = (date) ->
  $.ajax
    method: 'get'
    url: "/workouts/#{date}"
    success: (html) ->
      $('#workout-view').html(html)

fetch_motivational_images = ->
  $('#owl-carousel').owlCarousel
    jsonPath: '/motivate.json'
    navigation: false
    slideSpeed: 2500
    autoPlay: 5000
    singleItem: true
    pagination: false
    autoHeight: true

  setTimeout ->
    fetch_motivational_images()
  , 60000

$(document).on 'page:load ready', ->
  display_calendar()
  setTimeout ->
    fetch_motivational_images()
  , 2500

$(document).on 'workout-saved', '.workout', (e) ->
  $('#calendar').fullCalendar 'refetchEvents'
  $('#workout-view').html('')
