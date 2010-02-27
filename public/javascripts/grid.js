function AddClassroomDrop(id, grid, week, day, time) {
  Droppables.add(id, {
    accept: 'pair',
    hoverclass : 'hovered_receiver',
    onDrop: function(pair, receiver) {
      new Ajax.Request(
        '/pairs/'+pair.id, {
          method : 'put',
          parameters : 'grid=' + grid + '&week=' + week + '&day=' + day + '&time=' + time + '&container=' + receiver.id
        }
      );
    }
  });
}
