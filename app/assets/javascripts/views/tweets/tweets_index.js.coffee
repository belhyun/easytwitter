class Mifd.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']
  el: 'body'
  events:
    'click .tweet-actions li .retweet,.tweet-actions li .favorite': 'tweet_action'
    'click .tweet-items .content .header img': 'user_profile'
    'click #global-nav-me a.login img': 'login'
  initialize: ->
    $("img").error ->
      $(this).attr "src","/assets/designer.jpg"
    (->
      $("div.selectBox").each ->
        that = $(this)
        that.children("span.selected").html that.children("div.selectOptions").find("a:nth-child("+gon.type+") span.selectOption:first").html()
        that.attr "value", that.children("div.selectOptions").find("a:nth-child("+gon.type+")span.selectOption:first").attr("value")
        that.children("span.selected,span.selectArrow").click ->
          that = $(this)
          if that.parent().children("div.selectOptions").css("display") is "none"
            that.parent().children("div.selectOptions").css "display", "block"
          else
            that.parent().children("div.selectOptions").css "display", "none"
          return
        that.find("span.selectOption").click ->
          that = $(this)
          that.parent().css "display", "none"
          that.closest("div.selectBox").attr "value", that.attr("value")
          that.parent().siblings("span.selected").html that.html()
          $(".content-main .content-header .header-inner").removeAttr("style")
          return
        return
      return
    )()
  user_profile: (event) ->
    $("#spinner,#modal").css("display","block")
    tweet = @collection.at($(event.currentTarget).parents('.content').parent('li').index())
    template = _.template('http://'+document.location.host+"/users/<%= uuid %>")
    Backbone.ajax(
      type:'get'
      dataType: 'html'
      url: template({uuid:tweet.attributes.user.uuid})
      success: (html)->
        $("#spinner,#modal").css("display","none")
        $("<div></div>").html(html).dialog(
          modal:true
          title:'Profile summary'
          width:600
          height:400
          open: ->
            $("#right-side *").blur()
            window.Mifd.Routers.router.profile()
        )
    )
  mifd_dialog: (id, ok, cancel) ->
    $(id).dialog
      resizable: false
      height: 180
      modal: true
      buttons:
        Ok: ->
          ok $(this)
        Cancel: ->
          $(this).dialog "close"
  is_login: ->
    @.mifd_dialog "#dialog-confirm",(->
      ceres.CK.set('referer', encodeURI(document.URL))
      location.href = "/auth/twitter"
    )
  login: (event) ->
    event.preventDefault()
    @.is_login()
  already_request: ->
    @.mifd_dialog "#dialog-already",(that)->
      that.dialog.call that , "close"
  tweet_action: (event) ->
    event.preventDefault()
    that = this
    if(!gon.current_user)
      @.is_login()
    else
      index = $(event.currentTarget).parents('.content').parent('li').index()
      tweet = @collection.at(index)
      chk = (if ($(event.currentTarget).attr("class") is "retweet") then "is_retweet" else "is_favorite")
      if(!tweet.get(chk))
        user_tweet = new Mifd.Models.UserTweet(
          user_desc: gon.current_user.screen_name
          type:(if $(event.currentTarget).attr("class") is "retweet" then "R" else "F")
          tweet_uuid:tweet.get('uuid')
        )
        $("#spinner,#modal").css("display","block")
        user_tweet.save null,
          success: (model,response) ->
            $("#spinner,#modal").css("display","none")
            $(event.currentTarget).remove()
            if(Number(response.result))
              if chk == 'is_retweet'
                tweet.set
                  'is_retweet': true
              else
                tweet.set
                 'is_favorite': true
              that.mifd_dialog "#dialog-success",(that)->
                that.dialog.call that , "close"
            else
              @.already_request()
       else
         $("#spinner,#modal").css("display","none")
         @.already_request()
