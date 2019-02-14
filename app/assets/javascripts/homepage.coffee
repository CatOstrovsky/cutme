# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("body").on "submit", "#generate-form", (e) ->
    e.preventDefault()
    $data = $(this).find("input").first().val()
    createUrl($data)

  clipboard = new ClipboardJS('.btn');
  clipboard.on 'success', (e) ->
      makeSuccess("Link was copied!")


createUrl = (url) ->
  $("#generated-data-wrapper").animate {opacity: 0}, 250
  if isUrl(url)
    $.post('/links.json', { link : { original : url } } )
      .then onRequestCreate
  else
    makeError("No valid url! Please enter valid url!")

isUrl = (url) ->
  new RegExp(/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/).test url

makeError = (text) ->
  new Noty({text: text, type: 'alert', timeout: 2000, theme: 'nest'}).show()

makeSuccess = (text) ->
  new Noty({text: text, type: 'success', timeout: 2000, theme: 'nest'}).show()

onRequestCreate = (res) ->
  link = window.origin+"/@"+res.short
  makeSuccess "Success created link "+link
  $("#generated-data-wrapper").animate {opacity: 1}, 250
  $("#link").val(link)
  $("#generated-data-wrapper .opennewtab").attr("href", link)
