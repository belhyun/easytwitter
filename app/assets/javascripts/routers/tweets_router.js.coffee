class Mifd.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index',
    'categories/:id': 'category'
  index: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  category: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  profile: ->
    if(!_.isUndefined(window.Mifd.Views.show))
      window.Mifd.Views.show.remove()
    window.Mifd.Views.show = new Mifd.Views.Show(collection:new Mifd.Collections.Users([gon.tweet_user,(if _.isNull(gon.current_user) then {} else gon.current_user)]))
    
