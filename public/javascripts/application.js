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

function AddClassroomsDrops(grid, weeks, days, times) {
    for(week = 0; week < weeks; week++) {
        for (day = 0; day < days; day++) {
            for (time = 0; time < times; time++ ) {
                Droppables.add('container_grid'+ grid + '_week' + week + '_day' + day + '_time' + time, {
                    accept: 'pair',
                    hoverclass : 'hovered_receiver',
                    name : name,
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