class ClassroomsConstructorsController < ConstructorsController
  def add_grid
    @grid = Classroom.first(:conditions => {:id => params[:pairs][:classroom]})
    @pairs = @grid.pairs
  end
end