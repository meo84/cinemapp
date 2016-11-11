$(function() {
	$('.card').click(function() {
	  //toggle what-front
	  $(this).children('.card-front').toggle();
	  //toggle what-back
	  $(this).children('.card-back').toggle();
	});
});