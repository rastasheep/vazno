#= require turbolinks
#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require_self
#= require config
#= require vazno
#= require_tree .
# window.Vazno = Em.Application.create()

ready = ->
  $("#more-button").click ->
    $(".dropdown-items").toggle()
    return false

  $("#flash").click ->
    $(this).hide()
    return false

$(document).ready(ready)
$(document).on('page:load', ready)
