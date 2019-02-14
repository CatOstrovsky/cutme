# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready () ->
  if $(".timer-auto-link").length > 0
    interval = setInterval tick, 1000


timerValue = 5
tick = () ->
  timerValue--
  if timerValue > 0
    $(".timer-value").text timerValue
  else
    window.location.href = $(".timer-link").text()
