class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  el: 'body .content-main'

  events:
    'click .tweet-actions li .retweet': 'retweet'

  retweet: (event) ->
    event.preventDefault()
    alert('retweet')
