# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("body").on "submit", "#generate-form", (e) ->
    e.preventDefault()
    $data = $(this).find("input").first().val()
    createUrl($data)

createUrl = (url) ->
  if isUrl(url)
    $.post('/links.json', { link : { original : url } } )
      .then onRequestCreate
  else
    makeError("No valid url! Please enter valid url!")

isUrl = (url) ->
  new RegExp(/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/).test url

makeError = (text) ->
  $noty = new Noty {text: text, type: 'alert', timeout: 2000, theme: 'nest'}
  $noty.show()

makeSuccess = (text) ->
  $noty = new Noty {text: text, type: 'success', theme: 'nest'}
  $noty.show()

onRequestCreate = (res) ->
  makeSuccess("Success created link "+window.origin+"/@"+res.short)
