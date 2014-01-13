mifd_dialog = (id, ok, cancel) ->
  $(id).dialog(ok, cancel) ->
    resizable: false
    height: 180
    modal: true
    buttons:
      Ok: ->
        ok#$(this).dialog "close"
      Cancel: ->
        cancel#$(this).dialog "close"
