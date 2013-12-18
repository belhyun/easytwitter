function ClipBoard() 
{
  var strongs = document.getElementsByTagName("span");
  var s = window.getSelection();

  if(s.rangeCount > 0) s.removeAllRanges();

  for(var i = 0; i < strongs.length; i++) {
    var range = document.createRange();
    range.selectNode(strongs[i]);
    s.addRange(range);
  }
}
$('#copytext').longpress(function() {
  alert('You just longpress-ed a button.');
});

