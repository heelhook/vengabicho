workout_setup = ->
  $('body').on 'change', 'select#exercise', (e) -> show_exercise()

  $('body').on 'click', '.exercises .exercise h2 [data-role="remove"]', (e) ->
    $(@).parents('.exercise').slideUp -> $(@).addClass('hidden')

  $('body').on 'click', '[data-role="save-workout"]', (e) -> save_workout()

  $('body').on 'click', '[data-role="close-workout"]', (e) -> close_workout()

show_exercise = ->
  selection = $('select#exercise').val()
  $("##{selection}").slideDown -> $(@).removeClass('hidden')
  $(@).find('option:first').attr('selected', 'selected')

  training_areas = $("##{selection}").data().trainingareas.split ' '
  for training_area in training_areas
    $(".training-area-points ##{training_area}.training-area-point").slideDown()

save_workout = ->
  workout = $('.workout')
  data = {
    exercises: data_workout_exercises(),
    training_area_points: data_workout_training_area_points(),
    workout_points: data_workout_points(),
  }

  $.ajax
    url: workout.data().url
    method: 'put'
    data: data
    beforeSend: -> workout.addClass 'submitting'
    complete: ->
      workout.removeClass 'submitting'
      close_workout()

  false

close_workout = -> $('.workout').trigger 'close-workout'

data_workout_exercises = ->
  data = {}

  for exercise in $('.workout .exercise:not(.hidden)')
    exercise_id = $(exercise).attr('id')
    data[exercise_id] = {}
    for input in $(exercise).find('input,select,textarea')
      name = $(input).attr('name')
      val = $(input).val()
      data[exercise_id][name] = val

  data

data_workout_training_area_points = ->
  data = {}
  for slider in $('.workout .training-area-point .slider:visible')
    data[$(slider).attr('id')] = $(slider).slider('instance').value()
  data

data_workout_points = ->
  data = {}
  for slider in $('.workout .workout-point .slider:visible')
    data[$(slider).attr('id')] = $(slider).slider('instance').value()
  data

$(document).on 'page:load ready', -> workout_setup()
