#= require moment
#= require fullcalendar
#= require workouts
#= require owl.carousel

display_calendar = ->
  $('#calendar').fullCalendar
    events: '/calendar'
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
      $('#workout-view').html(html).show()
      $('#motivation').hide()

fetch_motivational_images = ->
  $('#owl-carousel').owlCarousel
    jsonPath: '/motivate.json'
    navigation: false
    slideSpeed: 2500
    autoPlay: 5000
    singleItem: true
    pagination: false
    autoHeight: true
    transitionStyle: 'fade'

  setTimeout ->
    fetch_motivational_images()
  , 60000

$(document).on 'page:load ready', ->
  display_calendar()
  setTimeout ->
    fetch_motivational_images()
  , 2500

$(document).on 'close-workout', '.workout', (e) ->
  $('#calendar').fullCalendar 'refetchEvents'
  $('#workout-view').html('').hide()
  $('#motivation').show()
  new Chartkick.BarChart('chart-1', '/training/stats', {})

