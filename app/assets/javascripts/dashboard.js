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
        $('#time_for_turn').html("Date: "+d+'-'+(m + 1)+'-'+Y+' ' + H + ':' + M + ' hs.');
        $('#add_turn').dialog({title: 'Add a New Turn', close:'close', width: '250', height: '250'});
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
       end: turn.attr('data_date_end'),
       allDay: false
     }
   })
   return events;
}
