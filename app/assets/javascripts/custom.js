"use strict";

$(document).ready(function(){
  var postLinks = $(".posts");
  postLinks.hide();

  var firstDiv = $('.in-the-middle');
  var secondDiv = $('.of-all-of-it');
  var firstSet = firstDiv.children();
  var secondSet = secondDiv.children();
  firstSet.hide();
  secondSet.hide();

  $("span").each(function(index){
    $(this).delay(150*index).fadeIn(1500);
  })

  setTimeout(function(){
    postLinks.fadeIn(1000);
  }, 4500);

  //Hide flash after 2 secs
  setTimeout(function(){
    $('.flash-message').hide();
  }, 2000);

  $("button").click(function(){
    $(".navbar-collapse").toggleClass("collapse");
  })
});
