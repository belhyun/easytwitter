class Mifd.Models.UserTweet extends Backbone.Model
  initialize: ->
    #Backbone.sync = (method, model) ->
    #alert method + ": " + JSON.stringify(model)
  url: '/api/v1/user_tweets'
  change: ->
    alert 1
