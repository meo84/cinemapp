$(function() {
  $('.card').click(function() {
    //toggle what-front
    $(this).children('.card-front').toggle();
    //toggle what-back
    $(this).children('.card-back').toggle();
  });

  $('.where').click(function() {
    $(this).hide();
    $('#chartdiv').show();
  });

});
