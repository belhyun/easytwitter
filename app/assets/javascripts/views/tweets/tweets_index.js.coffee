class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  el: 'body .content-main'

  events:
    'click .tweet-actions li .retweet': 'retweet'

  retweet: (event) ->
    event.preventDefault()
    if(!gon.current_user)
      $("#dialog-confirm").dialog
        resizable: false
        height: 180
        modal: true
        buttons:
          "Login": ->
            location.href = "/auth/twitter"
          Cancel: ->
            $(this).dialog "close"
    else
      alert("Retweet!")
    #console.log(@collection.models[0].get('user'))
