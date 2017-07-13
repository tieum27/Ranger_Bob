
$("document").ready(function() {

  $("#add_new_sigthing_button").on(
    "click",
    function(e) {
      e.preventDefault();
      // Data to be submitted
      newSigthing = {
        "sigthing": {
          "date": $("#sigthing_date").val(),
          "time": $("#sigthing_time").val() + "-01-01 00:00:00 UTC",
          "region": $("#sigthing_region").val(),
          "latitude": $("#sigthing_latitude").val(),
          "longitude": $("#sigthing_longitude").val(),
          "animal_id": $("#animal_id").val()
        }
      }
      alert(newSigthing);
      $.ajax({
        dataType: 'json',
        url: '/sigthings',
        method: 'POST',
        data: newSigthing,

        success: function(dataFromServer) {

          add_to_sigthing_list(dataFromServer);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new sighting failed: " + errorThrown);
        }
      });
  });// end add wine

}); // end document ready

// Function to be called after data has been successfully submitted
function add_to_sigthing_list(data) {
  $("#sigthing_list").append(
    '<li><a href="' + '/sigthings/' + data.id + '">' + data.date + "</a></li>");
}
