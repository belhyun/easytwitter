class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index',
    'categories/:id': 'category'
  index: ->
    @collection = new Mifd.Collections.Tweets(gon.tweets)
    view = new Mifd.Views.TweetsIndex(collection: @collection)
  category: ->
    @collection = new Mifd.Collections.Tweets(gon.tweets)
    view = new Mifd.Views.TweetsIndex(collection: @collection)
  profile: ->
    view = new Mifd.Views.Show(collection:[new Mifd.Models.User(gon.tweet_user), new Mifd.Models.User(gon.current_user)])
