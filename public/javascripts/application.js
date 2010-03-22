//function AddClassroomDrop(id, grid, week, day, time) {
//  Droppables.add(id, {
//    accept: 'pair',
//    hoverclass : 'hovered_receiver',
//    onDrop: function(pair, receiver) {
//      new Ajax.Request(
//        '/pairs/'+pair.id+'/update_on_drop', {
//          method : 'put',
//          parameters : {
//            classroom : grid,
//            week : week,
//            day : day,
//            time : time,
//            container : receiver.id
//          }
//        }
//      );
//    }
//  });
//}

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