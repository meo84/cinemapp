$(function() {
  $('html').on('change', 'select#movie_event_ids.chosen', function(){
    var form = $(this).parent('form');

    $.ajax({
      type: "GET",
      url: form.attr('action') + "/new",
      success: function(data){
        var chosenEventID = $('#movie_event_ids').val();
        var chosenEvent = data.find(function(event){ return event["id"] == chosenEventID; });
        var chosenEventImageURL = chosenEvent["first_image_url"];
        $('#movie_poster_url').val(chosenEventImageURL);
      },
      error: function(){
        console.log('error during ajax call fetching poster url from event');
      }
    });
  });
});
