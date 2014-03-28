class Mifd.Models.Tweet extends Backbone.Model
  initialize: ()->
  getTweet: (id) ->
    @.fetch({
      url:"/tweets/"+id+".json"
      success: (resp) ->
      error: () ->
        alert 'error occured'
    })
