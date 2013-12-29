class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  el: 'body .content-main'

  events:
    'click .tweet-actions li .retweet': 'retweet'

  retweet: (event) ->
    event.preventDefault()
    $("#dialog-confirm").dialog
      resizable: false
      height: 180
      modal: true
      buttons:
        "Login": ->
          $(this).dialog "close"

        Cancel: ->
          $(this).dialog "close"
    #console.log(@collection.models[0].get('user'))
