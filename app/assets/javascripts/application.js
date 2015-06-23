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


/* You're on the right track here... */
