class Mifd.Models.Tweet extends Backbone.Model
  url: '/api/v1/users'
  initialize: ()->
  getTweet: (id) ->
    @.fetch({
      url:"/tweets/"+id+".json"
      success: (resp) ->
      error: () ->
    })
