jQuery(document).ready(function($){
    $('.number').click(function() {
        $('#group_name_input_terminal').focus();
        character = $(this).attr('id');
        $('#group_name_input_terminal').val($('#group_name_input_terminal').val() + character);
        $('#group_name_input_terminal').change();
        $('#group_name_input_terminal').autocomplete("search");
    });

    $('.clear').click(function(){
        $('#group_name_input_terminal').val('');
        $('#group_name_input_terminal').change();
    });

    $('.backspace').click(function() {
        var input =  $('#group_name_input_terminal');
        var group = input.val();
        input.val(group.slice(0,-1));
        input.change();
        input.focus();
        input.autocomplete("search");
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

    $('.backspace').button({

    })

    $('.daycellcontainer').click(function(){
     var content = $(this).clone();
     content.addClass('pairdialog');
     content.dialog({
        modal: true,
        width: 800,
        buttons: {
        	'Закрыть': function() {
        		$(this).dialog("close");
        	}
        }
    	});
    });
});
