class Mifd.Collections.Tweets extends Backbone.Collection
  model: Mifd.Models.Tweet

  initialize: ->

  url: '/api/v1/tweets'
