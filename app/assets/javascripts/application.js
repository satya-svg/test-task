// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .



$(document).ready(function(){
  $(".tweet").click(function(event){
   	if(event.target.dataset.type === "follow"){
   		follow(event)
   	}else{
   	 	unfollow(event)
   	}
  })
})

function follow(event){
  $.ajax({
 	   url: "/api/v1/tweet_follow/follow",
 	   method: "get",
 	   data: {id: event.target.dataset.id},
 	   dataType: 'json',
 	   success: function(data){
 	   	elm = $(".userf"+event.target.dataset.id)
 	   	elm.attr('data-type',"unfollow")
 	   	elm.text("unfollow")
 	   },
 	   error: function(error){
 	   }
 	 })
}

function unfollow(event){
	$.ajax({
 	   url: "/api/v1/tweet_follow/unfollow",
 	   method: "get",
 	   data: {id: event.target.dataset.id},
 	   dataType: 'json',
 	   success: function(data){
 	   	elm = $(".userf"+event.target.dataset.id)

 	   	elm.attr('data-type',"follow")
 	   	elm.text("follow")
 	   
 	   },
 	   error: function(error){
 	   }
 	 })
}