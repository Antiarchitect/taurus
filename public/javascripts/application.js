function AddClassroomDrop(id, grid, week, day, time) {
  Droppables.add(id, {
    accept: 'pair',
    hoverclass : 'hovered_receiver',
    onDrop: function(pair, receiver) {
      new Ajax.Request(
        '/pairs/'+pair.id, {
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