class Mifd.Routers.Tweets extends Backbone.Router
  initialize: ->
  routes:
    '': 'index',
    'tweets': 'index',
    'tweets/recent': 'index',
    'tweets/people': 'index',
    'categories/:number': 'index'
    'categories/recent/:number': 'index'
    'categories/people/:number': 'index'
    'tweets/:id': 'show'
  index: ->
    new Mifd.Views.TweetsIndex(collection: new Mifd.Collections.Tweets(gon.tweets))
  show: (tweetId)->
    model = new Mifd.Models.Tweet()
    view = new Mifd.Views.TweetShow(model: model)
    model.getTweet(tweetId)
    #view.listenTo(model, 'change', view.render)
