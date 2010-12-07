jQuery(document).ready(function($) {
    // makes Rails to know that jQuery Ajax requests should be processed as .js format
    $.ajaxSetup({
        'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });

    // editor/classrooms/index
    $('#classroom_name').change(function() {
      $(this).autocomplete('disable'); // These two lines fixes bug with simultaneously
      $(this).autocomplete('enable'); // opening two same auditories at once (on fast clicking)
    });

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

    $('.classroom_row').click(function() {
      window.open('/editor/classrooms?classroom_id=' + $(this).attr('id'));
      return false;
    });

    $('#group_name').autocomplete({
        disabled: false,
        source: function(request, response) {
            $.getJSON('/editor/groups_list.json', {}, function(data) {
                var groups = new Array(0);
                data.each(function(i) {
                    groups.push(i.group.id);
                });
                $.getJSON('/editor/groups.json', {
                    group: request.term,
                    except: groups
                },
                function(data) {
                    var groups = new Array(0);
                    data.each(function(i) {
                        groups.push({ label: i.group.name, value: i.group.id });
                    });
                    response(groups);
                });
            });
        },
        select: function(event, ui) {
            $.post('/editor/groups_list/groups', {id : ui.item.value});
            $('#group_name').val('');
            return false;
        }
    });

    $('.remove').live('click', function() {
        var group_id = $(this).attr('group_id');
        $.post('/editor/groups_list/groups/' + group_id, {_method: 'delete'});
        $('#group_name').focus();
    });
});

