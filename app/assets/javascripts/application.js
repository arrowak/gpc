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
//= require_tree .

$.fn.getPreText = function () {
    var ce = $("<pre />").html(this.html());
    if ($.browser.webkit)
      ce.find("div").replaceWith(function() { return "\n" + this.innerHTML; });
    if ($.browser.msie)
      ce.find("p").replaceWith(function() { return this.innerHTML + "<br>"; });
    if ($.browser.mozilla || $.browser.opera || $.browser.msie)
      ce.find("br").replaceWith("\n");
  	console.log(ce.text());
    return ce.text();
};

function format_pre_chat_msg(msg){
	var ce = $("<pre />").html(msg);
    if ($.browser.webkit)
      ce.find("div").replaceWith(function() { return "\n" + this.innerHTML; });
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
