function AddClassroomDrop(id, grid, week, day, time) {
  Droppables.add(id, {
    accept: 'pair',
    hoverclass : 'hovered_receiver',
    onDrop: function(element) {
      new Ajax.Request(
        '/pairs/'+element.id, {
          method : 'put',
          parameters : 'classroom=' + grid + '&week=' + week + '&day=' + day + '&time=' + time
        }
      );
    }
  });
}
