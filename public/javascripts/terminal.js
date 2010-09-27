jQuery(document).ready(function($){
    $('.number').click(function() {
        $('#group_name_input_terminal').focus();
        character = $(this).attr('id');
        $('#group_name_input_terminal').val($('#group_name_input_terminal').val() + character);
        $('#group_name_input_terminal').autocomplete("search");
    });

    $('.clear').click(function(){
        $('#group_name_input_terminal').val('');
    });

    $('.back_terminal').button({
        label: 'Назад'
    });

    $(".back_terminal").click(function() {
        window.location.replace('/timetable/groups?terminal=true');
        return false;
    });

    $('.number').button({
       
    })

    $('.clear').button({

    })
});


