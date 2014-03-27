class Mifd.Views.TweetShow extends Backbone.View
  el:"div[data-role='content']"
  template: JST['jquery.mobile/templates/tweets/show']
  initialize: ->
  render: ->
    $(@el).html(@template({user:@.model.get('user'), tweet:@.model.attributes}))
