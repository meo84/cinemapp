$(function() {
  $('html').on('change', '.new_movie select#movie_event_ids.chosen', function(){

    $.get("/movies/new", function(data) {
      var chosenEventID = $('#movie_event_ids').val();
      var chosenEvent = data.find(function(event){ return event["id"] == chosenEventID; });
      var chosenEventImageURL = chosenEvent["first_image_url"];
      $('#movie_poster_url').val(chosenEventImageURL);
    })
    .error(function() {
      console.log("there was an error fetching the movie poster URL");
    });
  });
});
