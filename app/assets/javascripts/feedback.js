// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $(".stats-bar").each(function(index, node) {
    var $node = $(node)
    var $progress = $node.find(".stats-value");
    var width = $node.data('value') / $node.data('total') * $node.width() 
    $progress.css({
      width: width,
      height: 'inherit',
      background: '#098F6D'
    });
  });
});
