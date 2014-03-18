class Mifd.Collections.Users extends Backbone.Collection
  model: Mifd.Models.User
  url: '/users'
  initialize: (users)->
    _.map(users, (user)->
      user.id = user.uuid if _.has(user, 'uuid')
    )
  follow: ->
    Backbone.ajax(
      type:'post'
      dataType: 'json'
      url: @.url + '/follow'
      data: {f_id:@.at(0).id}
      success: ()->
    )
