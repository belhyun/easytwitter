class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'
  index: ->
    @collection = new Mifd.Collections.Tweets(gon.tweets)
    view = new Mifd.Views.TweetsIndex(collection: @collection)
