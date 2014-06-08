// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-migrate-min
//= require jquery_ujs
//= require jquery.remotipart.js
//= require_tree .

BASE_ANIMATION_DURATION = 200;

$.fn.getPreText = function () {
    var ce = $("<pre />").html(this.html());
    if ($.browser.webkit)
      ce.find("div").replaceWith(function() { return "\n" + this.innerHTML; });
    if ($.browser.msie)
      ce.find("p").replaceWith(function() { return this.innerHTML + "<br>"; });
    if ($.browser.mozilla || $.browser.opera || $.browser.msie){
      alert(":::")
      console.log(ce.find('br'))
      ce.find("br").replaceWith("\n");
    }
      
  	console.log(ce.text());
    return ce.text();
};

function format_pre_chat_msg(msg){
	var ce = $("<pre />").html(msg);
    if ($.browser.webkit)
      ce.find("br").replaceWith(function() { return "\n" + this.innerHTML; });
    if ($.browser.msie)
      ce.find("p").replaceWith(function() { return this.innerHTML + "<br>"; });
    if ($.browser.mozilla || $.browser.opera || $.browser.msie)
      ce.find("br").replaceWith("\n");
  	console.log(ce.text());
    return ce.text();
}


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}


/* Modal Functions */
var modal_load = function(data){
  var modal = $('#modal');
  var modalClose = $('#modalClose');
  modal.empty();
  modal.html(data);
  modal.animate({
    "left": "5%"
  }, BASE_ANIMATION_DURATION);
  modalClose.animate({
    "right": "0%"
  }, BASE_ANIMATION_DURATION);
};

var modal_close = function(){
  var modal = $('#modal');
  var modalClose = $('#modalClose');
  modal.animate({
    "left": "115%"
  }, BASE_ANIMATION_DURATION);
   modalClose.animate({
    "right": "-115%"
  }, BASE_ANIMATION_DURATION);
  modal.empty();
};
/* Modal Functions End */

/* Loader Functions */
var show_loader = function(text){
  if(typeof text === 'undefined')
  {
    text = "Loading...";
  }

  $('.loaderContent').html(text);
  show_backdrop();
  $('#loader').hide().fadeIn(BASE_ANIMATION_DURATION);
};

var hide_loader = function(){
  $('.loaderContent').empty();
  $('#loader').show().fadeOut(BASE_ANIMATION_DURATION);
  hide_backdrop();
};
/* Loader Functions End */

/* Backdrop Functions */
var show_backdrop = function(){
  $('#backdrop').hide().fadeIn(BASE_ANIMATION_DURATION);
};

var hide_backdrop = function(){
  $('#backdrop').show().fadeOut(BASE_ANIMATION_DURATION);
};
/* Backdrop Functions End */


/* Prompt Functions */
var prompt_load = function(data){
  show_loader();
  var modal = $('.outerPrompt');
  var innerPrompt = $('.innerPrompt');
  innerPrompt.empty();
  innerPrompt.html(data);
  modal.hide().animate({
    opacity: "1"
  },BASE_ANIMATION_DURATION);
  modal.css('display','table');
};

var prompt_close = function(){
  var modal = $('.outerPrompt');
  var innerPrompt = $('.innerPrompt');
  modal.show().animate({
    display:"none",
    opacity: "0"
  },BASE_ANIMATION_DURATION, function(){
    innerPrompt.empty();
  });
  hide_loader();
};
/* Prompt Functions End */
