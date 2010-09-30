jQuery(document).ready(function($){
    // makes Rails to know that jQuery Ajax requests should be processed as .js format
    $.ajaxSetup({
        'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });

    $('#plus').click(function(){
        $.get('/editor/classrooms/new', null, null, "script");
        return false;
    });

    $('.receiver').live('dblclick', function() {
        $.post('/editor/pairs/', {
            container: $(this).attr('id'),
            classroom_id: $(this).attr('grid_id'),
            week: $(this).attr('week_number'),
            day_of_the_week: $(this).attr('day_of_the_week'),
            pair_number: $(this).attr('pair_number')
        }, null, "script");
        return false;
    });

    $('.edit').live('click', function() {
      $.get('/editor/pairs/' + $(this).attr('pair_id') + '/edit', null, "script");
      return false;
    });

    $('.destroy').live('click', function() {
      $(this).after('<span id="destroy-confirm">Вы уверены в том, что хотите удалить эту пару?</span>');
      $('#destroy-confirm').dialog({
        resizable: false,
        height: 140,
        width: 450,
  			modal: true,
        buttons: {
          "Удалить!": function() {
            $.post('/editor/pairs/' + $(this).attr('pair_id'), {_method: 'delete'}, null, "script");
  					$('#destroy-confirm').dialog( "close" );
            $('#destroy-confirm').dialog( "destroy" );
          },
          "Отмена": function() {
  					$('#destroy-confirm').dialog( "close" );
            $('#destroy-confirm').dialog( "destroy" );
          }
        }
		  });
    });
    

    $('#form_close').live('click', function() {
        $('#form').fadeOut('fast');
        return false;
    });

    $('.grid_close').live('click', function() {
        $.post('/editor/classrooms/' + $(this).attr('grid_id'), {_method: 'delete'}, null, "script");
        return false;
    });

    
        $('#group_name_input, #group_name_input_terminal').focus();
        $('#group_name_input, #group_name_input_terminal').autocomplete({
            minLength: 2,
            source: function(request, response) {
                $.getJSON('/timetable/groups.json', {
                    group: request.term
                },
                function(data) {
                    var groups = new Array(0);
                    data.each(function(i) {
                        groups.push({ label: i.group.name, value: i.group.id });
                    });
                    response(groups);
                });
            },
            select: function(event, ui) {
                if ($(this).attr('id') == "group_name_input_terminal") {
                  var suffix = "?terminal=true";
                } else {
                  var suffix = "";
                }
                window.location.replace('/timetable/groups/' + ui.item.value + suffix);
                return false;
            }
        });
});