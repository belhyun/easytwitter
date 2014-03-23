class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index',
    '/categories/:number': 'index'
  index: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))

