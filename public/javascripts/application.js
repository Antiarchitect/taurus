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
            week_number: $(this).attr('week_number'),
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
      $.post('/editor/pairs/' + $(this).attr('pair_id'), {_method: 'delete'}, null, "script");
      return false;
    });

    $('#form_close').live('click', function() {
        $('#form').fadeOut('fast');
        return false;
    });

    $('.grid_close').live('click', function() {
        $.post('/editor/classrooms/' + $(this).attr('grid_id'), {_method: 'delete'}, null, "script");
        return false;
    });

    if ($('#group_name_input').length > 0) {
        $('#group_name_input').focus();
        $.getJSON('/timetable/groups.json', function(data) {
            var groups = new Array(0);
            data.each(function(i) {
                groups.push({ label: i.group.name, value: i.group.id });
            });
            
            $('#group_name_input').autocomplete({
                source: groups,
                select: function(event, ui) {
                    window.location.replace('/timetable/groups/' + ui.item.value);
                    return false;
                }
            });
        });
    }
});