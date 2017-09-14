"use strict";

$(document).ready(function(){
  var postLinks = $(".posts");
  postLinks.hide();

  var firstDiv = $('.in-the-middle');
  var secondDiv = $('.of-all-of-it');
  var firstSet = firstDiv.children();
  var secondSet = secondDiv.children();
  var footer = $('footer');
  firstSet.hide();
  secondSet.hide();
  footer.hide();

  $("span").each(function(index){
    $(this).delay(150*index).fadeIn(1500);
  })

  setTimeout(function(){
    postLinks.fadeIn(1000);
    footer.fadeIn(1000);
  }, 4500);

  //Hide flash after 2 secs
  setTimeout(function(){
    $('#flash_notice').hide();
  }, 2000);
});
