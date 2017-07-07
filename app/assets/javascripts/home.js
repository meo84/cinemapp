$(function() {
  $('.home__card').click(function() {
    $(this).children('.card__front').toggle();
    var cardBack = $(this).children('.card__back');
    if(cardBack.css('display') == 'none') {
      cardBack.css('display', 'flex');
    } else {
      cardBack.css('display', 'none');
    }
  });
});
