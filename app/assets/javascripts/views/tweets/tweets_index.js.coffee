class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  el: 'body .content-main'

  events:
    'click .tweet-actions li .retweet,.tweet-actions li .favorite': 'tweet_action'

  is_login: ->
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

  already_request: ->
    $("#dialog-already").dialog
        resizable: false
        height: 180
        modal: true
        buttons:
          "Ok": ->
            $(this).dialog "close"
          Cancel: ->
            $(this).dialog "close"

  success: ->
    $("#dialog-success").dialog
        resizable: false
        height: 180
        modal: true
        buttons:
          "Ok": ->
            $(this).dialog "close"
          Cancel: ->
            $(this).dialog "close"

  tweet_action: (event) ->
    event.preventDefault()
    if(!gon.current_user)
      @.is_login()
    else
      index = $(event.currentTarget).parents('.content').parent('li').index()
      tweet = @collection.at(index)
      chk = (if ($(event.currentTarget).attr("class") is "retweet") then "is_retweet" else "is_favorite")
      if(!tweet.get(chk))
        user_tweet = new Mifd.Models.UserTweet(
          user_desc: gon.current_user.screen_name
          type:(if $(event.currentTarget).attr("class") is "retweet" then "R" else "F")
          tweet_uuid:tweet.get('uuid')
        )
        user_tweet.save null,
          success: (model,response) ->
            if(Number(response.result))
              if chk == 'is_retweet'
                tweet.set
                  'is_retweet': true
              else
                tweet.set
                 'is_favorite': true
              alert 'success'
            else
              @.already_request()
       else
         @.already_request()
