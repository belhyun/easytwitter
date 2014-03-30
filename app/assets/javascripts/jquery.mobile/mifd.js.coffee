(()->
  window.Mifd =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    initialize: ->
      window.Mifd.Routers.router = new Mifd.Routers.Tweets
      if !Backbone.History.started
        Backbone.history.start({pushState:true})
    Util:{
      tweetRequest: (userDesc, type, tweetUuid, succ) ->
        (new Mifd.Models.UserTweet(
          user_desc: userDesc
          type: type
          tweet_uuid:tweetUuid
        )).save(null,{
          success: (model, response) ->
            succ.call(@)
        })
    }

  $(document).on "pagecreate", (e)->
    Mifd.initialize()
).call(this)
