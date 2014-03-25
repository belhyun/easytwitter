class Mifd.Routers.Tweets extends Backbone.Router
  initialize: ->
    console.log 'init'
  routes:
    '': 'index',
    '/categories/:number': 'index'
    'tweets/:id': 'show'
  index: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  show: (tweetId)->
    model = new Mifd.Models.Tweet()
    view = new Mifd.Views.TweetShow(model: model)
    model.getTweet(tweetId)
    view.listenTo(model, 'change', view.update)
