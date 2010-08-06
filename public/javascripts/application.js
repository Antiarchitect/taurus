jQuery(document).ready(function ($){
    // makes Rails to know that jQuery Ajax requests should be processed as .js format
    jQuery.ajaxSetup({
        'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });
    $('#plus').click(function (){
        $.get('classrooms_grids/new', null, null, "script");
    });
});

function AddClassroomDrops(grid, weeks, days, times) {
    var drop = function(week, day, time) {
        Droppables.add('container_grid'+ grid + '_week' + week + '_day' + day + '_time' + time, {
            accept: 'pair',
            hoverclass : 'hovered_receiver',
            onDrop: function(pair, receiver) {
                new Ajax.Request(
                    '/pairs/'+pair.id+'/update_on_drop', {
                        method : 'put',
                        parameters : {
                            classroom : grid,
                            week : week,
                            day : day,
                            time : time,
                            container : receiver.id
                        }
                    }
                );
            }
        });
    }
    for(week = 1; week <= weeks; week++) {
        for (day = 1; day <= days; day++) {
            for (time = 1; time <= times; time++ ) {
              drop(week, day, time);
            }
        }
    }
}
function AddPairDraggable(pair_id) {
    new Draggable(pair_id);
}
function AddPairsDraggables(pair_ids) {
    for(i = 0; i < pair_ids.length; i++) {
        AddPairDraggable(pair_ids[i]);
    }
}

function CreatePairFromClassroom(container, grid, week, day, time) {
  new Ajax.Request(
    '/pairs/', {
      method: 'post',
      parameters : {
        container : container,
        classroom : grid,
        week : week,
        day : day,
        time : time,
        pov : 'classroom'
      }
    }
  )
}