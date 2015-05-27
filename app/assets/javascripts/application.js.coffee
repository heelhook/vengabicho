#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require refills/navigation

$(document).on 'page:load ready', ->
  $("input.datepicker").datepicker()
