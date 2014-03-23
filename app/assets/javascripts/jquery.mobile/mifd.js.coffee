(()->
  window.Mifd =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    initialize: ->
      window.Mifd.Routers.router = new Mifd.Routers.Tweets
      if !Backbone.History.started
        Backbone.history.start()
  $(document).on "pagecreate", (e)->
    Mifd.initialize()
).call(this)
