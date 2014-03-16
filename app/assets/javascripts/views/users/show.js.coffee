class Mifd.Views.Show extends Backbone.View
  el: 'body'
  initialize: ->
  events:
    'click #right-side>button.follow': 'follow'
  follow: ->
    if(!gon.current_user)
      if(confirm "트위터 로그인 하시겠습니까?")
        location.href = "/auth/twitter"
        return
    else
      console.log gon.tweet_user
      console.log gon.current_user 
