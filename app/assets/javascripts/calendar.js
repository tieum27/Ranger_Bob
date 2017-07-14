$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
      header: { center: 'month,agendaWeek' }, // buttons for switching between views
          events: "/sigthings/get_events",
            timeFormat: "LT",
            eventClick: function(event) {
             if (event.url) {
                 window.open(event.url);
                 return false;
               }
            }

            [
    {
        "id": "region1",
        "color": "#00FF00"
    },
    {
        "id": "region2",
        "color": "#FF0000"
    }
]

    });
});
