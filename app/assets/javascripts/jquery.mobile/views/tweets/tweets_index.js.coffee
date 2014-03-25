class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']
  el: 'body'
  events:
    "click #tweets li": 'profile'
  close: (e)->
  initialize: ->
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"
    that = @
    $(document).scrollstart ->
  profile: (e)->
    window.Mifd.Routers.router.navigate("tweets/"+$(e.currentTarget).children("#uuid_").attr("value"),{trigger: true})
