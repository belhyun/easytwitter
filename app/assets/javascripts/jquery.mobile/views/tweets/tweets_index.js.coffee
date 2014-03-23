class Mifd.Views.TweetsIndex extends Backbone.View
  el: 'body .ui-content'
  initialize: ->
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"
