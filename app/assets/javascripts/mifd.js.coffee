window.Mifd =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Mifd.Routers.Tweets
    Backbone.history.start()
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"

$(document).ready ->
  Mifd.initialize()

$(document).on 'page:load', ->
  Backbone.history.stop()
  Mifd.initialize()
