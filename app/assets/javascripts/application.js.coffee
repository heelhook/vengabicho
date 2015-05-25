#= require jquery
#= require jquery_ujs
#= require jquery-ui

$(document).on 'page:load ready', ->
  $("input.datepicker").datepicker()
