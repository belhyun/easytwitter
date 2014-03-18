class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index',
    'categories/:id': 'category'
  index: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  category: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  profile: ->
    new Mifd.Views.Show(collection:new Mifd.Collections.Users([gon.tweet_user, gon.current_user]))
