document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'pt-br',
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        navLinks: true, // can click day/week names to navigate views
        businessHours: true, // display business hours       
        editable: true,
        eventLimit: true,
        events: 'list_eventos.php',
        extraParams: function () {
            return{
                cachebuster: new Date().valueOf()
            };
        },
        eventClick: function (info) {
            info.jsEvent.preventDefault(); 
            $('#visualizarConsulta #id').text(info.event.id);
            $('#visualizarConsulta #title').text(info.event.title);
            $('#visualizarConsulta #start').text(info.event.start.toLocaleString());
            $('#visualizarConsulta #end').text(info.event.end.toLocaleString());
            $('#visualizarConsulta').modal('show');
        },
        selectable: true, //posso selecionar o dia na agenda
        select: function (info){
            //alert('Data Consulta: '+info.start.getFullYear()); //Pega Ano
            // alert('Data Consulta: '+info.start.getMonth()); //Pega um Array mês exe 0=janeiro/1=fevereiro
            //alert('Data Consulta: '+info.start.getDate()); //Pega data
           // alert('Data Consulta: '+info.start.toLocaleString());
           // $('#cadastrar #start').val(info.start.toLocaleString());
           // $('#cadastrar #end').val(info.end.toLocaleString());
            $('#cadastrar').modal('show');
        }

    });

    calendar.render();
});



