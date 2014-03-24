class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']
  el: 'body'
  close: (e)->
  initialize: ->
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"
    $(document).scrollstart ->
      console.log 'scrollstart'
  test: () ->
    console.log 'scroll'
  
