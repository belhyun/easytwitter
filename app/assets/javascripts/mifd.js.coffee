window.Mifd =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Mifd.Routers.Tweets
    Backbone.history.start()

$(document).ready ->
  Mifd.initialize()
  $("img").error ->
    $(this).attr "src","/assets/designer.jpg"

$(document).on 'page:load', ->
  Backbone.history.stop()
  Mifd.initialize()
