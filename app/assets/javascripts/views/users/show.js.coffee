class Mifd.Views.Show extends Backbone.View
  el: '#profile-pop'
  initialize: ->
  events:
    'click #right-side>button.follow': 'follow'
  follow: ->
    if(!gon.current_user)
      if(confirm "트위터 로그인 하시겠습니까?")
        location.href = "/auth/twitter"
        return
    else
      @.collection.follow()
