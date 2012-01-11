$(document).ready(function() {
     gd = new Date();
     y  = gd.getFullYear();
     m  = gd.getMonth();
     d  = gd.getDate();
    $('#calendar').fullCalendar({
      weekends: false,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      editable: true,
      dayClick: function(date, allDay, jsEvent, view) {
        d = date.getDate();
        m = date.getMonth();
        Y = date.getFullYear();
        H = date.getHours();
        M = date.getMinutes();
        day   = new Date(Y, m, d)
        hours = new Date(Y, m, d, H, M)
        $('#turn_day').val(day);
        $('#turn_hour').val(hours);
        $('#add_turn').dialog({title: 'Add a New Turn', close:'close'});
      },
      events: loadEvents()
    });

});

function loadEvents(){

   var events = []
   $('.event').each(function(index, e){
     turn = $(e)
     events[index] = {
       title: turn.attr('data_client'), 
       start: turn.attr('data_date_start'),
       end: turn.attr('data_date_end')
     }
   })
   return events;
}
