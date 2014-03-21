class Mifd.Collections.Users extends Backbone.Collection
  model: Mifd.Models.User
  url: '/api/v1/users'
  initialize: (users)->
    _.map(users, (user)->
      if(_.isEmpty(user))
        return
      user.id = user.uuid if _.has(user, 'uuid')
    )
  follow: ->
    $("#spinner,#modal").css("display","block")
    Backbone.ajax(
      type:'post'
      dataType: 'json'
      url: @.url + '/follow'
      data: {f_id:@.at(0).id}
      success: (resp)->
        $("#spinner,#modal").css("display","none")
        if resp.result == 1
          $(".follow").fadeOut(1000)
    )
