$( document ).ready(function() {
  $('.upvote').on('click', upvote)
});

var upvote = (function(event) {
  event.preventDefault();
  console.log($('a.upvote'))
  // $.ajax({
  //   url :
  // })
});
