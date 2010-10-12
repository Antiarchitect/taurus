jQuery(document).ready(function($){
    // makes Rails to know that jQuery Ajax requests should be processed as .js format
    $.ajaxSetup({
        'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });

    // editor/classrooms/index
    $('#classroom_name').autocomplete({
        disabled: false,
        source: function(request, response) {
            $.getJSON('/editor/classrooms.json', {
              classroom: request.term
            },
            function(data) {
                var classrooms = new Array(0);
                data.each(function(i) {
                    classrooms.push({ label: i.classroom.name + ' (' + i.classroom.building.name + ')', value: i.classroom.id });
                });
                response(classrooms);
            });
        },
        select: function(event, ui) {
          $.get('/editor/classrooms/' + ui.item.value);
          return false;
        }
    });

    $('#classroom_name').focus();

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
      var pair_id = $(this).attr('pair_id');
      $(this).after('<span id="destroy-confirm">Вы уверены в том, что хотите удалить эту пару?</span>');
      $('#destroy-confirm').dialog({
        resizable: false,
        height: 140,
        width: 450,
  			modal: true,
        buttons: {
          "Удалить!": function() {
            $.post('/editor/pairs/' + pair_id, {_method: 'delete'}, null, "script");
            $('#destroy-confirm').dialog( "close" );
            $('#destroy-confirm').remove();
          },
          "Отмена": function() {
  					$('#destroy-confirm').dialog( "close" );
            $('#destroy-confirm').remove();
          }
        }
		  });
    });

    $('.grid_close').live('click', function() {
        $.post('/editor/classrooms/' + $(this).attr('grid_id'), {_method: 'delete'}, null, "script");
        return false;
    });

    function showErrorNotify (text) {
        $('<div>', {
                        id: 'error_notify'
                    }).text(text).appendTo('body')
                    .position({
                        my: 'center top',
                        at: 'center bottom',
                        of: '.group_name_input'
                    }).slideDown().delay(10000).slideUp();
    };

    $('#group_name_input, #group_name_input_terminal').focus();
    $('#group_name_input, #group_name_input_terminal').autocomplete({
        minLength: 2,
        focus: function(event, ui) {
          return false;
        },
        source: function(request, response) {
            // Pre-query interface preparations
            $('<img />', {
                src: '/images/loading_16.png',
                alt: '',
                id: 'loading_spinner'
            }).appendTo('body').position({
                my: 'right center',
                at: 'right center',
                of: '.group_name_input'
            });
            // Querying for group list
            $.ajax({
                url: '/timetable/groups.json',
                data: {group: request.term},
                dataType: 'json',
                timeout: 5000,
                success: function(data, status) {
                    if (data === null)
                        showErrorNotify("Произошла ошибка: не удалось загрузить список групп, попробуйте чуть позже.");
                    var label_addon = " ← нажать";
                    response($.map( data, function( item ) {
                        return {
                            label: item.group.name + label_addon,
                            value: item.group.id
                        }
                    }));
                },
                error: function(xhr, status) {
                    showErrorNotify("Произошла ошибка: не удалось загрузить список групп, попробуйте чуть позже.");
                },
                complete: function(xhr, status) {
                    $('#loading_spinner').remove();
                }
            });
        },
        select: function(event, ui) {
            var suffix = "";
            if ($(this).attr('id') == "group_name_input_terminal") {
              suffix = "?terminal=true";
            }
            window.location.replace('/timetable/groups/' + ui.item.value + suffix);
            return false;
        }
    });
});