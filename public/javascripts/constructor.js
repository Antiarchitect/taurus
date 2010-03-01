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

function removeGrid(id) {
  $('grid_' + id).fade({duration: 0.5});
  function remove() {
    $('grid_' + id).remove();
  }
  setTimeout(remove, 500);
}