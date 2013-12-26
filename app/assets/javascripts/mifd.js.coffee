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
