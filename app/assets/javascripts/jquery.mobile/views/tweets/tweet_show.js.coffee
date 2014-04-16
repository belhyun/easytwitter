class Mifd.Views.TweetShow extends Backbone.View
  el:"body"
  template: JST['jquery.mobile/templates/tweets/show']
  events:
    "click .main-tweet-actions span.retweet":'retweet'
    "click .main-tweet-actions span.favorite":'favorite'
    "click .main-tweet-container #tweet-main .follow-button-container .w-button-follow" : "follow"
    "click #login-ok" : "login"
  login: ->
    e.preventDefault()
    alert 1
  initialize: ->
    #get model data
    #window.onpopstate = (e) ->
    #window.location.href = "/"
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"
  render: ->
    #$(@el).html(@template({user:@.model.get('user'), tweet:@.model.attributes}))
  retweet: (e)->
    e.preventDefault()
    if _.isNull(@model.get('user'))
      ceres.CK.set('referer', encodeURI(document.URL))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'R', @model.get('tweet').id_str, () ->
        $(e.currentTarget).find('img').attr("src","/assets/jquery.mobile/1396851700_retweet.png")
        $(e.currentTarget).find('span').removeClass("retweet").addClass("retweeted")
      )
  favorite: (e) ->
    e.preventDefault()
    if _.isNull(@model.get('user'))
      ceres.CK.set('referer', encodeURI(document.URL))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'F', @model.get('tweet').id_str, () ->
        $(e.currentTarget).find('img').attr("src","/assets/jquery.mobile/1396851385_keditbookmarks.png")
        $(e.currentTarget).find('span').removeClass('favorite').addClass('favorited')
      )
  follow: (e) ->
    e.preventDefault()
    if _.isNull(@model.get('user'))
      ceres.CK.set('referer', encodeURI(document.URL))
      $("#are-you-login").popup({
      }).popup("open")
    else
      Backbone.ajax(
        type:'post'
        dataType: 'json'
        url: '/api/v1/users/follow'
        data: {f_id:@model.get('tweet').user.id}
        success: (resp)->
          if resp.result == 1
            $(".w-button-follow").fadeOut(100)
      )
