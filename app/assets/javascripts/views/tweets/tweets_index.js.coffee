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
      index = $(event.currentTarget).parents('.content').parent('li').index()
      tweet = @collection.at(index)
      if(!tweet.get('is_retweet'))
        user_tweet = new Mifd.Models.UserTweet(
          user_desc: gon.current_user.screen_name
          type: 'R'
          tweet_uuid:tweet.get('uuid') 
        )
        user_tweet.save null,
          success: (model,response) ->
            if(Number(response.result))
              tweet.set 
                is_retweet: true
              alert 'success'
            else
              alert response.msg
       else
        alert 'already retweet'
      #index = $(event.currentTarget).parents('.content').parent('li').index()
      #console.log(@collection.at(index).get('uuid'))
      #current user name : console.log(gon.current_user.screen_name)
      #type : R
      #console.log(@collection.models[0].get('user'))
      #console.log($(event.currentTarget).parents('.content').parent('li').index())
