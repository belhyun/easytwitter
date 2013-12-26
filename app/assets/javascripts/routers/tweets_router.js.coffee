class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'
  index: ->
    view = new Mifd.Views.TweetsIndex()
    collection = new Mifd.Collections.Tweets()
    console.log(gon.tweets)
