class Mifd.Views.TweetShow extends Backbone.View
  el:"div[data-role='content']"
  template: JST['jquery.mobile/templates/tweets/show']
  events:
    "click .main-tweet-actions span.retweet":'retweet'
    "click .main-tweet-actions span.favorite":'favorite'
    "click .main-tweet-container #tweet-main .follow-button-container .w-button-follow" : "follow"
    "click #main-title" : "main"
  main: ->
    alert 1
  initialize: ->
    #get model data
    #window.onpopstate = (e) ->
    #window.location.href = "/"
  render: ->
    #$(@el).html(@template({user:@.model.get('user'), tweet:@.model.attributes}))
  retweet: (e)->
    e.preventDefault()
    alert "준비중입니다."
    return
    if _.isNull(@model.get('user'))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'R', @model.get('tweet').id_str, () ->
        $(e.currentTarget).text('Retweeted').removeClass("retweet").addClass("retweeted")
      )
  favorite: (e) ->
    e.preventDefault()
    alert "준비중입니다."
    return
    if _.isUndefined(@model.get('user'))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'F', @model.get('tweet').id_str, () ->
        $(e.currentTarget).text('Favorited').removeClass("favorite").addClass("favorited")
      )
  follow: (e) ->
    alert "준비중입니다."
    return
